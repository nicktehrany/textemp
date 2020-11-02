#!/usr/bin/env bash

function _copy_main_tex() {
    cp $TEXTEMP/latex/gitignore ${PWD}/$1/.gitignore
    if [ "$2" = "-ac" ]; then
        cp $TEXTEMP/latex/article_main_code.tex ${PWD}/$1/main.tex
    elif [ "$2" = "-a" ]; then
        cp $TEXTEMP/latex/article_main.tex ${PWD}/$1/main.tex
    elif [ "$2" = "-ec" ]; then
        cp $TEXTEMP/latex/exercise_main_code.tex ${PWD}/$1/main.tex
        cp $TEXTEMP/latex/Makefile_simp ${PWD}/$1/Makefile
        return
    elif [ "$2" = "-e" ]; then
        cp $TEXTEMP/latex/exercise_main.tex ${PWD}/$1/main.tex
        cp $TEXTEMP/latex/Makefile_simp ${PWD}/$1/Makefile
        return
    fi
    cp -r $TEXTEMP/latex/images ${PWD}/$1
    cp -r $TEXTEMP/latex/src ${PWD}/$1
    cp $TEXTEMP/latex/Makefile ${PWD}/$1
}

function _create_template() {
    mkdir ${PWD}/$1
    cp $TEXTEMP/latex/main.bib ${PWD}/$1
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
        _create_template $@
    fi
}
