library vconsole;

class Vconsole {
  dynamic webViewController;
  Vconsole(this.webViewController);
  void dispatch () {
    webViewController.runJavascript("var script = document.createElement('script');script.setAttribute('src', 'https://unpkg.com/vconsole@latest/dist/vconsole.min.js');script.setAttribute('onload', 'javascript:new window.VConsole()');document.body.append(script)");
  }
}
