#First
def add_num(x,y):
    return x+y
print(add_num(7,5))
#Second
def add_num(x,y,z):
    return x+y+z

print(add_num(10,20,30))

#Third
def add_num(x,y, z=None ):
    if (z == None):
        return x+y
    else:
        return x+y+z

print (add_num(1,2))
print(add_num(1,2,3))

#Fourth
def add_num(x,y,z=None, flag=False):
    if(flag):
        print('Flag is true!')
    if (z==None):
        return x+y
    else:
        return x+y+z
print flag
