class Food extends Pebble {

    static const MIN_POSITION = 5;
    static const MAX_POSITION = 15;

    function initialize() {
        self.move();
    }

    function move() {
        self.setX(self.generateRandomCoordinate());
        self.setY(self.generateRandomCoordinate());
    }

    function setX(x) {
        if (x > Food.MAX_POSITION) {
            self.x = Food.MAX_POSITION;
        } else if (x < Food.MIN_POSITION) {
            self.x = Food.MIN_POSITION;
        } else {
            self.x = x;
        }
    }

    function setY(y) {
        if (y > Food.MAX_POSITION) {
            self.y = Food.MAX_POSITION;
        } else if (y < Food.MIN_POSITION) {
            self.y = Food.MIN_POSITION;
        } else {
            self.y = y;
        }
    }

    hidden function generateRandomCoordinate() {
        var x = Math.rand() % GRID_SIZE;
        return x == 0 ? GRID_SIZE : x;
    }

}