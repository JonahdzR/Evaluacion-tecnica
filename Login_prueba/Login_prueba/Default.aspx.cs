using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login_prueba
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Carga el nombre de usuario (en este caso su correo electronico) ingresado desde el login.
            if (Session["usuario"] != null)
            {
                string mensaje = Convert.ToString(Session["usuario"]);
                lblBienvenida.Text = "Bienvenido " + mensaje + ".";

            }
            else
            {
                lblBienvenida.Text = "Bienvenido.";
            }

        }
    }
}