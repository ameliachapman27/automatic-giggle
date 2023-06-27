x = True
print("Do you want to convert to hours or minutes?")
convert = input()
convert = convert.lower()
if convert == "minutes":
    ask = "hours"
elif convert == "hours":
    ask = "minutes"
else:
    print("hours or minutes was not inputted")
    exit()
print("Input the number of " + ask + " you want to convert")
num = input()
num = int(num)
if convert == "minutes":
    num *= 60
    print("That is",num,"minutes")
elif convert == "hours":
    num /= 60
    print("That is",num,"hours")
else: 
    print("hours or minutes was not inputted")
    exit()