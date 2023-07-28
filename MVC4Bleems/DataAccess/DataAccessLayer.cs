using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Configuration;
using Microsoft.Extensions.Configuration;
using MVC4Bleems.Models;
using Microsoft.AspNetCore.Mvc;

namespace MVC4Bleems.DataAccess
{
    public class DataAccessLayer
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-MK8005I;Initial Catalog=MVC4Bleems;Trusted_Connection=True;Integrated Security=True;TrustServerCertificate=True;MultipleActiveResultSets=true");
       

        public List<Products> GetProducts(int id, string fromdate, string todate, string random, string currency)
        {
            
            List<Products> custlist = null;
            try
            {
                var query = random != null ? 5 : 4;
                var key = "@Query";
                var sp = "AddEditProduct"; 
                if(id > 0)
                {
                    sp = "GetItemDetails";
                    key = "@Id";
                    query = id;
                }


                SqlCommand cmd = new SqlCommand(sp, con);
                
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(key, query);
               
                if (fromdate != "")
                {
                    cmd.Parameters.AddWithValue("@fromdate", Convert.ToDateTime(fromdate));
                    cmd.Parameters.AddWithValue("@todate", Convert.ToDateTime(todate).AddDays(1));
                }
                
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                //da.SelectCommand = cmd;
                da.Fill(ds);
                custlist = new List<Products>();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    Products cobj = new Products();
                    cobj.Id = Convert.ToInt32(ds.Tables[0].Rows[i]["Id"].ToString());
                    cobj.Name = ds.Tables[0].Rows[i]["Name"].ToString();
                    cobj.Description = ds.Tables[0].Rows[i]["Description"].ToString();
                    cobj.Price = ds.Tables[0].Rows[i]["Price"].ToString();
                    if(currency != "") cobj.Price = ds.Tables[0].Rows[i]["Price"].ToString() + " " + ds.Tables[0].Rows[i]["Currency"].ToString();
                    cobj.Currency = ds.Tables[0].Rows[i]["Currency"].ToString();
                    cobj.CategoryId = Convert.ToInt32(ds.Tables[0].Rows[i]["CategoryId"]);
                    cobj.CategoryName = ds.Tables[0].Rows[i]["Name1"].ToString(); 
                    cobj.CreatedAt = Convert.ToDateTime(ds.Tables[0].Rows[i]["CreatedAt"]);
                    custlist.Add(cobj);
                }

                return custlist;
            }
            catch (Exception ex)
            {
                return custlist;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Categories> GetCategs()
        {

            List<Categories> custlist = null;
            try
            {
                var query = 4;               
                
                SqlCommand cmd = new SqlCommand("SPCategories", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Query", query);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                //da.SelectCommand = cmd;
                da.Fill(ds);
                custlist = new List<Categories>();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    Categories cobj = new Categories();
                    cobj.Id = Convert.ToInt32(ds.Tables[0].Rows[i]["Id"].ToString());
                    cobj.Name = ds.Tables[0].Rows[i]["Name"].ToString();                    
                    custlist.Add(cobj);
                }

                return custlist;
            }
            catch (Exception ex)
            {
                return custlist;
            }
            finally
            {
                con.Close();
            }
        }


        public string CrudProduct(Products product, int query)
        {

            string result = "";
            try
            {
                
                SqlCommand cmd = new SqlCommand("AddEditProduct", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Query", query);
                if(product.Id > 0) cmd.Parameters.AddWithValue("@Id", product.Id);
                cmd.Parameters.AddWithValue("@Name", product.Name);
                cmd.Parameters.AddWithValue("@Description", product.Description);
                cmd.Parameters.AddWithValue("@Price", product.Price);
                cmd.Parameters.AddWithValue("@Currency", product.Currency);
                cmd.Parameters.AddWithValue("@CategoryId", product.CategoryId);
                con.Open();
                result = cmd.ExecuteScalar().ToString();
                return result;

            }
            catch (Exception ex)
            {
                return result = "";
            }
            finally
            {
                con.Close();
            }
        }

        public string CrudCateg(Categories categ, int query)
        {

            string result = "";
            try
            {

                SqlCommand cmd = new SqlCommand("SPCategories", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Query", query);
                if (categ.Id > 0) cmd.Parameters.AddWithValue("@Id", categ.Id);
                cmd.Parameters.AddWithValue("@Name", categ.Name);
                con.Open();
                result = cmd.ExecuteScalar().ToString();
                return result;

            }
            catch (Exception ex)
            {
                return result = "";
            }
            finally
            {
                con.Close();
            }
        }


        

    }
}
