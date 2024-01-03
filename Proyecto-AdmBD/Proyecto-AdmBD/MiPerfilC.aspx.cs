using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;

namespace Proyecto_AdmBD
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        ClaseManteni mante = new ClaseManteni();
        private string tipo = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            // variable de sesion para saber datos del logeado
            string cedulaSesion = Session["Cedula"] as string;
            

            DataTable datos = mante.ObtenerDatosPorCedula(cedulaSesion);

            if (datos.Rows.Count > 0)
            {
                DataRow fila = datos.Rows[0];

                tipo = fila["Tipo"].ToString();
                string cedula = fila["Cedula"].ToString();
                string nombre = fila["Nombre"].ToString();
                string primerApellido = fila["PrimerApellido"].ToString();
                string segundoApellido = fila["SegundoApellido"].ToString();
                string correo = fila["Correo"].ToString();
                string telefono = fila["Telefono"].ToString();
                string estado = fila["Estado"].ToString();

                lblCedulaCli.Text = cedula;
                txtNombreCli.Value = nombre;
                txt1ApellidoCli.Value = primerApellido;
                txt2ApellidoCli.Value = segundoApellido;
                txtCorreoCli.Value = correo;
                txtTelefonoCli.Value = telefono;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            // variable de sesion para saber datos del logeado
            string cedulaSesion = Session["Cedula"] as string;

            string cedula = lblCedulaCli.Text;
            string nombre = Request.Form["txtNombreCli"];
            string apellido1 = Request.Form["txt1ApellidoCli"];
            string apellido2 = Request.Form["txt2ApellidoCli"];
            string correo = Request.Form["txtCorreoCli"];
            int telefono = int.Parse(Request.Form["txtTelefonoCli"]);
            DateTime fechaNac = DateTime.Parse(Request.Form["fechaNac"]);
            object resultado = mante.MantenimientoClientes2(cedula, nombre, apellido1, apellido2, correo, telefono, false, fechaNac, 2);

            // Agregar la columna de Cedula_Cli al control GridView
            if (resultado is string mensajeRespuesta)
            {
                lblRespu.Text = mensajeRespuesta;
            }
            else if (resultado is DataTable dataTable)
            {
                
            }
            lblRespu.Text = "Cliente modificado con éxito.";

        }
    }
}