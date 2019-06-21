def myFunction(x) {
    def myFunction2(y) {
        y = 42
    }
    myFunction2(6)
    x = 3
    return x
}

myFunction(5)