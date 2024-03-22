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
    public partial class WebForm4 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static string name;
        public static int price;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] != null)
            {
                if (Session["GameIdBuy"]!=null)
                {
                    if (!IsPostBack)
                    {
                        fnbindDataList();
                    }
                }
                else
                {
                    Response.Redirect("userGames.aspx");
                }
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }
            
        }
        protected void fnconnectdb()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(connStr);
                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    /*lblStatus.Text = "Database Connected";*/

                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }
        protected void fnbindDataList()
        {
            fnconnectdb();
            try
            {
                string qry = "SELECT * FROM tblGames WHERE GameId=@G_id";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("G_id", Session["GameIdBuy"]);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gdPay.DataSource = ds;
                gdPay.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }
        protected void fnYes()
        {
            fnconnectdb();
            try
            {
                string qry = "INSERT INTO tblSales(GameId,CustomerEmail,SalesPrice,SalesDate,GameName) VALUES(@gid,@c_eml,@s_price,@s_date,@gName)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("gid", Session["GameIdBuy"]);
                cmd.Parameters.AddWithValue("c_eml", Session["userEmail"]);
                cmd.Parameters.AddWithValue("s_price", price);
                cmd.Parameters.AddWithValue("gName", name);
                cmd.Parameters.AddWithValue("s_date", DateTime.Now.ToString("MM-dd-yyyy"));
                sda = new SqlDataAdapter(cmd);
                int res = cmd.ExecuteNonQuery();
                if(res > 0)
                {
                    Response.Redirect("userOwned.aspx");
                }
                else
                {
                    lblStatus.Text = "Failed to Buy the Game";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }
        public void fnCustomer()
        {
            try
            {
                fnconnectdb();
                string qry = "SELECT * FROM tblGames WHERE GameId=@gId";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("gId", Session["GameIdBuy"]);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    name = dr["GameName"].ToString();
                    price = Convert.ToInt32(dr["Price"].ToString());
                }
                else
                {
                    lblStatus.Text = "No Data Found!";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            fnCustomer();
            fnYes();
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("userGames.aspx");
        }
    }
}