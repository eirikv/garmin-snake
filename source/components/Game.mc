using Toybox.WatchUi as Ui;
using Toybox.Graphics as Graphics;
using Toybox.Timer as Timer;
using Toybox.Attention as Attention;

class Game {

    hidden const timer = new Timer.Timer();
    hidden const foodVibrate = [ new Attention.VibeProfile(50, 50) ];
    hidden const gameOverVibrate = [ new Attention.VibeProfile(50, 1000) ];

    hidden var food;
    hidden var points = 0;
    hidden var isRunning = false;
    hidden var snake = new Snake();

    function initialize(buttonHandler) {
        buttonHandler.setCallback(method(:onButtonClicked));
    }

    function onTimerUpdate() {
        self.snake.update();

        if (self.snake.isDead()) {
            self.stop();
            self.alert(self.gameOverVibrate);
        }

        if (self.snake.canEatFood(self.food)) {
            self.updatePoints();
            self.snake.grow();
            self.food.move();
            self.alert(self.foodVibrate);
        }

        Ui.requestUpdate();
    }

    function updatePoints() {
        self.points = self.points == 0 ? 2 : self.points * 2;
    }

    function draw(dc) {
        if (self.snake != null) {
            self.snake.draw(dc);
        }

        if (self.food != null) {
            self.food.draw(dc);
        }

        if (!self.isRunning) {
            self.drawPoints(dc);
            self.drawGameState(dc);
        }
    }

    function drawPoints(dc) {
        var deviceSettings = System.getDeviceSettings();
        var text = self.points == 0 ? "Press ENTER to start" : "SCORE: " + self.points;

        dc.drawText(
            deviceSettings.screenWidth/2,
            deviceSettings.screenHeight - deviceSettings.screenHeight/3,
            Graphics.FONT_SMALL,
            text,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }

    function drawGameState(dc) {
        var deviceSettings = System.getDeviceSettings();
        var text = self.snake.isDead() ? "GAME OVER" : "Garmin Snake";

        dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_BLACK);

        dc.drawText(
            deviceSettings.screenWidth/2,
            deviceSettings.screenHeight/4,
            Graphics.FONT_SMALL,
            text,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }

    function onButtonClicked(button) {
        switch(button) {
            case Ui.KEY_UP:
            case Ui.KEY_DOWN: {
                var newDirection = Direction.getNewDirection(button, snake.getDirection());
                snake.setDirection(newDirection);
                break;
            }
            case Ui.KEY_ENTER: {
                if (self.isRunning) {
                    self.stop();
                } else {
                    self.start();
                }
                break;
            }
        }
    }

    function start() {
        self.isRunning = true;

        if (self.food == null) {
            self.food = new Food();
        }

        if (self.snake.isDead()) {
            self.snake = new Snake();
            self.points = 0;
        }

        self.timer.start(method(:onTimerUpdate), 100, true);
    }

    function stop() {
        self.isRunning = false;
        self.timer.stop();
    }

    hidden function alert(vibrationPattern) {
        if (Attention has :vibrate) {
            Attention.vibrate(vibrationPattern);
        }
    }
}