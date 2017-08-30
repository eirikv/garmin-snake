using Toybox.WatchUi as Ui;

class ButtonHandler extends Ui.InputDelegate {

    enum {
        BUTTON_UP,
        BUTTON_DOWN
    }

    hidden var callback = null;

    function setCallback(callback) {
        self.callback = callback;
    }

    function onKey(evt) {
        if (evt.getKey() == Ui.KEY_DOWN || evt.getKey() == Ui.KEY_UP) {
            var button = evt.getKey() == Ui.KEY_UP ? BUTTON_UP : BUTTON_DOWN;

            if (callback != null) {
                callback.invoke(button);
            }
        }
    }

}