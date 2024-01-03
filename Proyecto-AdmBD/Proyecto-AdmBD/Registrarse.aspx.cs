using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;

namespace Proyecto_AdmBD
{
    public partial class Registrarse : System.Web.UI.Page
    {
        ClaseRegistro objRegistro = new ClaseRegistro();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["cedula"];
            string nombre = Request.Form["nombre"];
            string apellido1 = Request.Form["apellido1"];
            string apellido2 = Request.Form["apellido2"];
            string correo = Request.Form["correo"];
            int telefono = int.Parse(Request.Form["telefono"]);
            DateTime FechaNac = Convert.ToDateTime(Request.Form["Edad"]);
            string usuario = Request.Form["usuario"];
            string contrasena = Request.Form["contrasena"];

            string respuesta = "";

            try
            {
                if (Request.Form["tipoUsuario"] == "oferente")
                {
                    string provincia = Request.Form["provincia"];
                    int opcionSeleccionada = Convert.ToInt32(seleccionarOp.Value);
                    int servicio = opcionSeleccionada;

                    objRegistro.MantenimientoOferentes(cedula, nombre, apellido1, apellido2, FechaNac,correo, telefono, provincia, false, servicio, 1);
                    objRegistro.MantenimientoUsuarios(cedula, usuario, contrasena, 1, 1);

                    respuesta = "Oferente registrado correctamente";
                }
                else
                {
                    objRegistro.MantenimientoClientes(cedula, nombre, apellido1, apellido2, FechaNac, correo, telefono, false, 1);
                    objRegistro.MantenimientoUsuarios(cedula, usuario, contrasena, 1, 2);

                    respuesta = "Cliente registrado correctamente";
                }
            }
            catch (SqlException ex)
            {
                // Capturar el mensaje de error generado por el procedimiento almacenado
                respuesta = "Error en el registro: " + ex.Message;
            }
            catch (Exception ex)
            {
                // Capturar cualquier otra excepción no relacionada con SQL
                respuesta = "Error en el registro: " + ex.Message;
            }

            lblRespu.Text = respuesta;
        }
    }
}