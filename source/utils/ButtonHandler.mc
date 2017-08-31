using Toybox.WatchUi as Ui;

class ButtonHandler extends Ui.InputDelegate {

    hidden var callback = null;

    function setCallback(callback) {
        self.callback = callback;
    }

    function onKey(evt) {
        if (callback != null) {
            callback.invoke(evt.getKey());
        }
    }

}