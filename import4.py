from math import pow as p, sqrt as s
from random import randint as r, shuffle as sh, choice as c

result_1 = p(2,4)
print("result_1 is",int(result_1))

result_2 = s(16)
print("result_2 is",int(result_2))

result_3 = r(0,100)
print("result_3 is",result_3)

names = ["Lily","Zoe","Barack Obama","Bryan","Jimmy","Hans"]
print("Original names:",names)

sh(names)
print("Names after shuffling:",names)

result_4 = c(names)
print("Chosen name is:",result_4)