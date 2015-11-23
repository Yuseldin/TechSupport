function ChangeSize(controlID) {
    var tBox = document.getElementById('<%=' + controlID + '%>');
    tBox.style['width'] = ((tBox.value.length) * 8) + 'px';
}

$(function () {
    $("#<%= TxtOpened.ClientID %>" ).datepicker();
   // $("#TxtClosed").datepicker();
    $("button").click(function () {
        //var selected = $("#dropdown option:selected").text();
        var departing = $("#TxtOpened").val();
        var returning = $("#TxtClosed").val();
        if (departing === "" || returning === "") {
            alert("Please select an open and close date for the incident.");
        } else {
            confirm("Would you like to go to " + selected + " on " + departing + " and return on " + returning + "?");
        }
    });
});

function SessionTimeOut()
{
    self.setTimeout("RedirectToMainPage();", 5000);
}

function RedirectToMainPage()
{
    alert(
}