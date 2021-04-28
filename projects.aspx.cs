using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

namespace WebApplication7
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grid1_SelectedIndexChanged(object sender, EventArgs e)
        {
          
                
        }

        protected void grid1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Response.Redirect("~/topic.aspx?ind=" + grid1.SelectedDataKey.Value.ToString());
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            source1.FilterExpression = d1.SelectedValue.Trim() + " like '%" + t1.Text.Trim() + "%'";

            SqlConnection conn = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);

            SqlCommand comm = new SqlCommand("INSERT INTO search(userid,skey,statement,date) VALUES(@userid,@skey,@statement,@date)", conn);
            SqlParameter userid = new SqlParameter("userid", User.Identity.Name.Trim());
            SqlParameter skey = new SqlParameter("skey", d1.SelectedValue.Trim());
            SqlParameter statement = new SqlParameter("statement", t1.Text.Trim());
            SqlParameter date = new SqlParameter("date", DateTime.Now.ToString().Trim());
            comm.Parameters.Add(userid);
            comm.Parameters.Add(skey);
            comm.Parameters.Add(statement);
            comm.Parameters.Add(date);
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
        }
    }
}