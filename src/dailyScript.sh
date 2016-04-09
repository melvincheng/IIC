rm FinalTrans.trans

# # touch CurrentAccounts.txt
# # touch MasterAccounts.txt

frontend=frontend/frontend.exe
if [ $# -eq 0 ] || [ $# -eq 1 ]
	then
	for inFile in day1.in #../tests/inputs/*.in
	do
		fileName=$(basename "$inFile")
		$frontend ../CurrentAccounts.txt ${fileName%.*}.trans < $inFile
	done;
else
	$frontend CurrentAccounts.txt $1 < $2
fi

for transFile in *.trans;
do 
	cat $transFile >> FinalTrans.trans
	rm $transFile
done;

java backend.Bank MasterAccounts.txt FinalTrans.trans