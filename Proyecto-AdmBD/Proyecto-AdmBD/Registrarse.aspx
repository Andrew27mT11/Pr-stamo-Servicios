<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="Proyecto_AdmBD.Registrarse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registrarse</title>
    <link rel="stylesheet" href="Estilos/Estilo-Registrarse.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <div id="contenedor">
        <div id="central">
            <div id="registro">
                <div class="titulo">
                    Registro de Usuarios
                </div>
                <form id="registrarform" runat="server">

                    <input type="text" name="cedula" placeholder="Cedula" required>

                    <input type="text" name="nombre" placeholder="Nombre" required>

                    <input type="text" name="apellido1" placeholder="Primer Apellido" required>

                    <input type="text" name="apellido2" placeholder="Segundo Apellido">

                    <input type="date" name="Edad" placeholder="Edad">

                    <input type="text" name="correo" placeholder="Correo Electronico" required>

                    <input type="text" name="telefono" placeholder="Telefono" required>

                    <input type="text" name="usuario" placeholder="Nombre Usuario" required>

                    <input type="password" placeholder="Contraseña" name="contrasena" required>

                    <!-- Casilla de verificación para seleccionar el tipo de usuario -->
                    <label class="oferente-label">
                        Marcar la casilla si es Oferente
                        <input type="checkbox" id="chkOferente" name="tipoUsuario" value="oferente" onclick="mostrarCamposOferente()">
                    </label>

                    <!-- Campos adicionales para el oferente -->
                    <div id="camposOferente" style="display: none;">
                        <select id="seleccionarOp" runat="server" onchange="filtrarDatos()">
                            <option value="1">Fontanero</option>
                            <option value="2">Niñera</option>
                            <option value="3">Pintor</option>
                            <option value="4">Empleada Doméstica</option>
                        </select>

                        <input type="text" name="provincia" placeholder="Provincia">
                    </div>
                    <script>
                            function mostrarCamposOferente() {
                                var camposOferente = document.getElementById("camposOferente");
                                var chkOferente = document.getElementById("chkOferente");

                                if (chkOferente.checked) {
                                    camposOferente.style.display = "block";
                                    document.querySelector('input[name="servicio"]').required = true;
                                    document.querySelector('input[name="provincia"]').required = true;
                                } else {
                                    camposOferente.style.display = "none";
                                    document.querySelector('input[name="servicio"]').required = false;
                                    document.querySelector('input[name="provincia"]').required = false;
                                }
                            }
                    </script>
                    <asp:Label ID="lblRespu" runat="server"></asp:Label>


                    <asp:Button ID="btnRegistrarse" runat="server" BackColor="Orange" BorderColor="Green" Text="Registrarse" OnClick="btnRegistrarse_Click" />
                </form>
            </div>
            <div class="inferior">
                <a href="Login.aspx">Iniciar Sesión</a>
            </div>
        </div>
    </div>
</body>
</html>
