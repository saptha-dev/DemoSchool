using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace DemoSchool
{
    public partial class careers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DataTable dt = bindGridView();
                GrvDetails.DataSource = dt;
                GrvDetails.DataBind();
            }
        }
        public DataTable bindGridView()
        {
            DataTable table = new DataTable();

            table.Columns.Add("SNO", typeof(int));
            table.Columns.Add("JOBTitle", typeof(string));
            table.Columns.Add("Description", typeof(string));
            table.Columns.Add("Location", typeof(string));


            table.Rows.Add(101, "Developer", "Web site Developer", "Hyderabad");
            table.Rows.Add(102, "Tester", "Web site Mahesh", "Hyderabad");
            table.Rows.Add(104, "Admin", "Company Admin", "Hyderabad");
            table.Rows.Add(105, "Designer", "Web site Designer", "Hyderabad");

            return table;

        }
    }
}