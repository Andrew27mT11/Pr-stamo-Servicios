using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;

namespace Proyecto_AdmBD
{
    public partial class Login : System.Web.UI.Page
    {
        ClaseManteni mante = new ClaseManteni();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnValidar_Click(object sender, EventArgs e)
        {
            string nombreUsuario = Request.Form["usuario"];
            string contrasena = Request.Form["password"];
            string respuesta = "";
            string cedOf = "";
            string cedCli = "";
            string cedAdm = "";

            ClaseManteni mante = new ClaseManteni();
            respuesta = mante.Login(nombreUsuario, contrasena, out cedOf, out cedCli, out cedAdm);

            if (respuesta == "Login successful")
            {
                if (!string.IsNullOrEmpty(cedOf))
                {
                    string cedula = mante.ObtenerCedula(nombreUsuario);
                    // Almacenar los datos del usuario en variables de sesión
                    Session["Cedula"] = cedula;

                    // Redireccionar a la página correspondiente para cedOf
                    Response.Redirect("MenuOf.aspx");
                }
                else if (!string.IsNullOrEmpty(cedCli))
                {
                    string cedula = mante.ObtenerCedula(nombreUsuario);
                    // Almacenar los datos del usuario en variables de sesión
                    Session["Cedula"] = cedula;

                    // Redireccionar a la página correspondiente para cedCli
                    Response.Redirect("MenuCli.aspx");
                }
                else if (!string.IsNullOrEmpty(cedAdm))
                {
                    string cedula = mante.ObtenerCedula(nombreUsuario);
                    // Almacenar los datos del usuario en variables de sesión
                    Session["Cedula"] = cedula;

                    // Redireccionar a la página correspondiente para cedAdm
                    Response.Redirect("MenuAdm.aspx");
                }
            }
            else
            {
                lblRespu.Text = respuesta;
            }
        }

    }
}