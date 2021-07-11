# Mini-Project 1: OOP in Python
In this assignment I create a couple classes and functions for a sample bank. Using standard libraries, I've created several classes with different getter, setter methods and custom functionality. Users can enter new customers, give accounts to those customers and hire new employees. A customer can withdraw or deposit money, pay off and accumulate credit. An employee can also receive a raise. A few custom errors are also present that make sure a balance isn't too low, credit is never negative, a salary raise is always positive, and employees make a mandatory minimum wage.

# Using the script
Most of the functions are self-explanatory, following a standard naming convention. The print-outs that accompany various class methods will make it clear what they do.

# Note
The data will be stored as a list, until the appropriate function is run to export it to a JSON file. The data relationships are specified below.

For example:<br />
emp = []<br />
emp.append(Employee("Rita Johnson", 50000))<br />
emp.append(Employee("Steven Gladwell", 45000))<br />

The code above will create a list of employees. When the user is ready, he can save that list as a JSON file in a folder called Bank, which the script will create on its own, if not already present.

# Data Relationships and Errors
<img src="Bank Classes Diagram.png"
     alt="Bank Classes and Errors Diagram"
     style="float: left; margin-right: 10px;" />
