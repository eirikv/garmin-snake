class Direction {

    enum {
        UP = 1,
        LEFT = 2,
        DOWN = 3,
        RIGHT = 4
    }

    function getNewDirection(button, currentDirection) {
        var newDirection = (button == ButtonHandler.BUTTON_UP) ? currentDirection - 1 : currentDirection + 1;

        if (newDirection < Direction.UP) {
            return Direction.RIGHT;
        }
        if (newDirection > Direction.RIGHT) {
            return Direction.UP;
        }
        return newDirection;
    }

}
