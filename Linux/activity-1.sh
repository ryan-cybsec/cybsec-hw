types=( A NS MX )
urls=( acme.com test.com nmap.org )

for t in "${types[@]}"; do
    for u in "${urls[@]}"; do
	echo "== $u $t record =="
        nslookup -type=$t $u
    done
done
