using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

namespace WebApplication7.topic
{
    public partial class mng : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.Width = 1000;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("~/topic/topicmng.aspx?ind=" + GridView1.SelectedDataKey.Value.ToString());

        }

        protected void b1_Click(object sender, EventArgs e)
        {
            SqlDataSource1  .FilterExpression = d1.SelectedValue.Trim() + " like '%" + t1.Text.Trim() + "%'";

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