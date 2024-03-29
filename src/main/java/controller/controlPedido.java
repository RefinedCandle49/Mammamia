/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.PedidoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Pedido;

/**
 *
 * @author daiko
 */
@WebServlet("/ControlPedido") // url del servlet
public class controlPedido extends HttpServlet {

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
        
        String idPedidoParam = request.getParameter("idPedido");

        if (idPedidoParam != null && !idPedidoParam.isEmpty()) {
            try {
                int idPedido = Integer.parseInt(idPedidoParam);
                Pedido pedido = PedidoDao.obtenerPedidoPorId(idPedido);

                if (pedido != null) {

                    if (pedido.getEstado() == 0 || pedido.getEstado() == 1) {
                        request.setAttribute("filtroPedido", pedido);
                    } else {
                        request.setAttribute("errorFiltroPed", "El pedido ha sido entregado.");
                        request.getRequestDispatcher("/admin/pedidos.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("errorFiltroPed", "El pedido no ha sido encontrado.");
                    request.getRequestDispatcher("/admin/pedidos.jsp").forward(request, response);
                }

            } catch (NumberFormatException e) {
                request.setAttribute("errorFiltroPed", "El id del pedido no es válido.");
                request.getRequestDispatcher("/admin/pedidos.jsp").forward(request, response);
            }
        }
        request.getRequestDispatcher("/admin/pedidos.jsp").forward(request, response);
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

        int idPedido = Integer.parseInt(request.getParameter("idPedido"));
        int nuevoEstado = Integer.parseInt(request.getParameter("newEstado"));

        Pedido pedido = new Pedido();
        pedido.setIdPedido(idPedido);
        pedido.setEstado(nuevoEstado);

        int result = PedidoDao.actualizarEstado(pedido);

        response.sendRedirect(request.getContextPath() + "/admin/pedidos.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
