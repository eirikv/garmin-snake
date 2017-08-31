class Food extends Pebble {

    static const RAND_MAX = 0x7FFFFFF;
    static const MIN_POSITION = 5;
    static const MAX_POSITION = 25;

    function initialize() {
        self.move();
    }

    function move() {
        self.setX();
        self.setY();
    }

    function setX() {
        self.x = self.generateRandomCoordinate();
    }

    function setY() {
        self.y = self.generateRandomCoordinate();
    }

    hidden function generateRandomCoordinate() {
        var random = Math.rand() % (Food.MAX_POSITION - Food.MIN_POSITION + 1);
        return random + Food.MIN_POSITION;
    }

}