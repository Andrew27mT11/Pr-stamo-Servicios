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
    public partial class VerSolicitudes : System.Web.UI.Page
    {
        ClaseSolicitudes objSoli = new ClaseSolicitudes(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            string cedulaSesion = Session["Cedula"] as string;
            DataTable dataTable = objSoli.ObtenerMensajes(cedulaSesion); // Obtener los mensajes

            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                gvSolicitudes.DataSource = dataTable;
                gvSolicitudes.DataBind();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            string cedulaSesion = Session["Cedula"] as string;
            int idMensaje = int.Parse(txtSoli.Text);
            objSoli.ActualizarEstadoMensaje(idMensaje, true);
            lblRespu.Text = "Solicitud aceptada correctamente";

            DataTable dataTable = objSoli.ObtenerMensajes(cedulaSesion); // Obtener los mensajes

            if (dataTable != null && dataTable.Rows.Count >= 0)
            {
                gvSolicitudes.DataSource = dataTable;
                gvSolicitudes.DataBind();
            }
        }

        protected void btnRechazar_Click(object sender, EventArgs e)
        {
            string cedulaSesion = Session["Cedula"] as string;
            int idMensaje = int.Parse(txtSoli.Text);
            objSoli.ActualizarEstadoMensaje(idMensaje, false);
            lblRespu.Text = "Solicitud rechazada correctamente";

            DataTable dataTable = objSoli.ObtenerMensajes(cedulaSesion); // Obtener los mensajes

            if (dataTable != null && dataTable.Rows.Count >= 0)
            {
                gvSolicitudes.DataSource = dataTable;
                gvSolicitudes.DataBind();
            }
        }
    }
}