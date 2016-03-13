

class commit:

    def __init__(self, id, x, y, color, parent ):
        self.id = id
        self.x = x
        self.y = y
        self.color = color
        self.parent = parent

    def toSVG(self):
        print "<circle cx=\"{}\" cy=\"{}\" r=\"20\" stroke=\"black\" stroke-width=\"3\" fill=\"{}\" />".format(self.x, self.y, self.color)
