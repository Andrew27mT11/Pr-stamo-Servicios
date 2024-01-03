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
    public partial class MiPerfilOf : System.Web.UI.Page
    {
        ClaseManteni mante = new ClaseManteni();

        protected void Page_Load(object sender, EventArgs e)
        {
            // variable de sesion para saber datos del logeado
            string cedulaSesion = Session["Cedula"] as string;

            DataTable datos = mante.ObtenerDatosPorCedula(cedulaSesion);

            if (datos.Rows.Count > 0)
            {
                DataRow fila = datos.Rows[0];

                string cedula = fila["Cedula"].ToString();
                string nombreCompleto = fila["Nombre"].ToString();
                string primerApellido = fila["PrimerApellido"].ToString();
                string segundoApellido = fila["SegundoApellido"].ToString();
                string correo = fila["Correo"].ToString();
                string telefono = fila["Telefono"].ToString();
                string estado = fila["Estado"].ToString();
                string provincia = "";
                string idServicio = "";

                lblCedulaCli.Text = cedula;
                txtNombreCli.Value = nombreCompleto;
                txt1ApellidoCli.Value = primerApellido;
                txt2ApellidoCli.Value = segundoApellido;
                txtCorreoCli.Value = correo;
                txtTelefonoCli.Value = telefono;
                
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string cedula = lblCedulaCli.Text;
            string nombre = Request.Form["txtNombreCli"];
            string apellido1 = Request.Form["txt1ApellidoCli"];
            string apellido2 = Request.Form["txt2ApellidoCli"];
            string correo = Request.Form["txtCorreoCli"];
            int telefono = int.Parse(Request.Form["txtTelefonoCli"]);
            int opcionSeleccionada = Convert.ToInt32(seleccionarOp.Value);
            int servicio = opcionSeleccionada;
            string provincia = Request.Form["txtProvincia"];

            DataTable resultado = mante.MantenimientoOferentes(cedula, nombre, apellido1, apellido2, correo, telefono, provincia, false, servicio, 2);

            lblRespu.Text = "Oferente modificado con éxito.";
        }
    }
}