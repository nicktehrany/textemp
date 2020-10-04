#!/usr/bin/env bash

function _copy_main_tex() {
    for arg in "$@"
    do
        if [ "$arg" = "-c" ]; then
            cp $1/latex/article_main_code.tex ${PWD}/$2/main.tex
            return
        fi
    done
    cp $1/latex/article_main.tex ${PWD}/$2/main.tex
}

function _create_template() {
    mkdir ${PWD}/$2
    cp $1/latex/main.bib ${PWD}/$2
    cp $1/latex/Makefile ${PWD}/$2
    cp -r $1/latex/images ${PWD}/$2
    cp -r $1/latex/src ${PWD}/$2
    _copy_main_tex $@
}

function textemp() {
    if [ -e ${PWD}/$1 ]; then
        echo "The folder already exists"
    else
        _create_template $TEXTEMP $@
    fi
}
