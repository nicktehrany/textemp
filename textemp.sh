#!/usr/bin/env bash

function _copy_main_tex() {
    for arg in "$@"
    do
        if [ "$arg" = "-ac" ]; then
            cp $1/latex/article_main_code.tex ${PWD}/$2/main.tex
        elif [ "$arg" = "-ec" ]; then
            cp $1/latex/exercise_main_code.tex ${PWD}/$2/main.tex
            return
        elif [ "$arg" = "-e" ]; then
            cp $1/latex/exercise_main.tex ${PWD}/$2/main.tex
            return
        elif [ "$arg" = "-a" ]; then
            cp $1/latex/article_main.tex ${PWD}/$2/main.tex
        fi
    done
    cp -r $1/latex/images ${PWD}/$2
    cp -r $1/latex/src ${PWD}/$2
}

function _create_template() {
    mkdir ${PWD}/$2
    cp $1/latex/main.bib ${PWD}/$2
    cp $1/latex/Makefile ${PWD}/$2
    _copy_main_tex $@
}

function _check_args() {
    if [ $# -ne 2 ]; then
        echo "Invalid number of arguments"
        return 1
    elif [[ "$1" =~ ^- ]]; then
        echo "Invalid folder name"
        return 1
    fi
    case $2 in
        "-a" || "-ac" || "-e" || "-ec")
            :;;
        *)
            echo "Invalid flag"
            return 1;;
    esac
    return 0
}

function textemp() {
    _check_args $@
    local ret=$?
    if [ $ret != 0 ]; then
        return 1
    elif [ -e ${PWD}/$1 ]; then
        echo "The folder already exists"
    else
        _create_template $TEXTEMP $@
    fi
}
