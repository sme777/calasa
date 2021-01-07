$(document).ready(function() {
    $('#signupSubmit').click(function(e) {
        //return true;
        e.preventDefault();
        var name = $("#nameField").val();
        var email = $("#emailField").val();
        var password = $("#passwordField").val();
        var confirmation = $("#confirmField").val();
        if (name == "" ) {
            $("#nameField").removeClass("is-valid");
            $("#nameField").addClass("is-invalid");
        } else if (name.includes(" ")){
            $("#nameField").removeClass("is-invalid");
            $("#nameField").addClass("is-valid");
        } else {
            $("#nameField").removeClass("is-valid");
            $("#nameField").addClass("is-invalid");
        }
        
        if (email == "") {
            $("#emailField").addClass("is-invalid");
        } else if (password == "") {
            $("#passwordField").addClass("is-invalid");
        } else if (confirmation == "") {
            $("#confirmField").addClass("is-invalid");
        } else if (password != confirmation) {
            $("#passwordField").addClass("is-invalid");
            $("#confirmField").addClass("is-invalid");
        } else {
            $('#signupSubmit').submit();
        }
        
    });
  });