# Przykład programu
x=1
y=1
if False {
    x = True
}
if True {
    x = 5
} else {
    x = "str" + "ing"
}
while True {
    b = 1
    c = 1
    break
    continue
}
for i in range(1,10) { x=i }
def myFunction(x) {
    x = 3
    return x + 7
}

a = 2 < 3
b = 2 + 4
c = (1 <= 2 ) and (1 <= 3)


mylist = ["1", True, 2]
nulllist = []
myFunction(5)

mylist.append(False)
mylist[4] = mylist[3]
mylist[3] = 4
x = (1,False,"str")
x = (1, (False, True), ("str", (True,5)))
(a,b,c) = x