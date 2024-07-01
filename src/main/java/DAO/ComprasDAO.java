package DAO;

import Modelos.Compra;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ComprasDAO extends Conexion {

    public boolean Insertar(Compra v) {
        Connection con = getConnection();
        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement("INSERT INTO Compras(transaccion, fecha, hora, monto, proveedor_id, marca_id, metodo_pago, producto_id, cantidad) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, v.getTransaccion());
            ps.setString(2, v.getFecha());
            ps.setString(3, v.getHora());
            ps.setDouble(4, v.getMonto());
            ps.setInt(5, v.getProveedor());
            ps.setInt(6, v.getMarca());
            ps.setString(7, v.getMetodo());
            ps.setInt(8, v.getProducto());
            ps.setInt(9, v.getCantidad());

            System.out.println(ps.toString());
            ps.execute();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, "Error: ", e);
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public boolean ActualizarCantidad(int productoId, int nuevaCantidad) {
        PreparedStatement ps = null;
        Connection con = getConnection();
        try {
            ps = con.prepareStatement("UPDATE Productos SET cantidad = ? WHERE id = ?");
            ps.setInt(1, nuevaCantidad);
            ps.setInt(2, productoId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(ProductosDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductosDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public boolean Eliminar(int id) {
        PreparedStatement ps = null;
        Connection con = getConnection();
        try {
            ps = con.prepareStatement("DELETE FROM Compras WHERE id=?");
            ps.setInt(1, id);
            ps.execute();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, "Error: ", e);
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Compra> Listar() {
        ArrayList<Compra> comprasList = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConnection();
        try {
            ps = con.prepareStatement("SELECT * FROM Compras");
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra v = new Compra();
                v.setId(rs.getInt("id"));
                v.setTransaccion(rs.getString("transaccion"));
                v.setFecha(rs.getString("fecha"));
                v.setHora(rs.getString("hora"));
                v.setMonto(rs.getDouble("monto"));
                v.setProveedor(rs.getInt("proveedor_id"));
                v.setMarca(rs.getInt("marca_id"));
                v.setMetodo(rs.getString("metodo_pago"));
                v.setProducto(rs.getInt("producto_id"));
                v.setCantidad(rs.getInt("cantidad"));
                comprasList.add(v);
            }
            return comprasList;
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, "Error: ", e);
            return comprasList;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public Compra ObtenerCompra(int id) {
        Compra v = new Compra();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConnection();
        try {
            ps = con.prepareStatement("SELECT * FROM Compras WHERE id=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                v.setId(rs.getInt("id"));
                v.setTransaccion(rs.getString("transaccion"));
                v.setFecha(rs.getString("fecha"));
                v.setHora(rs.getString("hora"));
                v.setMonto(rs.getDouble("monto"));
                v.setProveedor(rs.getInt("proveedor_id"));
                v.setMarca(rs.getInt("marca_id"));
                v.setMetodo(rs.getString("metodo_pago"));
                v.setProducto(rs.getInt("producto_id"));
                v.setCantidad(rs.getInt("cantidad"));
            }
            return v;
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, "Error: ", e);
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public int ObtenerIDgenerado() {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConnection();
        try {
            ps = con.prepareStatement("SELECT MAX(id) AS IDgenerado FROM Compras");
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("IDgenerado");
            }
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, "Error: ", e);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public int Cantidad() {
        int cantidad = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConnection();
        try {
            ps = con.prepareStatement("SELECT count(*) AS cantidad FROM Compras");
            rs = ps.executeQuery();
            if (rs.next()) {
                cantidad = rs.getInt("cantidad");
            }
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, "Error: ", e);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return cantidad;
    }

    public double GananciaTotal() {
        double monto = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConnection();
        try {
            ps = con.prepareStatement("SELECT sum(monto) AS monto FROM Compras");
            rs = ps.executeQuery();
            if (rs.next()) {
                monto = rs.getDouble("monto");
            }
            return monto;
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, "Error: ", e);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return monto;
    }
}
