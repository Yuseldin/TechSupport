function ChangeSize(controlID) {
    var tBox = document.getElementById('<%=' + controlID + '%>');
    tBox.style['width'] = ((tBox.value.length) * 8) + 'px';
}