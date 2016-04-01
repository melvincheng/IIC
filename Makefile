JAVAC=javac
sources = backend/src/Account.java\
 backend/src/Transaction.java\
 backend/src/TransactionIO.java\
 backend/src/AccountIO.java\
 backend/src/TransactionProcessor.java\
 backend/src/Bank.java

classes = $(sources:.java=.class)

all: $(classes)

run:
	java -cp ./backend/src Bank

clean :
	rm -f backend/src/*.class

%.class : %.java
	$(JAVAC) $<
