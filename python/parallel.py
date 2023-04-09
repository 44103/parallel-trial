from joblib import Parallel, delayed


def prime(i):
    if i == 2:
        return i
    elif i % 2 == 0:
        return None
    j = 3
    while j < i:
        if i % j == 0:
            return None
        j += 2
    return i


from time import perf_counter

start = perf_counter()
res = Parallel(n_jobs=4)([delayed(prime)(n) for n in range(2, 10**6)])
print(perf_counter() - start)
