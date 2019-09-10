echo -n "" > pragma.txt
for pragma in `sqlite3 :memory: "select name from pragma_pragma_list;"`; do
	sqlite3 :memory: "select * from pragma_${pragma};"
	echo "pragma_${pragma}" >> pragma.txt
done

