<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MensajeClientes_Oferentes.aspx.cs" Inherits="Proyecto_AdmBD.MensajeClientes_Oferentes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mensajes</title>
     <link rel="stylesheet" href="Estilos/Estilo_MensaCli_Of.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <form id="form1" runat="server">
           <div>
                     <asp:Label ID="Label1" runat="server" Text="Enviar Mensaje al Oferente"></asp:Label><br />
        <asp:TextBox ID="txtClienteCedula" runat="server" placeholder="Cedula Cliente"></asp:TextBox>
        <asp:TextBox ID="txtOferente" runat="server" placeholder="Cedula Oferente"></asp:TextBox>
        <asp:TextBox ID="txtMensajeOf" runat="server" placeholder="Mensaje"></asp:TextBox>
            <br />
             <asp:Label ID="lblRespuesta" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnMensaje" runat="server" Text="Enviar Mensaje" OnClick="btnMensaje_Click" />
               <p class="signup-link"><a href="MenuCli.aspx">VOLVER AL INICIO</a></p>
        </div>
    </form>
</body>
</html>
