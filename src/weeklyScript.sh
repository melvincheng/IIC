if [ $# -eq 5 ]
	then
	./dailyScript.sh $1
	./dailyScript.sh $2
	./dailyScript.sh $3
	./dailyScript.sh $4
	./dailyScript.sh $5
else
	count=1
	for inFile in ../tests/inputs/*.in
	do
		echo $inFile
		echo $count
		./dailyScript.sh transactions.trans $inFile
		count=$(($count+1))
		if [ $count -gt 5 ]
			then
			exit
		fi
	done;
fi