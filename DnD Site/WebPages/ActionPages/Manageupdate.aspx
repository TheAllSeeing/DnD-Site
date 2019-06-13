<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manageupdate.aspx.cs" Inherits="WebPages_ActionPages_Manageupdate" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Basic Details</title>
    <script>
          function IsValid(name, MsgName)
        {
            var Validity = true;
            var element = document.getElementById(name);
            if (element.value == "") {
                element.focus;
                msg += '\n' + MsgName + ' must be filled!';
                Validity = false;
            }

            if (name == 'password') {
                if (element.value.length < 4) {
                    element.focus;
                    msg += "\nPassword must be at least 4 characters long!";
                    Validity = false;
                }
            }

            
        function ValidateForm()
        {
            msg = "";
            var FNameValid = IsValid('FirstName', 'First Name');
            var UserNameValid = IsValid('username', 'Username');
            var PasswordValid = IsValid('password', 'Password');
            var FormValid = FNameValid && UserNameValid && PasswordValid;
            if (!FormValid)
                alert(msg);
            else
                alert("Sign Up Succesful!");
            return FormValid;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Edit Basic Details</h1>
        </div>
    </form>
    <form action="Manageupdate.aspx" onsubmit="return ValidateForm()" method="post">
        <p>
            User's Username: <input type="text" name="uname" /> <br />
            User's Password: <input type="text" name="pass" /> <br />
            User's New Family Name: <input type="text" name="fname" /> <br />
        </p>
    </form>
</body>
</html>
