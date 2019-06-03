using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DnD_Site.App_Code;

namespace DnD_Site
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string DbName = "Database.accdb";
            MyAdoHelperAccess.ConnectToDb(DbName);
        }
    }
}