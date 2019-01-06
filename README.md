# leet-code-420-strong-password-checker
A Swift playground containing my solution to problem #420 on LeetCode along with unit tests.

Author: Kyle Nakamura
Leet Code Problem: 420. Strong Password Checker
Difficulty: Hard
Time Spent: 120 minutes

Instructions:
  A password is considered strong if below conditions are all met:
  
  1) It has at least 6 characters and at most 20 characters.
  2) It must contain at least one lowercase letter, at least one uppercase letter, and at least one digit.
  3) It must NOT contain three repeating characters in a row ("...aaa..." is weak, but "...aa...a..." is strong, assuming other conditions are met).
  
  Write a function strongPasswordChecker(s), that takes a string s as input,
  and return the MINIMUM change required to make s a strong password.
  If s is already strong, return 0.
  
  Insertion, deletion or replace of any one character are all considered as one change.
