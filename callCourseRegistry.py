import courseRegistry

Bryan = courseRegistry.Student("Bryan",3,"chemistry",4.0,["chemistry","napping","crying at Great British Bake Off"])
print(Bryan.introduction())

napping = courseRegistry.Course("napping","a very tiny little kitty cat",1,0.0)
print(napping.classDescription())