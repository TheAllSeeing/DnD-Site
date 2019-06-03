using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DnD_Site.App_Code.MyAdoHelperAccess;

namespace DnD_Site.ServerSide
{
    public partial class DeleteConfirmer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> Columns = DefaultColumns.ToList<string>();
            Columns.Insert(0, "ID");
            Session["ToDelete"] = Request.Form["ID"];
            Session["UserDelTable"] = 
                GetTable (
                    SELECTAll($"ID={Session["ToDelete"]}"), 
                    Columns.ToArray(),
                    new string[] { "admin" });
        }
    }
}