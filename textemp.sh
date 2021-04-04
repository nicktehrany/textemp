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
    elif [ "$2" = "-IEEE" ]; then
        cp $TEXTEMP/latex/IEEE.tex ${PWD}/$1/main.tex
        cp $TEXTEMP/latex/cls/IEEEtran.cls ${PWD}/$1/IEEEtran.cls
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
    if [[ "$1" == -h ]]; then
        echo "textemp, generate Folders with simple and easy to use LaTeX templates using a single command.
        
Usage: textemp [FOLDER] -[FLAG]
    
FLAG options:
    -a\t\t: Article template for simple Articles
    -ac\t\t: Article Template with code listings
    -e\t\t: Exercise Template for Exercises (Good for Uni work)
    -ec\t\t: Exercise Template with code listings
    -IEEE\t: The IEEE-Trans Template"
        return 1
    elif [ $# -ne 2 ]; then
        echo "Invalid number of arguments"
        return 1
    elif [[ "$1" =~ ^- ]]; then
        echo "Invalid folder name"
        return 1
    fi
    case $2 in
        "-a" || "-ac" || "-e" || "-ec" || "-IEEE")
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