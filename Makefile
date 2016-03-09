SCRIPT=generate_svgs.sh

all: sample.svg

clean:
	rm -f sample.svg

sample.svg : $(SCRIPT)
	./$(SCRIPT)
