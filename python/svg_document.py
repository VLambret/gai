class svg_document:

    def __init__(self, prefix, width, height, background):
        self.prefix = prefix
        self.width = width
        self.height = height
        self.background = background
        self.number = 0

    def nextFile(self):
        filename = self.prefix +  "{0:08d}".format(self.number) + ".svg"
        self.number = self.number + 1
        return open(filename, 'w')

    def header(self, f):
        s = "<svg height=\"{}\" width=\"{}\">\n".format(self.height, self.width)
        f.write(s)

    def footer(self, f):
        s = "</svg>"
        f.write(s)

