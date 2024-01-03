using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
namespace Proyecto_AdmBD
{
    public partial class Registro_Admins : System.Web.UI.Page
    {
        ClaseManteni objMante = new ClaseManteni();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string cedulaAd = Request.Form["cedula"];
            string nombre = Request.Form["nombre"];
            string apellido1 = Request.Form["apellido1"];
            string apellido2 = Request.Form["apellido2"];
            string correo = Request.Form["correo"];
            int telefono = int.Parse(Request.Form["telefono"]);
            string usuario = Request.Form["usuario"];
            string contrasena = Request.Form["contrasena"];
            DateTime fechaNac = DateTime.Parse(Request.Form["fechaNac"]);

            object resultado = objMante.MantenimientoAdmin2(cedulaAd, nombre, apellido1, apellido2, correo, telefono, fechaNac, 1);
            if (resultado is string mensajeRespuesta)
            {
                lblRespu.Text = mensajeRespuesta;
            }
            
            objMante.ManteUsAdmin(usuario,contrasena,cedulaAd);
        }
    }
}