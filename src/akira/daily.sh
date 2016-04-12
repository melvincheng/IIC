#!/bin/bash

# SAMPLE USAGE
# ./daily.sh

frontend=frontend/frontend.exe
currAct=CurrentAccounts.txt
mastAct=MasterAccounts.txt
trans=dailyTrans.trans
MergeTrans=MergeTrans.trans

# $1 = The directory that stuff should be in
# $2 = The input file without the .in

# If no inputs then use default
if [ $# -eq 0 ]
then
    dir="daily"
    input="daily"
else
    dir=$1
    input=$2
fi

# Execute the frontend
$frontend ${dir}/${currAct} ${dir}/${trans} < ${dir}/${input}.in

# If the MergeTrans.trans file exists, delete it
if [ -e "${dir}/${MergeTrans}" ]
then
    rm ${dir}/${MergeTrans}
fi

# Concatenate any transaction files that exist
for transFile in ${dir}/*.trans
do
    cat $transFile >> ${dir}/${MergeTrans}
    rm $transFile
done

# Deletes any existing copy of the master accounts
if [ -e "${dir}/${input}${mastAct}" ]
then
    rm ${dir}/${input}${mastAct}
fi
# Copy the master accounts file before it is changed
cp ${dir}/${mastAct} ${dir}/${input}${mastAct}

# Deletes any existing copy of the current accounts
if [ -e "${dir}/${input}${currAct}" ]
then
    rm ${dir}/${input}${currAct}
fi
# Copy the current accounts file before it is changed
cp ${dir}/${currAct} ${dir}/${input}${currAct}

# Deletes any existing copy of the merged transactions
if [ -e "${dir}/${input}${MergeTrans}.temp" ]
then
    rm ${dir}/${input}${MergeTrans}.temp
fi
# Copy the merged transaction files before it is changed
# Give the copy a .temp extension so it's not deleted
cp ${dir}/${MergeTrans} ${dir}/${input}${MergeTrans}.temp

# Execute the backend with the master accounts file's location and the transactions
java backend.Bank ${dir}/${mastAct} ${dir}/${MergeTrans}

# Delete the current accounts file if it exists
if [ -e ${dir}/${currAct} ]
then
    rm ${dir}/${currAct}
fi

# Move the new current accounts file into the directory it should be in
mv $currAct ${dir}
