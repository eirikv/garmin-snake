class Pebble {

    static const SIZE = 6;
    static const PADDING = 1;
    static const SIZE_WITH_PADDING = 8;
    static const GRID_SIZE = 30;

    hidden var x;
    hidden var y;

    function initialize(x, y) {
        self.setX(x);
        self.setY(y);
    }

    function getX() {
        return self.x;
    }

    function getY() {
        return self.y;
    }

    function setX(x) {
        if (x > Pebble.GRID_SIZE) {
            self.x = 1;
        } else if (x < 1) {
            self.x = Pebble.GRID_SIZE;
        } else {
            self.x = x;
        }
    }

    function setY(y) {
        if (y > Pebble.GRID_SIZE) {
            self.y = 1;
        } else if (y < 1) {
            self.y = Pebble.GRID_SIZE;
        } else {
            self.y = y;
        }
    }

    function draw(dc) {
        var x = self.x * Pebble.SIZE_WITH_PADDING;
        var y = self.y * Pebble.SIZE_WITH_PADDING;

        dc.fillRectangle(x, y, Pebble.SIZE, Pebble.SIZE);
    }

    function equals(other) {
        return self.getX() == other.getX() && self.getY() == other.getY();
    }

}