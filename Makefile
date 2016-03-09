SCRIPT=generate_svgs.sh

all: sample.svg

clean:
	rm -f out/*

sample.svg : $(SCRIPT)
	./$(SCRIPT)
