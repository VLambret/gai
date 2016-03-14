from commit import *
from svg_document import *
import cmd, sys

class gai(cmd.Cmd):

    def __init__(self):
        self.commits = {}
        self.number = 0
        self.document = svg_document("output_", 1000, 1000, "white")
        super(gai, self).__init__()

    def emptyline(self):
        pass

    def do_exit(self, s):
        return True

    do_EOF = do_exit

    def do_new(self, arg):
        p = arg.split(' ')
        if len(p) != 4:
            print("Invalid parameters")
            return
        self.document = svg_document(p[0], p[1], p[2], p[3])

    def do_commit(self, arg):
        p = arg.split(' ')
        if len(p) != 4 and len(p) != 5:
            print("Invalid parameters")
            return
        tag = p[0]
        x = p[1]
        y = p[2]
        color = p[3]
        if len(p) == 5:
            parent= p[4]
        else:
            parent = ""
        self.commits[tag] = commit(tag, x, y, color, parent)

    def do_snapshot(self, arg):
        f = self.document.nextFile()
        self.document.header(f)
        for tag in self.commits:
            line = self.commits[tag].toSVG()
            f.write(line)
        self.document.footer(f)
        f.close()

    def run(self):
        for line in self.f:
            for w in line.split(' '):
                print(w)
        c1 = commit("c1", 50, 50, "black", None)
        c1.toSVG()

def main():
    gai().cmdloop()

main()
