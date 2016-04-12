frontend=frontend/frontend.exe
#if less that 2 arguments are passed in, run all input files in the currently directory
if [ $# -eq 0 ] || [ $# -eq 1 ] || [ $# -eq 2 ] || [ $# -eq 3 ]
	then
	#Creates current and master files if they do not exist
	touch CurrentAccounts.txt
	master=MasterAccounts.txt
	touch $master
	# makes a copy of the old master file
	cp $master oldMasterAccounts.txt
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

	#First argument is the transaction file
	#the second argument as input file
	$frontend $2 $3 < $4
	MergeTrans=$3
	master=$1
	oldMaster=${4%.*}MasterAccounts
	cp $master $oldMaster\(before\).txt
	path=$(dirname "$1")
fi

#runs the back end
java backend.Bank $master $MergeTrans

mv CurrentAccounts.txt ${path}

#used for testing
# rm $MergeTrans