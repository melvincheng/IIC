touch CurrentAccounts.txt
touch MasterAccounts.txt

frontend=frontend/frontend.exe
if [ $# -eq 0 ] || [ $# -eq 1 ]
	then
	for inFile in *.in
	do
		echo $inFile
		fileName=$(basename "$inFile")
		$frontend CurrentAccounts.txt ${fileName%.*}.trans < $inFile
	done;
	FinalTrans=FinalTrans.trans
	for transFile in *.trans;
	do 
		cat $transFile >> $FinalTrans
		rm $transFile
	done;
else
	$frontend CurrentAccounts.txt $1 < $2
	FinalTrans=$1
fi


java backend.Bank MasterAccounts.txt $FinalTrans

#used for testing
# rm $FinalTrans