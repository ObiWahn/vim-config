print(){
    local out="$1"
    local len=$((80-${#out}))
    printf -v pad "%-${len}s"
    echo "$out ${pad// /=}"
}

ferr() {
    echo "$*"
    exit 1
}
