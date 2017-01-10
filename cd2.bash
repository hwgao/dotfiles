# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func ()
{
    local x2 the_new_dir adir index
    local -i cnt

    if [[ $1 ==  "--" ]]; then
        dirs -v
        echo "Please enter your choise: "
        read opt
        if [ -z "$opt" ]; then
            echo "Invalid choise"
            return 1
        else
            adir=$(dirs +$opt)
            [[ -z $adir ]] && return 1
            the_new_dir=$adir
        fi
    else
        the_new_dir=$1
        [[ -z $1 ]] && the_new_dir=$HOME

        if [[ ${the_new_dir:0:2} == '..' ]]; then
            index=${the_new_dir:2}
            case "$index" in
                1) the_new_dir=".."
                    ;;
                2) the_new_dir="../.."
                    ;;
                3) the_new_dir="../../.."
                    ;;
                4) the_new_dir="../../../.."
                    ;;
                5) the_new_dir="../../../../.."
                    ;;
                6) the_new_dir="../../../../../.."
                    ;;
                7) the_new_dir="../../../../../../.."
                    ;;
                8) the_new_dir="../../../../../../../.."
                    ;;
            esac
        fi
    fi

    #
    # '~' has to be substituted by ${HOME}
    [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

    #
    # Now change to the new dir and add to the top of the stack
    pushd "${the_new_dir}" > /dev/null
    [[ $? -ne 0 ]] && return 1
    the_new_dir=$(pwd)

    #
    # Trim down everything beyond 11th entry
    popd -n +11 2>/dev/null 1>/dev/null

    #
    # Remove any other occurence of this dir, skipping the top of the stack
    for ((cnt=1; cnt <= 10; cnt++)); do
        x2=$(dirs +${cnt} 2>/dev/null)
        [[ $? -ne 0 ]] && return 0
        [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
        if [[ "${x2}" == "${the_new_dir}" ]]; then
            popd -n +$cnt 2>/dev/null 1>/dev/null
            cnt=cnt-1
        fi
    done

    return 0
}
alias cd=cd_func
