using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStop_MS
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter sda = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["gameId"] != null)
            {
                if (!IsPostBack)
                {
                    fnDisplayCustomer();
                    if (Session["cid"] == null)
                    {
                        Response.Redirect("~/adminCustomerList.aspx");
                    }
                    Button btnDelete = (Button)fvCustomer.FindControl("btnDelete");
                    if (cbDeleteButton != null && btnDelete != null)
                    {
                        btnDelete.Enabled = cbDeleteButton.Checked;
                    }
                }
            } 
        }

        public void fnConnect()
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
                    lblStatus.Text = "Connection Failed";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void fnDisplayCustomer()
        {
            try
            {
                fnConnect();
                string qry = "SELECT * FROM tblCustomers WHERE CustomerID = @cid";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("cid", Session["cid"]);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                fvCustomer.DataSource = ds;
                fvCustomer.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void fnUpdate()
        {
            try
            {
                TextBox txtCustomerID = (TextBox)fvCustomer.FindControl("txtCustomerID");
                TextBox txtFirstName = (TextBox)fvCustomer.FindControl("txtFirstName");
                TextBox txtLastName = (TextBox)fvCustomer.FindControl("txtLastName");
                TextBox txtEmail = (TextBox)fvCustomer.FindControl("txtEmail");
                TextBox txtState = (TextBox)fvCustomer.FindControl("txtState");
                TextBox txtCity = (TextBox)fvCustomer.FindControl("txtCity");
                TextBox txtAddress = (TextBox)fvCustomer.FindControl("txtAddress");

                fnConnect();
                string qry = "UPDATE tblCustomers SET CustomerFName = @fname, CustomerLName = @lname, CustomerEmail = @email, CustomerAddress = @add, CustomerCity = @city, CustomerState = @state WHERE CustomerID = @id";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("fname", txtFirstName.Text);
                cmd.Parameters.AddWithValue("lname", txtLastName.Text);
                cmd.Parameters.AddWithValue("email", txtEmail.Text);
                cmd.Parameters.AddWithValue("add", txtAddress.Text);
                cmd.Parameters.AddWithValue("state", txtState.Text);
                cmd.Parameters.AddWithValue("city", txtCity.Text);
                cmd.Parameters.AddWithValue("id", txtCustomerID.Text);
                int res = cmd.ExecuteNonQuery();
                if(res>0)
                {
                    lblStatus.Text = "Customer Details Updated";
                }
                else
                {
                    lblStatus.Text = "Customer Update Failed";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void fnDelete()
        {
            try
            {
                fnConnect();
                string qry = "DELETE FROM tblCustomers WHERE CustomerID = @id";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("id", Session["cid"]);
                int res = cmd.ExecuteNonQuery();
                if(res>0)
                {
                    Response.Redirect("~/adminCustomerList.aspx");
                }
                else
                {
                    lblStatus.Text = "Account Deletion failed";
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            fnDelete();
        }

        protected void cbDeleteButton_CheckedChanged(object sender, EventArgs e)
        {
            Button btnDelete = (Button)fvCustomer.FindControl("btnDelete");
            btnDelete.Enabled = cbDeleteButton.Checked;
        }
    }


}