red='\e[0;31m'
NC='\e[0m'

set -e
trap 'echo -e "${red}you need to source rosbash related files previously.${NC}"
' ERR

function _roscomplete_rosdep {
    local arg opts
    COMPREPLY=()
    arg="${COMP_WORDS[COMP_CWORD]}"

    if [[ $COMP_CWORD == 1 ]]; then
        opts="check install db init keys resolve update what-needs where-defined"
        COMPREPLY=($(compgen -W "$opts" -- ${arg}))
    else
        opts=`rospack list-names`
        COMPREPLY=($(compgen -W "$opts" -- ${arg}))
    fi
}

complete -F "_roscomplete_rosdep" "rosdep"


