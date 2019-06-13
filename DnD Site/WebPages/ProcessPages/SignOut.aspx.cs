using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DnD_Site.ServerSide
{
    public partial class SignOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Admin"] = false;
            Session["Username"] = null;
            Session["FirstName"] = null;
            Session["FirstName"] = null;
            Session["Users"] = null;
            Session["UserTable"] = null;
            Session["CurrentVal"] = null;
            Session["Attribute"] = null;
            Session["EditName"] = null;
            Session["SignedIn"] = null;
        }
    }
}