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
            if (!IsPostBack)
            {
                if (Request.QueryString["GameID"] != null)
                {
                    gameId = Convert.ToInt32(Request.QueryString["GameID"]);
                    fnBindDataList();
                }
                else
                {
                    Response.Redirect("userGames.aspx");
                }
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

        protected void fnDownload()
        {
            try
            {
                fnConnect();
                string qry = "SELECT DownloadPath FROM tblGames WHERE GameId = @gameId";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("gameId", gameId);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string path = dr["DownloadPath"].ToString();

                    if (!string.IsNullOrEmpty(path))
                    {
                        Response.ContentType = MimeMapping.GetMimeMapping(path); // Get content type dynamically
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(path)); // Set the file name
                        Response.TransmitFile(path); // Transmit the file
                        Response.End(); // End the response
                    }
                    else
                    {
                        lblStatus.Text = "File Not Found";
                    }
                }
                conn.Close();


            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Session["GameIdBuy"] = gameId;
            Response.Redirect("#");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Session["GameIdCart"] = gameId;
            fn_fetch_game();
            fn_cart();
            //Response.Redirect("cartItemsDisplay.aspx");
        }

        public void fn_fetch_game()
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
                    Response.Write("Bhai Session kaha call kar diya aap ne (hehehehe) hai");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        public void fn_cart()
        {
            try
            {
                fnConnect();
                string qry = "INSERT INTO tblGamesCart(GameName, Price, ImageUrl , CustomerEmail , Genre) VALUES(@name, @price, @image , @email , @genre)";
                cmd = new SqlCommand(qry, conn);

                cmd.Parameters.AddWithValue("name", gameName);
                cmd.Parameters.AddWithValue("price", price);
                cmd.Parameters.AddWithValue("image", image);
                cmd.Parameters.AddWithValue("genre", genre);
                cmd.Parameters.AddWithValue("email", "vy12@gmail.com");

                int res = cmd.ExecuteNonQuery();

                if (res > 0)
                {
                    lblStatus.Text = "Cart Successfull.";
                }
                else
                {
                    lblStatus.Text = "Failed to Cart Game.";
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            fnDownload();
        }
    }
}
