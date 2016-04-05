rm finalTrans.trans
frontend=frontend/frontend.exe
if [ $# -eq 0 ] || [ $# -eq 1 ]
	then
	for inFile in ../tests/inputs/*.in
	do
		fileName=$(basename "$inFile")
		$frontend frontend/accounts.txt ${fileName%.*}.trans < $inFile
	done;
else
	$frontend frontend/accounts.txt $1 < $2
fi

for transFile in *.trans;
do 
	cat $transFile >> finalTrans.trans
	rm $transFile
done;

java backend.Bank masteraccounts.txt finalTrans.trans
rm finalTrans.trans