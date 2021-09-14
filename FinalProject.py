import random, pickle, os
class Account:
    def __init__ (self, name, acctNum, balance):
        self.__name = name
        self.__acctNum = acctNum
        self.__balance = balance

    def get_name(self):
        return self.__name
    def get_acctNum(self):
        return self.__acctNum
    def get_balance(self):
        return self.__balance
    def set_balance(self, new_balance):
        self.__balance = new_balance


def main():
    while(True):
        print("Welcome to your bank account!")
        user_input = input("1. Make a new Account\n2. Withdraw\n3. Deposit\n4. Check Balance\n5. Exit\n\nEnter choice: ")

        if(user_input == '1'):
            name = input("What is your name? ")
            file_name = name + ".bnk"
            while os.path.exists(name):
                 print("\nA user with that name already exists.")
                 name = input("Please choose a new name. ")
                 file_name = name + ".bnk"
            print("Hey there ", name, "let's get started!")
            new_account(name)

        if(user_input == '2' or user_input == '3' or user_input == '4'):
            name = input("What is your name? ")
            file_name = (name, ".bnk")
            try:
                 account_file = open(file_name, "rb")
                 account = pickle.load(account_file)
                 acccount_file.close()
                 print("Welcome back", name, "!")
                 if(user_input == '2'):
                     withdraw(account)
                 if(user_input == '3'):
                     deposit(account)
                 if(user_input == '4'):
                     balance(account)
            except:
                print(name, "your account cannot be found.")
                continue

        if(user_input == '5'):
            break

        else:
            print("Error: unidentified character used. Response must be 1, 2, or 3.")


def new_account(name):
    money = input("Enter the amount you would like to store in your bank account: ")
    num = random.randint(100000, 999999)
    acctNum = str(num)
    account = Account(name, acctNum, money)
    balance(account)
    save_account(account)

def withdraw (account):
    current_balance = int(account.get_balance())
    amount = input("Please enter how much you would like to withdraw: ")
    withdrawl = int(amount)
    new_balance = current_balance - withdrawl
    str(new_balance)
    #balance(account)
    save_account(account)

def deposit (account):
    current_balance = int(account.get_balance())
    amount = input("Please enter how much you would like to deposit: ")
    deposited = int(amount)
    new_balance = current_balance + withdrawl
    str(new_balance)
    #balance(account)
    save_account(account)

def balance(account):
    name = account.get_name()
    money = account.get_balance()
    acctNum = account.get_acctNum()
    print("Account owner: ", name, "\nAccount number: ", acctNum, "\nBalance: $", money)

def save_account(account):
    file_name = account.get_name() + ".bnk"

    try:
        f = open(file_name, "wb")

        pickle.dump(account, f)

    except Exception as e:
        print("Sorry " + account.get_name() + ", the account could not be saved")
        if hasattr(e, 'message'):
            print(e.message)
        else:
            print(e)

    finally:
        f.close()

    print("\n" + account.get_name()+ ", your account has been saved.")
main()
