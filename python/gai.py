from commit import *
import os, sys

class gai:

    def __init__(self, file):
        self.file = file

    def run(self):
        c1 = commit("c1", 50, 50, "black", None)
        c1.toSVG()

def main():
    if len(sys.argv) != 2:
        print "Please specify a gai script file"
        exit()
    else:
        gai_file = sys.argv[1]

    interpreter = gai(gai_file)
    interpreter.run()

main()
