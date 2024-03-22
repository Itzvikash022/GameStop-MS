using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStop_MS.user
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

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
                    // Response.Write("Connected");
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

        protected void fnInsert()
        {
            fnConnectDb();
            try
            {
                string qry = "INSERT INTO tblCustomers(CustomerFName,CustomerEmail,CustomerPhone,CustomerPassword,CustomerLname,CustomerAddress,CustomerState,CustomerCity,CustomerGender,CustomerDOB,customerDate) VALUES(@fname,@email,@phone,@pass,@lname,@add,@state,@city,@gen,@cdob,@cdate)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("fname", txtFName.Text);
                cmd.Parameters.AddWithValue("email", txtEmail.Text);
                cmd.Parameters.AddWithValue("phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("pass", txtPassword.Text);
                cmd.Parameters.AddWithValue("lname", txtLName.Text);
                cmd.Parameters.AddWithValue("add", txtAddress.Text);
                cmd.Parameters.AddWithValue("state", txtState.Text);
                cmd.Parameters.AddWithValue("cdate", DateTime.Now.ToString("MM-dd-yyyy"));
                cmd.Parameters.AddWithValue("gen", rblGender.SelectedValue);
                cmd.Parameters.AddWithValue("cdob", txtDOB.Text);
                cmd.Parameters.AddWithValue("city", txtCity.Text);

                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblStatus.Text = "Sign Up Successfull";
                }
                else
                {
                    lblStatus.Text = "Sign Up Failed";
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void fnReset()
        {
            txtAddress.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtConPassword.Text = string.Empty;
            txtDOB.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtFName.Text = string.Empty;
            txtLName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtState.Text = string.Empty;
            rblGender.ClearSelection();

        }

        protected void btnReset_Click1(object sender, EventArgs e)
        {
            fnReset();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            fnInsert();
        }
    }
}