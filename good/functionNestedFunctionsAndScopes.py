def f(x) {
    y = 3
    def f(x) {
        y = 2
    }
    f(42)
    return y
}

y = f(42)