#!/usr/bin/env python
# coding: utf-8

# # Libraries

# In[230]:


from datetime import datetime
import os
import pandas as pd
import json


# # Errors

# In[209]:


# custom errors
class BalanceError(ValueError): pass
class SalaryError(ValueError): pass
class SalaryRaiseError(ValueError): pass
class CreditError(ValueError): pass


# # Classes

# In[211]:


class Customer:

    def __init__(self, name, address):
        self.created_at = str(datetime.today())
        self.name = name
        self.address = address
        
    def display(self): 
        print(self.name) 
        print(self.created_at) 


# In[216]:


class Employee:
    
    _MIN_SALARY = 31200

    def __init__(self, name, salary):
        self.date_joined = str(datetime.today().strftime('%Y-%m-%d'))
        self.name = name
        if salary < Employee._MIN_SALARY:
            raise SalaryError("The salary entered is too low. Please enter the right salary.")
        self.salary = salary
        
    def display(self): 
        
        print("Employee: {}\nDate joined: {}\nCurrent salary: ${}".format(self.name, self.date_joined, self.salary))
    
    def give_raise(self, amount):
        if amount <= 0:
            raise SalaryRaiseError("The amount must be positive")
        self.salary += amount
        print("Successfully added. The new salary is ${}".format(self.salary))
        


# In[58]:


class Account(Customer):
        
    _MIN_BALANCE = 100
    
    def __init__(self, name, address, balance, credit_balance = 0):
        
        if balance < Account._MIN_BALANCE:
            raise BalanceError("The balance is too low. Deposit a higher amount to open an account.")
        self.balance = balance
        self.credit_balance = credit_balance
        Customer.__init__(self, name, address)

    def deposit(self, amount):
        self.balance += amount
        return "An amount of ${} was deposited to your account. Your new balance is ${}".format(amount, self.balance)

    def withdraw(self, amount):
        self.balance -= amount
        return "An amount of ${} was withdrawn from your account. Your new balance is ${}".format(amount, self.balance)
    
    def accrue_credit(self, amount):
        self.credit_balance += amount
        return "You purchased an item that cotst ${}. This amount was added to your credit balance.".format(amount)
    
    def pay_off_credit(self, amount):
        if amount > self.credit_balance:
            raise CreditError("The amount you entered is greater than your current credit balance. Enter a lower amount.")
        self.credit_balance -= amount
        return "You paid off ${} off of your credit card charges. Your new credit balance is ${}".format(amount, credit_balance)

    def display(self): 
        print(self.name) 
        print(self.created_at) 
        print(self.balance)
        print(self.)

    


# # Functions

# In[261]:


def export_file(list_to_export, class_of_list):
    '''
    list_to_export is the list of class entries kept in memory
    class_of_list is what class the list is; used for naming the json export
    '''
    x = {}
    for idx, i in enumerate(list_to_export):
        x[idx] = json.dumps(i.__dict__)
    with open('Bank/{}.json'.format(class_of_list), 'w') as f:
        json.dump(x, f)

