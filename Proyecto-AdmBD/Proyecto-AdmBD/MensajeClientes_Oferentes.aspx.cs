using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
namespace Proyecto_AdmBD
{
    public partial class MensajeClientes_Oferentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMensaje_Click(object sender, EventArgs e)
        {
            ClaseSolicitudes objSoli = new ClaseSolicitudes();
            string cedulaOf = txtOferente.Text;
            string cedulaCli = txtClienteCedula.Text;
            string mensaje = txtMensajeOf.Text;
            objSoli.InsertarMensajeCli(cedulaOf, cedulaCli, mensaje);

            lblRespuesta.Text = "El mensaje fue enviado con éxito";
            txtOferente.Text = "";
            txtClienteCedula.Text = "";
            txtMensajeOf.Text = "";
        }
    }
}