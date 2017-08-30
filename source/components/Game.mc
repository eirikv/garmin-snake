using Toybox.WatchUi as Ui;
using Toybox.Timer as Timer;

class Game {

    hidden const snake = new Snake();
    hidden const timer = new Timer.Timer();

    hidden var food = new Food();

    function onTimerUpdate() {
        self.snake.update();

        if (self.snake.isDead()) {
            self.stop();
        }

        if (self.snake.canEatFood(self.food)) {
            self.snake.grow();
            self.food.move();
        }

        Ui.requestUpdate();
    }

    function draw(dc) {
        self.food.draw(dc);
        self.snake.draw(dc);
    }

    function onButtonClicked(button) {
        var newDirection = Direction.getNewDirection(button, snake.getDirection());

        snake.setDirection(newDirection);
    }

    function start(buttonHandler) {
        buttonHandler.setCallback(method(:onButtonClicked));

        self.timer.start(method(:onTimerUpdate), 100, true);
    }

    function stop() {
        self.timer.stop();
    }

    hidden function addFood() {
        var x = Math.rand() % X_BOUNDS;
        var y = Math.rand() % Y_BOUNDS;

        self.food = new Pebble(x, y);
    }
}