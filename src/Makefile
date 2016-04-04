CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++11
CXXSOURCES = main.cc account.cc commands.cc account_parser.cc account_status.cc transaction_io.cc console_input.cc format_check.cc
CXXINCLUDES = account.h commands.h account_parser.h console_input.h format_check.h
EXE = frontend.exe
JAVAC = javac
JAVA = java
JAVASOURCES = AccountIO.java Account.java Bank.java TransactionIO.java Transaction.java TransactionProcessor.java

# Change these 2 for front end input files.
FRONTENDFILES = current transaction
# Change these 2 for back end input files.
BACKENDFILES = master transaction

all : 
	@make prepare
	@make run
	@make clean

prepare:
	@echo "\n===== Compiling front end. ====="
	cd frontend && $(CXX) $(CXXFLAGS) $(CXXSOURCES) -o $(EXE)
	@echo "===== Front end compiled. ====="
	@echo "\n===== Compiling back end. ====="
	cd backend && $(JAVAC) $(JAVASOURCES)
	@echo "===== Back end compiled. ====="

run:
	@echo "\n===== Executing front end. ====="
	@cd frontend && ./frontend.exe $(FRONTENDFILES)
	@echo "===== Front end complete. ====="
	@echo "\n===== Executing back end. ====="
	$(JAVA) backend.Bank $(BACKENDFILES)
	@echo "===== Back end complete. ====="

clean:
	@rm frontend/*.exe
	@rm backend/*.class
	@echo "\n===== File cleaning complete. =====\n"

help:
	@echo "\nValid targets:"
	@echo "  all:       Prepares, runs and then cleans front and back end."
	@echo "  prepare:   Compiles front and back end files."
	@echo "  run:       Executes front end, and then back end."
	@echo "  clean:     Removes .exe and .class files for front and back end.\n"