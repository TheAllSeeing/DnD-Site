<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteConfirmer.aspx.cs" 
    Inherits="DnD_Site.ServerSide.DeleteConfirmer"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Delete This User?</h1>
            <%Response.Write(Session["UserDelTable"]);%>
            <a href="Deleter"><input type="button" value="Yes"/></a>
                <a href="Manager"><input type="button" value="No"/></a>
                
        </div>
    </form>
</body>
</html>
