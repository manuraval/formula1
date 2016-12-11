package servlet;

import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Manu
 */
public class subirFoto extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 8694550330232921876L;

	/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String error = null;
            String nombre = "";
            String extension = "";
            BufferedReader lectorNombre = new BufferedReader(new InputStreamReader(request.getPart("nombreFichero").getInputStream()));
            nombre = lectorNombre.readLine();
            lectorNombre.close();
            Part datosSubidos = request.getPart("foto");
            if (datosSubidos == null) {  // No se ha subido el fichero
                error = "No se ha recibido la imagen";
            } else if (datosSubidos.getSize() > 700 * 1024) {  // Fichero demasiado grande
                error = "No se permiten ficheros superiores a 700Kb";
            } else if (datosSubidos.getContentType().indexOf("image") == -1) {  // El fichero no es una imagen
                error = "El fichero recibido no es una imagen válida";
            } else {
                String tipoContenido = datosSubidos.getContentType();
                int posicion = tipoContenido.indexOf("/");
                extension = tipoContenido.substring(posicion + 1);
            }
            if (error == null) {
                nombre = nombre + "." + extension;
                //out.println("Subiendo fichero: " + nombre);
                //datosSubidos.write("/web/fotos/" + nombre);
                String contexto = request.getServletContext().getRealPath("Images/") + "/" + nombre;
                out.println(request.getServletContext().getRealPath("Images/"));
                out.println(nombre + "<br>");
                FileOutputStream fichero = new FileOutputStream(contexto);
                InputStream contenido = datosSubidos.getInputStream();
                byte[] bytes = new byte[2048];
                while (contenido.available() > 0) {
                    int longitud = contenido.read(bytes);
                    fichero.write(bytes, 0, longitud);
                }
                fichero.close();
                error = "";
            }
            String parametros = "?" + URLEncoder.encode("nombreFichero", "UTF-8") + "="
                    + URLEncoder.encode(nombre, "UTF-8") + "&" + URLEncoder.encode("error", "UTF-8") + "="
                    + URLEncoder.encode(error, "UTF-8");
            request.setAttribute("nombreFichero", nombre);
            request.getRequestDispatcher(response.encodeURL("cambiarFoto.jsp" + parametros)).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(out);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Subir foto al servidor";
    }// </editor-fold>

}
