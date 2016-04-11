#Creates current and master files if they do not exist
touch CurrentAccounts.txt
touch MasterAccounts.txt

frontend=frontend/frontend.exe
#if less that 2 arguments are passed in, run all input files in the currently directory
if [ $# -eq 0 ] || [ $# -eq 1 ]
	then
	for inFile in *.in
	do
		echo $inFile
		#extracts the name of the input file to create a corresponding transaction file
		fileName=$(basename "$inFile")
		$frontend CurrentAccounts.txt ${fileName%.*}.trans < $inFile
	done;

	#sets the name of the merged transaction file
	MergeTrans=MergeTrans.trans

	#removes the previous merged file to prevent transaction 
	#from the previous day from being applied again
	rm MergeTrans

	#merges all the transaction files
	for transFile in *.trans;
	do 
		cat $transFile >> $MergeTrans
		#removes the transaction file that 
		#has just been added to the merge file
		rm $transFile
	done;
#if 2 or more arguments are inputted
else
	#uses the first argument as the transaction file and
	#the second argument as the input file
	$frontend CurrentAccounts.txt $1 < $2
	#sets the name of the file used for the backend as the first argument
	MergeTrans=$1
fi

#runs the back end
java backend.Bank MasterAccounts.txt $MergeTrans

#used for testing
# rm $MergeTrans