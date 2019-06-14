using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DnD_Site.App_Code.MyAdoHelperAccess;

namespace DnD_Site.WebPages.Visitables.NoSignIn
{
    public partial class NewSignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                Session["Username"] = "Guest";
                Session["Admin"] = false;

                if (Application["VisitCount"] == null)
                {
                    Application["VisitCount"] = 0;
                }

                Application["VisitCount"] = (int)Application["VisitCount"] + 1;

                string User = Request.Form["Username"];
                string ID = Request.Form["IDNum"];
                string Selector = SELECT(new string[] { "*" },
                    EqualCheck("AND", "Username", "IDNum"));

                if (!CanFind(Selector))
                {
                    Response.Redirect("../../ActionPages/SignInNotFound");
                }

                Session["Username"] = Request.Form["Username"];
                Session["UserID"] = GetValueByQuery("ID", $"Username='{User}'");

                if (User == "admin")
                {
                    Session["Admin"] = true;
                    Session["Users"] = GetTableWithDel("../../ActionPages/DeleteConfirmer");
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
                Session["UserTable"] = GetTableWithEdit("../../ActionPages/Editor",
                    DefaultColumns,
                    new string[] { (bool)Session["Admin"] ? "" : "admin" },
                    Selector);
                Session["SignedIn"] = true;
                Response.Redirect("../SignedIn/HomePage");

                string EqualCheck(string Operator, string key1, string key2)
                {
                    return $"{key1} = '{Request.Form[key1]}' {Operator} {key2} = '{Request.Form[key2]}'";
                }
            }
        }
    }
}