class Snake {

    hidden var pebbles = [];
    hidden var dead = false;
    hidden var direction = Direction.LEFT;

    function initialize() {
        self.pebbles.add(new Pebble(14, 15));
        self.pebbles.add(new Pebble(15, 15));
    }

    function getDirection() {
        return self.direction;
    }

    function setDirection(direction) {
        self.direction = direction;
    }

    function grow() {
        return self.pebbles.add(new Pebble(0, 0));
    }

    function isDead() {
        return self.dead;
    }

    function canEatFood(food) {
        return self.getHead().equals(food);
    }

    function update() {
        var newHead = self.getNewHead();

        for (var i=self.pebbles.size()-1; i>0; i--) {
            if (self.pebbles[i].equals(newHead)) {
                self.dead = true;
                return;
            }

            self.pebbles[i] = self.pebbles[i-1];
        }

        self.pebbles[0] = newHead;
    }

    function draw(dc) {
        for (var i=0; i<self.pebbles.size(); i++) {
            self.pebbles[i].draw(dc);
        }
    }

    function getHead() {
        return self.pebbles[0];
    }

    hidden function getNewHead() {
        var head = self.getHead();

        if (direction == Direction.LEFT || direction == Direction.RIGHT) {
            var x = Direction.LEFT == direction ? head.getX() - 1 : head.getX() + 1;
            return new Pebble(x, head.getY());
        }

        if (direction == Direction.UP || direction == Direction.DOWN) {
            var y = Direction.UP == direction ? head.getY() - 1 : head.getY() + 1;
            return new Pebble(head.getX(), y);
        }
    }

}