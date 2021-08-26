#!/usr/bin/env bash

function _copy_main_tex() {
    cp $TEXTEMP/latex/gitignore ${PWD}/$1/.gitignore
    if [ "$2" = "-ac" ]; then
        cp $TEXTEMP/latex/main.bib ${PWD}/$1
        cp $TEXTEMP/latex/article_main_code.tex ${PWD}/$1/main.tex
        cp -r $TEXTEMP/latex/images ${PWD}/$1
        cp -r $TEXTEMP/latex/src ${PWD}/$1
        cp $TEXTEMP/latex/Makefile ${PWD}/$1
        return
    elif [ "$2" = "-a" ]; then
        cp $TEXTEMP/latex/main.bib ${PWD}/$1
        cp $TEXTEMP/latex/article_main.tex ${PWD}/$1/main.tex
        cp -r $TEXTEMP/latex/images ${PWD}/$1
        cp -r $TEXTEMP/latex/src ${PWD}/$1
        cp $TEXTEMP/latex/Makefile ${PWD}/$1
        return
    elif [ "$2" = "-ec" ]; then
        cp $TEXTEMP/latex/main.bib ${PWD}/$1
        cp $TEXTEMP/latex/exercise_main_code.tex ${PWD}/$1/main.tex
        cp $TEXTEMP/latex/Makefile_simp ${PWD}/$1/Makefile
        return
    elif [ "$2" = "-e" ]; then
        cp $TEXTEMP/latex/main.bib ${PWD}/$1
        cp $TEXTEMP/latex/exercise_main.tex ${PWD}/$1/main.tex
        cp $TEXTEMP/latex/Makefile_simp ${PWD}/$1/Makefile
        return
    elif [ "$2" = "-IEEE" ]; then
        cp $TEXTEMP/latex/main.bib ${PWD}/$1
        cp $TEXTEMP/latex/IEEE.tex ${PWD}/$1/main.tex
        cp $TEXTEMP/latex/cls/IEEEtran.cls ${PWD}/$1/IEEEtran.cls
        cp $TEXTEMP/latex/Makefile_simp ${PWD}/$1/Makefile
        return
    elif [ "$2" = "-pres" ]; then
        cp $TEXTEMP/latex/presentation-temp.tex ${PWD}/$1/main.tex
        cp $TEXTEMP/latex/Makefile_pres ${PWD}/$1/Makefile
        return
    fi
}

function _create_template() {
    mkdir ${PWD}/$1
    _copy_main_tex $@
}

function _check_response(){
    if [[ "$1" == "Y" || "$1" == "y" ]]; then
        echo 0
    elif [[ "$1" == "N" || "$1" == "n" ]]; then
        echo 1
    else
        echo 2
    fi
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
    -IEEE\t: The IEEE-Trans Template
    -pres\t: LaTeX beamer template presentation"
        return 1
    elif [ $# -ne 2 ]; then
        echo "Invalid number of arguments"
        return 1
    elif [[ "$1" =~ ^- ]]; then
        echo "Invalid folder name"
        return 1
    fi
    case $2 in
        "-a" | "-ac" | "-e" | "-ec" | "-IEEE" | "-pres" )
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
        printf "The folder already exists. Overwrite it? (y/n): "
        read -r create
        response=$(_check_response $create)
        if [[ "$response" == "0" ]]; then
            rm -r $PWD/$1
            _create_template $@
        else
            echo "Exiting"
            return 1
        fi
    else
        _create_template $@
    fi
}
