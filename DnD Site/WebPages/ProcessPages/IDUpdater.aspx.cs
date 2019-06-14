using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DnD_Site.App_Code.MyAdoHelperAccess;

namespace DnD_Site.WebPages.ProcessPages
{
    public partial class IDUpdater : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Identifier = $"Username='{Request.Form["Username"]}'";
            if(CanFind(SELECT(Identifier)))
            {
                ExecuteNonQuery(
                    UPDATE(
                        "IDNum", 
                        $"'{Request.Form["newID"]}'", 
                        Identifier));
                Response.Write("<alert>Update Successful!</alert>");
                Response.Redirect("../Visitables/NoSignIn/SignIn");
            }

            else
            {
                Response.Write("<alert>User not found</alert>");
                Response.Redirect("../Visitables/NoSignIn/UpdateID.html");
            }

        }
    }
}