touch CurrentAccounts.txt
touch MasterAccounts.txt
count=1
for inFile in *.in
do
	echo $inFile
	fileName=$(basename "$inFile")
	./dailyScript.sh ${fileName%.*}.trans $inFile
	count=$(($count+1))
	if [ $count -gt 5 ]
		then
		break
	fi
	echo ""
done;

#Used for testing
# rm CurrentAccounts.txt MasterAccounts.txt	