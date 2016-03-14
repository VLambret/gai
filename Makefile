all: test

clean:
	rm -f out/*

test :
	python3 python/gai.py < instructions.gai
