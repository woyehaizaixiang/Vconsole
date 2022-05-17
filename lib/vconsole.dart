library vconsole;

class Vconsole {
  dynamic flutterWebViewPlugin;
  Vconsole(this.flutterWebViewPlugin);
  void dispatch () {
    flutterWebViewPlugin.runJavascript("var script = document.createElement('script');script.setAttribute('src', 'https://unpkg.com/vconsole@latest/dist/vconsole.min.js');script.setAttribute('onload', 'javascript:new window.VConsole()');document.body.append(script)");
  }
}
