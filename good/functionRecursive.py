def f(x) {
    if (x > 0) {
        return x + f(x-1)
    }
    return 0
}

x = f(5)