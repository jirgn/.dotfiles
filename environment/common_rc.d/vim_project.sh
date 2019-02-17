#------------------------------------------------------
#-------- CTAGS
function make-ctags() {
    ctags -RBF -f .tags \
        --file-scope=yes \
        --sort=yes \
        --extra=+fq \
        2>/dev/null
    }
function make-ctags-css() {
    ctags -R -f .tags_css \
        --file-scope=yes \
        --sort=yes \
        --languages=css \
        2>/dev/null
    }
function make-ctags-js() {
    find -E . -regex '.*\.(js|jsx)' -not -iname '*.min.js' -exec jsctags {} -f \; | sed '/^$/d' | sort > .tags_js
    # find -type f -iregex '//' jsctags **/*.(js|jsx) | sed '/^$/d' | sort > .tags_js
    # ctags -R -f .tags_js \
    #     --exclude="*.min.js" \
    # --file-scope=yes \
    # --sort=yes \
    # --languages=JavaScript \
    # 2>/dev/null
}
function make-ctags-html() {
    ctags -R -f .tags_html \
        --file-scope=yes \
        --sort=yes \
        --languages=HTML \
        2>/dev/null
    }
function make-ctags-php() {
    ctags -R -f .tags_php \
        --file-scope=yes \
        --sort=yes \
        --fields=+afikKlmnsSzt \
        --languages=PHP \
        --extra=+fq \
        2>/dev/null
    }
function make-ctags-sql() {
    ctags -R -f .tags_sql \
        --file-scope=yes \
        --sort=yes \
        --languages=SQL \
        --extra=+fq \
        2>/dev/null
    }
function make-ctags-shell() {
    ctags -R -f .tags_sh \
        --file-scope=yes \
        --sort=yes \
        --languages=SH \
        2>/dev/null
    }


#------------------------------------------------------
#-------- Vim Project
function make-vim-project() {
    local name dir

    name=".lvimrc"
    dir="`pwd`"

    read -r -d '' USAGE <<-'EOF'
Usage: make-vim-project <type>
creats a local vim projekt file and generates ctags based on given type.

all     Create ctags for every filetype
web     Create ctags for php, js, css and html
shell	Create ctags for bash/sh
blank	Create no ctags
EOF

    if [ $# -ne 1 ]; then
        echo "$USAGE"
        return
    fi

    # CTAGS
    echo "Building ctags"
    if [[  "$1" == 'all' ]]; then
        make-ctags
        make-ctags-css
        make-ctags-js
        make-ctags-html
        make-ctags-php
        make-ctags-sql
        make-ctags-shell
    elif [[  "$1" == "web" ]]; then
        make-ctags-php
        make-ctags-html
        make-ctags-js
        make-ctags-css
        make-ctags-sql
    elif [[  "$1" == "blank" ]]; then
        echo 'no ctags generated'
    else
        echo "$USAGE"
        return
    fi

    # Vimrc
    echo "Creating local vimrc"
    echo ":cd ${dir}" >> "${name}"
}
