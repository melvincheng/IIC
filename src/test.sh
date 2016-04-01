rm finalTrans.trans
frontend=frontend/frontend.exe
for inFile in ../tests/inputs/*.in
do
	fileName=$(basename "$inFile")
	$frontend frontend/accounts.txt ${fileName%.*}.trans < $inFile
done;

for transFile in *.trans;
do 
	cat $transFile >> finalTrans.trans
	rm $transFile
done;

java backend.Bank masteraccounts.txt finalTrans.trans