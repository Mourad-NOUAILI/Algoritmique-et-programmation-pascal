# n is a string of digits
# Time complexity: O(|n|)
def is_zigzag(n):
    s = str(n)
    i = 0
    while True:
        sign = ord(s[i])-ord(s[i+1])
        i += 1
        if i == len(s)-1 or sign * (ord(s[i])-ord(s[i+1])) >= 0:
            break
    
    return i == len(s)-1
