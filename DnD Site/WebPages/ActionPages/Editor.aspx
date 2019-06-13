<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="DnD_Site.WebPages.ActionPages.Editor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Atai's D&D Site - Edit your details</title>
    <link rel="stylesheet" href="../../StyleSheets/DefaultStyle.css" />
</head>
<body class="default">
    <form id="form1" runat="server">
        <div>
            <%  Session["Attribute"] = Request.Form["Attribute"];
                Response.Write($"<h1> Please insert new {Session["EditName"]}:</h1>");
            %>
        </div>
    </form>
    <form action="../ProcessPages/Updater" method="post">
        <%
            switch ((string)Session["Attribute"])
            {
                case ("birthday"):
                    Response.Write("<input type=\"date\" name=\"NewValue\" " +
                        $"value=\"{Session["CurrentVal"]}\" />");
                    break;

                case ("email"):
                    Response.Write("<input type=\"email\" name=\"NewValue\" " +
                        $"value=\"{Session["CurrentVal"]}\" />");
                    break;

                case ("PhoneNumber"):
                    Response.Write(GetSelector(
                        new string[] { "052", "053", "054", "055", "058", "059" },
                        Session["CurrentVal"].ToString().Substring(0, 3),
                        "Prefix"));
                    Response.Write("<input type=\"number\" name=\"NewValue\" " +
                        $"value=\"{("0" + Session["CurrentVal"].ToString()).Substring(3, 6)}\" />");
                    break;
                case ("gender"):
                    Response.Write(GetRadio(
                        new string[] { "male", "female", "other" },
                        (string)Session["CurrentVal"],
                        "gender"));
                    break;
                default:
                    Response.Write("<input type=\"text\" name=\"NewValue\" value=\"\" />");
                    break;
            }

            string GetSelector(string[] Options, string Default, string Name)
            {
                string Indent = new string(' ', 4);
                string Code = "<select id=\"PhonePrefix\" name=\"PhonePrefix\">";
                foreach(string Option in Options)
                {
                    Code += Environment.NewLine;
                    Code += Indent;
                    Code += $"<option value=\"{Option}\" ";

                    if(Option == Default)
                    {
                        Code += "selected=\"selected\"";
                    }

                    Code += $"> {Option} </option>";
                }

                Code += Environment.NewLine;
                Code += "</select>";
                return Code;
            }

            string GetRadio(string[] Values, string Default, string Name)
            {
                string RadioCode = String.Empty;
                foreach(string Val in Values)
                {
                    RadioCode += $"<input name=\"{Name}\" id=\"{Name}\" type=\"radio\" " +
                        $"value=\"{Val}\" /> {Val} <br /> <br />";
                    RadioCode += Environment.NewLine;
                }

                return RadioCode;
            }

            %>
            <input type="submit" name="Submitter" value="Update" />
    </form>

</body>
</html>
