function ChangeSize(controlID) {
    var tBox = document.getElementById('<%=' + controlID + '%>');
    tBox.style['width'] = ((tBox.value.length) * 8) + 'px';
}


$(function () {
    $("#<%= TxtOpened.ClientID %>").datepicker();
});

myClosure = function () {
    var canyousee = "here I'm ";
    return (function () {
        return { canyouseeIt: function () { return confirm(canyousee) } };
    });
}