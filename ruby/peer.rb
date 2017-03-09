def add(x, y)
	result=x+y
	puts result
	subtract(result, y)
end

def subtract(a, b)
	result=a-b
	puts result
end

add(10, 25)
subtract(156, 6)