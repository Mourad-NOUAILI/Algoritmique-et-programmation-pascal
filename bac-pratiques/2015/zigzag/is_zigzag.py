def is_zigzag(n):
    sign = int(n[0])-int(n[1])
    i = 1
    while i < len(n)-1 and sign * (int(n[i])-int(n[i+1])) < 0:
        i += 1
        sign = -sign
    return i == len(n)-1
