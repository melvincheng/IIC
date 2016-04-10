#Creates current and master files if they do not exist
touch CurrentAccounts.txt
touch MasterAccounts.txt

#a counter used to keep track the number of time the daily script runs
count=1
#loops through all the input files in the directory
for inFile in *.in
do
	echo $inFile
	
	#extracts the name of the input file to create a corresponding transaction file
	fileName=$(basename "$inFile")
	
	#runs the daily script with the current day's inputs
	./dailyScript.sh ${fileName%.*}.trans $inFile

	#increments count by 1
	count=$(($count+1))
	
	#if 5 files ran, then the loop is exited, as the represent 5 days have passed
	if [ $count -gt 5 ]
		then
		break
	fi
	echo ""
done;

#Used for testing
# rm CurrentAccounts.txt MasterAccounts.txt	