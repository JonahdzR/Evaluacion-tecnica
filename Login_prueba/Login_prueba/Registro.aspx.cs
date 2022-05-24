using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Data;

namespace Login_prueba
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //VALIDAR SI EL USUARIO YA EXISTE
        public bool Validar(string userName)
        {
            bool existe = false;
            SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["DBLOCAL"].ConnectionString);
            {
                conexion.Open();

                string cadena = "SELECT COUNT(*) FROM usuario_form WHERE email=@email";
                SqlCommand cmd = new SqlCommand(cadena, conexion);
                cmd.Parameters.AddWithValue("@email", userName);

                existe = Convert.ToInt32(cmd.ExecuteScalar()) > 0;

            }
            return existe;
        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            //VALIDA SI TODOS LOS CAMPOS ESTAN LLENADOS
            if (IsValid)
            {
                Registro user = new Registro();
                bool val = user.Validar(txtEmail.Text);

                SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["DBLOCAL"].ConnectionString);
                conexion.Open();

                string cadena = "insert into usuario_form (name, last_name, email, password) values (@name, @last_name, @email, @password)";

                SqlCommand comando = new SqlCommand(cadena, conexion);


                comando.Parameters.AddWithValue("@name", txtNombre.Text);
                comando.Parameters.AddWithValue("@last_name", txtApellido.Text);
                comando.Parameters.AddWithValue("@email", txtEmail.Text);
                comando.Parameters.AddWithValue("@password", txtPass.Text);



                //VALIDA SI EL USUARIO YA EXISTE EN LA BD
                if (val == true)
                {
                    Response.Write("<script>alert('Ya existe un usuario con el email que ingresaste');</script>");
                }
                else
                {
                    try
                    {
                        comando.ExecuteNonQuery();
                        Response.Redirect("Login.aspx");
                        Response.Write("<script>alert('Usuario creado exitosamente');</script>");

                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Algo ha salido mal');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Ingresa todos los datos');</script>");

            }
        }
    }
}
