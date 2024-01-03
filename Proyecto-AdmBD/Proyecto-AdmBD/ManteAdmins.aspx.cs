using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocios;

namespace Proyecto_AdmBD
{
    public partial class ManteAdmins : System.Web.UI.Page
    {
        ClaseManteni objMantenimiento = new ClaseManteni();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["CedulaAdm"];
            string nombre = Request.Form["NombreAdm"];
            string apellido1 = Request.Form["1ApellidoAdm"];
            string apellido2 = Request.Form["2ApellidoAdm"];
            string correo = Request.Form["CorreoAdm"];
            int telefono = int.Parse(Request.Form["TelefonoAdm"]);
            DateTime fechaNac = DateTime.Parse(Request.Form["fechaNac"]);

            object resultado = objMantenimiento.MantenimientoAdmin2(cedula, nombre, apellido1, apellido2, correo, telefono, fechaNac, 2);

            // Agregar la columna de Cedula_Cli al control GridView
            if (resultado is string mensajeRespuesta)
            {
                lblRespu.Text = mensajeRespuesta;
            }
            else if (resultado is DataTable dataTable)
            {
                gvAdmins.DataSource = dataTable;
                gvAdmins.DataBind();
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["CedulaAdm"];
            string nombre = Request.Form["NombreAdm"];
            string apellido1 = Request.Form["1ApellidoAdm"];
            string apellido2 = Request.Form["2ApellidoAdm"];
            string correo = Request.Form["CorreoAdm"];
            int telefono = int.Parse(Request.Form["TelefonoAdm"]);
            DateTime fechaNac = DateTime.Parse(Request.Form["fechaNac"]);

            object resultado = objMantenimiento.MantenimientoAdmin2(cedula, nombre, apellido1, apellido2, correo, telefono, fechaNac, 3);

            // Agregar la columna de Cedula_Cli al control GridView
            if (resultado is string mensajeRespuesta)
            {
                lblRespu.Text = mensajeRespuesta;
            }
            else if (resultado is DataTable dataTable)
            {
                gvAdmins.DataSource = dataTable;
                gvAdmins.DataBind();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["CedulaAdm"];


            object resultado = objMantenimiento.BuscarDatos(cedula,1);

        
            if (resultado is string mensajeRespuesta)
            {
                
                lblRespu.Text = mensajeRespuesta;
                gvAdmins.DataSource = null; 
                gvAdmins.DataBind();
            }
            else if (resultado is DataTable dataTable)
            {
               
                gvAdmins.DataSource = dataTable;
                gvAdmins.DataBind();
            }
        }
    }
}