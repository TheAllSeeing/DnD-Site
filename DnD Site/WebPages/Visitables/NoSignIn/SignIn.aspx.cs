using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DnD_Site.App_Code;
using static DnD_Site.App_Code.MyAdoHelperAccess;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            string User = Request.Form["Username"];
            string Password = Request.Form["password"];
            string Selector = SELECT(new string[] { "*" },
                EqualCheck("AND", "Username", "password"));

            if (CanFind(Selector))
            {
                Response.Redirect("../ActionPages/SignInNotFound");
            }

            Session["Username"] = Request.Form["Username"];
            Session["UserID"] = GetValueByQuery("ID", $"Username='{User}'"); 

            if(User == "admin" && Password == "admin")
            {
                Session["Admin"] = true;
                Session["Users"] = GetTableWithDel("DeleteConfirmer");
            }

            else
            {
                Session["Admin"] = false;
            }

            if (Application["VisitCount"] == null)
            {
                Application["VisitCount"] = 0;
            }

            Application["VisitCount"] = (int)Application["VisitCount"] + 1;

            Response.Write($"Visit Count: {Application["VisitCount"]}\tLogged In: {Session["Username"]}");
            Session["UserTable"] = GetTableWithEdit("../ActionPages/Editor", 
                DefaultColumns, Selector);
            Session["SignedIn"] = true;
            Response.Redirect("HomePage");


            string EqualCheck(string Operator, string key1, string key2)
            {
                return $"{key1} = '{Request.Form[key1]}' {Operator} {key2} = '{Request.Form[key2]}'";
            }
        }
    }
}

