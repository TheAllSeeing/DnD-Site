using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DnD_Site.App_Code.MyAdoHelperAccess;

namespace DnD_Site.ServerSide
{
    public partial class Deleter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ExecuteNonQuery(DELETE($"ID = {Session["ToDelete"]}"));
            Session["Users"] = GetTableWithDel(SELECTAll());
            Response.Redirect("Manager");
        }
    }
}