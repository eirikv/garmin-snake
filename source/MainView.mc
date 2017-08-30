using Toybox.WatchUi as Ui;

class MainView extends Ui.View {

    hidden const game = new Game();

    hidden var buttonHandler;

    function initialize(buttonHandler) {
        View.initialize();

        self.buttonHandler = buttonHandler;
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        self.game.start(self.buttonHandler);
    }

    // Update the view
    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        dc.clear();

        self.game.draw(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. ThiAs includes freeing resources from
    // memory.
    function onHide() {
        self.game.stop();
    }

}
