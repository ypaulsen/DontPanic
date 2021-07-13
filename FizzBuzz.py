x = list(range(1, 101))

for i in range(len(x)):
    if x[i] % 15 == 0:
        x[i] = "FizzBuzz"
    else:
        if x[i] % 3 == 0:
            x[i] = "Fizz"
        else:
            if x[i] % 5 ==0:
                x[i] = "Buzz"

print(x)
