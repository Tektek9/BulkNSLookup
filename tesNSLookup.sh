pemulung() {
    array=()
    while IFS= read -r baris
    do
        array+=("$baris")
    done < "$1"
}

echo -e "\n\nTes IP Lookup"
pemulung "data/listIP.txt"
for wakwaw in "${array[@]}"
do
    echo -e "\n$wakwaw"
    hasil=$(nslookup $wakwaw | head -n 1 | awk '{ print $NF }')
    if [ $hasil == NXDOMAIN ]; then
       echo "NS Tidak ditemukan"
    else
    mantap=${hasil::-1}
    echo "$mantap"
    fi
done
echo -e "\n"