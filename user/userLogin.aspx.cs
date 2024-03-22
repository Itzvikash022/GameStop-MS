using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace GameStop_MS
{
    public partial class userLogin : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnectDb();
        }
        public void fnConnectDb()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(conStr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    //Response.Write("Connected");
                }
                else
                {
                    Response.Write("Connection Failed");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                fnConnectDb();
                string qry = "SELECT COUNT(*) FROM tblCustomers WHERE CustomerEmail = @id AND CustomerPassword = @pass";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("id", txtUserEmail.Text);
                cmd.Parameters.AddWithValue("pass", txtUserPass.Text);
                int res = (int)cmd.ExecuteScalar();

                if (res > 0)
                {
                    Session["userEmail"] = txtUserEmail.Text;
                    Response.Redirect("~/user/userGames.aspx");
                }
                else
                {
                    lblStatus.Text = "Invalid Email Or Password";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }
    }
}