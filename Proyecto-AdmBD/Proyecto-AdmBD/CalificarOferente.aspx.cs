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
    public partial class CalificarOferente : System.Web.UI.Page
    {
        ClaseSolicitudes objSoli = new ClaseSolicitudes();
        protected void Page_Load(object sender, EventArgs e)
        {
            // Almacenar los datos del usuario en variables de sesión
            string cedulaCli = Session["Cedula"] as string;

            if (!IsPostBack)
            {
                // Agregar opciones del 1 al 5 al DropDownList
                for (int i = 1; i <= 5; i++)
                {
                    ddlCalificacion.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                DataTable mensajes = objSoli.ObtenerMensajesPorCedulaCli(cedulaCli);
                gvServicios.DataSource = mensajes;
                gvServicios.DataBind();
            }
        }

        protected void btnCalificar_Click(object sender, EventArgs e)
        {
            string cedOf = txtCedulaOf.Text;
            int mensaje = int.Parse(txtMensaje.Text);
            int calificacion = int.Parse(ddlCalificacion.SelectedValue);

            objSoli.InsertarCalificacionOf(cedOf,mensaje, calificacion);
            lblRespu.Text = "Calificación enviada con éxito";

            string cedulaCli = Session["Cedula"] as string;
            DataTable mensajes = objSoli.ObtenerMensajesPorCedulaCli(cedulaCli);
            gvServicios.DataSource = mensajes;
            gvServicios.DataBind();
        }
    }
}