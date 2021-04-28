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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void send_Click(object sender, EventArgs e)
        {
            bool pt = ptype.Enabled;
            bool pn = pname.Enabled;
            string pts, pns;
            pts = pns = "'  '";

            if(pt && pn)
            {
                pns ="'"+ pname.Text.Trim() +"'";
                pts ="'"+ ptype.Text.Trim() +"'";
            }

            if ((topic.Text != "") && (text.Text != ""))
            {
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                SqlCommand comm = new SqlCommand("INSERT INTO topics(id,topic,creater,difinition,date,type,text,project,pname,ptype) VALUES( @ind, @topic, @creater, @difinition, @date, @type, @text, 'LOG',"+pns+","+pts+")", conn);
                SqlParameter ind = new SqlParameter("ind", id.Text.Trim());
                SqlParameter t = new SqlParameter("topic", topic.Text.Trim());
                SqlParameter c = new SqlParameter("creater", User.Identity.Name);
                SqlParameter d = new SqlParameter("difinition", TextBox2.Text.Trim());
                SqlParameter date = new SqlParameter("date", DateTime.Now.ToString());
                SqlParameter ty = new SqlParameter("type", type.Text.Trim());
                SqlParameter te = new SqlParameter("text", text.Text.Trim());
                comm.Parameters.Add(ind);
                comm.Parameters.Add(t);
                comm.Parameters.Add(c);
                comm.Parameters.Add(d);
                comm.Parameters.Add(date);
                comm.Parameters.Add(ty);
                comm.Parameters.Add(te);
                conn.Open();
                if (comm.ExecuteNonQuery() != 0)
                    message.Visible = true;
                conn.Close();
                text.Text = "";
                TextBox2.Text = "";
                topic.Text = "";
                id.Text = "";
                ptype.Enabled = pname.Enabled = false;
            }

        }

        protected void type_SelectedIndexChanged(object sender, EventArgs e)
        {

            if(type.Text.Trim()  == "ATMsoftware")
            {
                pname.Enabled = true;
                ptype.Enabled = false;

                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                SqlCommand comm = new SqlCommand("SELECT name FROM atmsoftware GROUP BY name ", conn);
                conn.Open();
                
                pname.DataSource =  comm.ExecuteReader();
                pname.DataTextField = "name";
                pname.DataValueField  = "name";
                this.DataBind();
                conn.Close();

           }

            else if (type.Text.Trim() == "ATMhardware")
            {
                pname.Enabled = true;
                ptype.Enabled = false;
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                SqlCommand comm = new SqlCommand("SELECT name FROM atmhardware GROUP BY name ", conn);
                conn.Open();

                pname.DataSource = comm.ExecuteReader();
                pname.DataTextField = "name";
                pname.DataValueField = "name";
                this.DataBind();
                conn.Close();

            }

            else
            {
                ptype.Enabled = pname.Enabled = false;
                
            }
        }

        protected void type_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void pname_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (type.Text.Trim() == "ATMsoftware")
            {
                ptype.Enabled = true;
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                SqlCommand comm = new SqlCommand("SELECT model FROM atmsoftware where name = '" + pname.Text.Trim() +"'" , conn);
                conn.Open();

                ptype.DataSource = comm.ExecuteReader();
                ptype.DataTextField = "model";
                ptype.DataValueField = "model";
                this.DataBind();
                conn.Close();

            }

            else if (type.Text.Trim() == "ATMhardware")
            {
                ptype.Enabled = true;
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                SqlCommand comm = new SqlCommand("SELECT model FROM atmhardware where name = '" + pname.Text.Trim() + "'", conn);
                conn.Open();

                ptype.DataSource = comm.ExecuteReader();
                ptype.DataTextField = "model";
                ptype.DataValueField = "model";
                this.DataBind();
                conn.Close();

            }


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/topics.aspx");
        }
    }
}