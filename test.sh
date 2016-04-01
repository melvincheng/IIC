rm finalTrans.trans
frontend=frontend/src/frontend.exe
for inFile in frontend/tests/inputs/*.in
do
	fileName=$(basename "$inFile")
	$frontend accounts.txt ${fileName%.*}.trans < $inFile
done;

for transFile in *.trans;
do 
	cat $transFile >> finalTrans.trans
	rm $transFile
done;

java backend.src.Bank masteraccounts.txt finalTrans.trans