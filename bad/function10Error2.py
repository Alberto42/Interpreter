def f(x) {
    def g(y) {
        return a + b + x + y
    }
    a = 3
    b = 4
    return g(10)

}

print(f(3))

