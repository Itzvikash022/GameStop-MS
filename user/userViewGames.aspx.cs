using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography.X509Certificates;
using System.IO;

namespace GameStop_MS.user
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int gameId;
        public static int price;
        public static string gameName;
        public static string genre;
        public static string image;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] != null)
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["GameID"] != null)
                    {
                        gameId = Convert.ToInt32(Request.QueryString["GameID"]);
                        fnBindDataList();
                    }
                    else if (Session["GameID"] != null)
                    {
                        gameId = (int) Session["GameID"];
                        fnBindDataList();
                    }
                    else
                    {
                        Response.Redirect("userGames.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }
        }

        protected void fnConnect()
        {
            try
            {
                string ConStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(ConStr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    Response.Write("Connected");
                }
                else
                {
                    Response.Write("Connection failed");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void fnBindDataList()
        {
            fnConnect();
            try
            {
                string qry = "SELECT * FROM tblGames WHERE GameId = @gid";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("gid", gameId);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                dlGameDetails.DataSource = ds;
                dlGameDetails.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Session["GameIdBuy"] = gameId;
            Response.Redirect("userSales.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Session["GameIdCart"] = gameId;
            fnFetchGames();
            fnCart();
        }

        public void fnFetchGames()
        {
            fnConnect();
            string qry = "SELECT * FROM tblGames WHERE gameId = @id";
            cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("id", gameId);
            SqlDataReader dr = cmd.ExecuteReader();

            try
            {
                if (dr.Read())
                {
                    gameName = dr["GameName"].ToString();
                    price = (int)dr["Price"];
                    image = dr["ImageUrl"].ToString();
                    genre = dr["Genre"].ToString();
                }
                else
                {
                    lblStatus.Text = "No Data Found";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }
        public void fnCart()
        {
            try
            {
                fnConnect();
                string qry = "INSERT INTO tblGamesCart(GameName, Price, ImageUrl , CustomerEmail , Genre, GameId) VALUES(@name, @price, @image , @email , @genre, @gid)";
                cmd = new SqlCommand(qry, conn);

                cmd.Parameters.AddWithValue("name", gameName);
                cmd.Parameters.AddWithValue("price", price);
                cmd.Parameters.AddWithValue("image", image);
                cmd.Parameters.AddWithValue("genre", genre);
                cmd.Parameters.AddWithValue("gid", gameId);
                cmd.Parameters.AddWithValue("email", Session["userEmail"]);

                int res = cmd.ExecuteNonQuery();

                if (res > 0)
                {
                    Response.Redirect("userCart.aspx");
                }
                else
                {
                    lblStatus.Text = "Failed to Add to Cart :(";
                }

            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }
    }
}
