using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStop_MS
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter sda;
        SqlConnection conn;
        public static int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminId"] != null)
            {
                if(!IsPostBack)
                {
                    fnBindFormView();
                }
            }
            else
            {
                Response.Redirect("adminLogin.aspx");
            }
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

        protected void fnBindFormView()
        {
            fnConnectDb();
            try
            {
                string qry = "SELECT * FROM tblAdminProfile";
                cmd = new SqlCommand(qry,conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                fvAdmin.DataSource = ds;
                fvAdmin.DataBind();
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void fnUpdate()
        {
            fnConnectDb();
            try
            {
                TextBox txtAdmin = (TextBox)fvAdmin.FindControl("txtCustomerID");
                TextBox txtFirstName = (TextBox)fvAdmin.FindControl("txtFirstName");
                TextBox txtLastName = (TextBox)fvAdmin.FindControl("txtLastName");
                TextBox txtEmail = (TextBox)fvAdmin.FindControl("txtEmail");
                TextBox txtPhone = (TextBox)fvAdmin.FindControl("txtPhone");
                TextBox txtState = (TextBox)fvAdmin.FindControl("txtState");
                TextBox txtCity = (TextBox)fvAdmin.FindControl("txtCity");
                TextBox txtAddress = (TextBox)fvAdmin.FindControl("txtAddress");

                fnConnectDb();
                string qry = "UPDATE tblAdminProfile SET adminFName = @fname, adminLName = @lname, adminEmail = @email, adminAddress = @add, adminCity = @city, adminPhone = @phone, adminState = @state WHERE adminID = @id";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("fname", txtFirstName.Text);
                cmd.Parameters.AddWithValue("lname", txtLastName.Text);
                cmd.Parameters.AddWithValue("email", txtEmail.Text);
                cmd.Parameters.AddWithValue("add", txtAddress.Text);
                cmd.Parameters.AddWithValue("phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("state", txtState.Text);
                cmd.Parameters.AddWithValue("city", txtCity.Text);
                cmd.Parameters.AddWithValue("id", Session["adminId"]);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblStatus.Text = "Admin Details Updated";
                }
                else
                {
                    lblStatus.Text = "Admin Update Failed";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            fnUpdate();
        }
    }
}