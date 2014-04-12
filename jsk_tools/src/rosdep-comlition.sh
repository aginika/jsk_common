function _roscomplete_rosdep {
    local arg opts
    COMPREPLY=()
    arg="${COMP_WORDS[COMP_CWORD]}"

    if [[ $COMP_CWORD == 1 ]]; then
        opts="check install db init keys resolve update what-needs where-defined"
        COMPREPLY=($(compgen -W "$opts" -- ${arg}))
    else
        case ${COMP_WORDS[1]} in
            db|init|update)
                ;;
            *)
                opts=`rospack list-names`
                COMPREPLY=($(compgen -W "$opts" -- ${arg}))
                ;;
        esac
    fi
}

complete -F "_roscomplete_rosdep" "rosdep"


