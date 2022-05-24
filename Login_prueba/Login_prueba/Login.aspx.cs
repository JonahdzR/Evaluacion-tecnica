using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

namespace Login_prueba
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Boton que valida si el usuario ingresado ya existe, ademas de validar sus credenciales
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            //Conexion a SQL
            SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["DBLOCAL"].ConnectionString);

            conexion.Open();

            // Valida que el query regrese almenos un registro
            string cadena = "select * from usuario_form where email = '" + txtEmail.Text + "' and password = '" + txtContraseña.Text + "'";
            SqlCommand cmd = new SqlCommand(cadena, conexion);

            SqlDataReader reader = cmd.ExecuteReader();

            // En caso de regresar registros, avanza a la pagina de inicio
            if (reader.HasRows)
            {
                //Guarda el email mediante una sesion para el nombre de usuario
                Session["usuario"] = txtEmail.Text;
                Response.Write("<script>alert('Conexion exitosa');</script>");
                Response.Redirect("Default.aspx");
            }
            // En caso de no haber registros, muestra mensaje de error
            else
            {
                lblError.Text = "Email o contraseña incorrecto";
            }
        }
    }
}