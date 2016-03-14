from commit import *
import cmd, sys

class gai(cmd.Cmd):

    def __init__(self):
        self.commits = {}
        super(gai, self).__init__()

    def emptyline(self):
        pass

    def do_exit(self, s):
        return True

    do_EOF = do_exit

    def do_commit(self, arg):
        p = arg.split(' ')
        tag = p[0]
        x = p[1]
        y = p[2]
        color = p[3]
        parent= p[4]
        self.commits[tag] = commit(tag, x, y, color, parent)

    def do_snapshot(self, arg):
        for tag in self.commits:
            print(tag)
            self.commits[tag].toSVG()

    def run(self):
        for line in self.f:
            for w in line.split(' '):
                print(w)
        c1 = commit("c1", 50, 50, "black", None)
        c1.toSVG()

def main():
    gai().cmdloop()

main()
