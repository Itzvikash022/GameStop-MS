﻿using System;
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
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int gameId;
        public static int cartId;


        public void fnConnectDb()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;
                conn = new SqlConnection(constr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    Response.Write("Connection Successfull");
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

        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnectDb();

            //if (Session["GameIdCart"] != null)
            //{
            //    gameId = (int)Session["GameIdCart"];

            if (!Page.IsPostBack)
            {
                fnBindDataList();
            }

            //}
            //else
            //{
            //    Response.Redirect("");
            //}

            //fn_fetch_game();
            //fn_cart();
        }
        protected void fnBindDataList()
        {
            fnConnectDb();
            try
            {
                string qry = "SELECT * FROM tblGamesCart WHERE CustomerEmail = @email ";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("email", "vy12@gmail.com");
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gdGamesList.DataSource = ds;
                gdGamesList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {

        }

            
        protected void btnDownload_Click(object sender, EventArgs e)
        {
            
        }
        protected void fnDelete()
        {
            try
            {
                fnConnectDb();
                string qry = "DELETE FROM tblGamesCart WHERE CartId = @id";

                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("id", cartId);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblStatus.Text = "Game Data Deleted";
                }
                else
                {
                    lblStatus.Text = "Game Data failed to Delete";
                }
                gdGamesList.DataBind();
                fnBindDataList();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void gdGamesList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "DeleteRow")
            {
                cartId = Convert.ToInt32(e.CommandArgument);
                fnDelete();
            }
        }

        /*  protected void gdGamesList_RowDeleting(object sender, GridViewDeleteEventArgs e)
          {
          }*/

    }
}