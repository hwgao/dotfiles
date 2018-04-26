# ex: ts=4
import os
import os.path
import logging
import ycm_core

# Can add absolute include path here
BASE_C_FLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-ferror-limit=10000',
    '-DNDEBUG',
    '-xc'
]

BASE_CPP_FLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-ferror-limit=10000',
    '-DNDEBUG',
    '-std=c++11',
    '-xc++'
]

NEAREST_INC_FLAGS = [
    'include',
    'inc'
]

# Must be absolute paths
SYS_INC_FLAGS = [
    '/usr/include/',
    '/usr/include/glib-2.0',
    '/usr/local/include'
]

SOURCE_EXTENSIONS = [
    '.cpp',
    '.cxx',
    '.cc',
    '.c',
    '.C'
]

SOURCE_C_EXTENSIONS = [
    '.c'
]

HEADER_EXTENSIONS = [
    '.h',
    '.H',
    '.hxx',
    '.hpp',
    '.hh'
]


def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in HEADER_EXTENSIONS

def IsCFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in SOURCE_C_EXTENSIONS


def GetCompilationInfoForFile(database, filename):
    if IsHeaderFile(filename):
        basename = os.path.splitext(filename)[0]
        for extension in SOURCE_EXTENSIONS:
            replacement_file = basename + extension
            if os.path.exists(replacement_file):
                compilation_info = database.GetCompilationInfoForFile(
                    replacement_file)
                if compilation_info.compiler_flags_:
                    return compilation_info
        return None
    return database.GetCompilationInfoForFile(filename)


def FindNearest(path, target):
    candidate = os.path.join(path, target)
    if(os.path.isfile(candidate) or os.path.isdir(candidate)):
        logging.info("Found nearest " + target + " at " + candidate)
        return candidate
    else:
        parent = os.path.dirname(os.path.abspath(path))
        if(parent == path):
            raise RuntimeError("Could not find " + target)
        return FindNearest(parent, target)


def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return list(flags)
    new_flags = []
    make_next_absolute = False
    path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append(new_flag)
    return new_flags


def FlagsForClangComplete(root):
    try:
        clang_complete_path = FindNearest(root, '.clang_complete')
        clang_complete_flags = open(
            clang_complete_path, 'r').read().splitlines()
        return clang_complete_flags
    except:
        return None


def FlagsForR(root):
    suffix = "**"
    flags = []
    if root.endswith(suffix):
        root = root.rstrip(suffix)
        flags += ["-I" + root]
    else:
        flags += ["-I" + root]
        return flags

    for dirroot, dirnames, filenames in os.walk(root):
        for dir_path in dirnames:
            real_path = os.path.join(dirroot, dir_path)
            flags += ["-I" + real_path]
    return flags


def FlagsForCompilationDatabase(root, filename):
    try:
        compilation_db_path = FindNearest(root, 'compile_commands.json')
        compilation_db_dir = os.path.dirname(compilation_db_path)
        logging.info("Set compilation database directory to " +
                     compilation_db_dir)
        compilation_db = ycm_core.CompilationDatabase(compilation_db_dir)
        if not compilation_db:
            logging.info("Compilation database file found but unable to load")
            return None
        compilation_info = GetCompilationInfoForFile(compilation_db, filename)
        if not compilation_info:
            logging.info("No compilation info for " +
                         filename + " in compilation database")
            return None
        return MakeRelativePathsInFlagsAbsolute(
            compilation_info.compiler_flags_,
            compilation_info.compiler_working_dir_)
    except:
        return None


def IncludeFile(root, filename):
    try:
        fpath = FindNearest(root, filename)
        if (not os.path.isfile(fpath)):
            return None, None

        lines = [os.path.join(os.path.dirname(fpath), line.rstrip('\n')) for line in open(fpath)]
        return lines, os.path.relpath(filename)
    except:
        return None, None


def IncludePaths(root):
    flags = []
    for d in NEAREST_INC_FLAGS:
        try:
            d = FindNearest(root, d)
        except:
            continue
        flags += ["-I" + d]

    paths, r = IncludeFile(root, '.ycml')
    if paths:
        for d in paths:
            flags += FlagsForR(d)
    if r:
        root = r

    paths, r = IncludeFile(root, '.ycmk')
    if paths:
        for d in paths:
            flags += FlagsForR(d)
    else:
        paths, r = IncludeFile(root, '.ycm')
        if paths:
            for d in paths:
                flags += FlagsForR(d)

        for d in SYS_INC_FLAGS:
            flags += FlagsForR(d)

    return flags


def FlagsForFile(filename):
    root = os.path.realpath(filename)
    compilation_db_flags = FlagsForCompilationDatabase(root, filename)
    if compilation_db_flags:
        final_flags = compilation_db_flags
    else:
        if IsCFile(filename):
            final_flags = BASE_C_FLAGS
        else:
            final_flags = BASE_CPP_FLAGS
        clang_flags = FlagsForClangComplete(root)
        if clang_flags:
            final_flags += clang_flags
        include_flags = IncludePaths(root)
        if include_flags:
            final_flags += include_flags
    return {
        'flags': final_flags,
        'do_cache': True
    }
