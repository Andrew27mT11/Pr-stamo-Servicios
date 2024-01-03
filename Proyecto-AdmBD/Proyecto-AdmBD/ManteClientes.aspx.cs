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
    public partial class ManteClientes : System.Web.UI.Page
    {
        ClaseManteni objMantenimiento = new ClaseManteni();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["CedulaCli"];
            string nombre = Request.Form["NombreCli"];
            string apellido1 = Request.Form["1ApellidoCli"];
            string apellido2 = Request.Form["2ApellidoCli"];
            string correo = Request.Form["CorreoCli"];
            int telefono = int.Parse(Request.Form["TelefonoCli"]);
            string estado = Request.Form["EstadoCli"];
            DateTime fechaNac = DateTime.Parse(Request.Form["fechaNac"]);
            object resultado = objMantenimiento.MantenimientoClientes2(cedula, nombre, apellido1, apellido2, correo, telefono, false, fechaNac, 2);

            // Agregar la columna de Cedula_Cli al control GridView
            if (resultado is string mensajeRespuesta)
            {
                lblRespu.Text = mensajeRespuesta;
            }
            else if (resultado is DataTable dataTable)
            {
                gvClientes.DataSource = dataTable;
                gvClientes.DataBind();
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["CedulaCli"];
            string nombre = Request.Form["NombreCli"];
            string apellido1 = Request.Form["1ApellidoCli"];
            string apellido2 = Request.Form["2ApellidoCli"];
            string correo = Request.Form["CorreoCli"];
            int telefono = int.Parse(Request.Form["TelefonoCli"]);
            string estado = Request.Form["EstadoCli"];
            DateTime fechaNac = DateTime.Parse(Request.Form["fechaNac"]);
    
            object resultado = objMantenimiento.MantenimientoClientes2(cedula, nombre, apellido1, apellido2, correo, telefono, false, fechaNac, 3);

            // Agregar la columna de Cedula_Cli al control GridView
            if (resultado is string mensajeRespuesta)
            {
                lblRespu.Text = mensajeRespuesta;
            }
            else if (resultado is DataTable dataTable)
            {
                gvClientes.DataSource = dataTable;
                gvClientes.DataBind();
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string cedula = Request.Form["CedulaCli"];
            object resultado = objMantenimiento.BuscarDatos(cedula, 2);



            if (resultado is string mensajeRespuesta)
            {
                // Mostrar mensaje de respuesta en caso de error u otra información
                lblRespu.Text = mensajeRespuesta;
                gvClientes.DataSource = null; // Limpia el GridView si no hay datos válidos
                gvClientes.DataBind();
            }
            else if (resultado is DataTable dataTable)
            {
                // Mostrar el resultado en el control GridView
                gvClientes.DataSource = dataTable;
                gvClientes.DataBind();
            }
        }


        protected void btnCalcularPC_Click(object sender, EventArgs e)
        {
            objMantenimiento.CalcularPromedioClientes();
        }
    }
}

