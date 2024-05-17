
package DAO;

import Modelos.Compra;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ComprasDAO extends Conexion{
    
    public boolean Insertar(Compra v    ) {
        Connection con = getConnection();
        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement("INSERT INTO Compras(transaccion,fecha,hora,monto,proveedor_nombre,metodo_pago,producto,cantidad) VALUES(?,?,?,?,?,?,?,?)");
            ps.setString(1, v.getTransaccion());
            ps.setString(2, v.getFecha());
            ps.setString(3, v.getHora());
            ps.setDouble(4, v.getMonto());
            ps.setString(5, v.getNombreProveedor());
            ps.setString(6, v.getMetodo());            
            ps.setString(7, v.getProducto());
            ps.setInt(8, v.getCantidad());


            System.out.println(ps.toString());
            ps.execute();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, "Error: " + e);
            return false;
        } 
    }
    
      
    public boolean Eliminar(int id){
        PreparedStatement ps = null;
        Connection con = getConnection();
        try {
            ps = con.prepareStatement("DELETE FROM Compras WHERE id=?");
            ps.setInt(1, id);
            ps.execute();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, "Error: "+e);
            return false;
            
        }
    }
    
    
    public ArrayList<Compra> Listar() {
        ArrayList<Compra> comprasList = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs=null;
        Connection con = getConnection();
        try {
             ps = con.prepareStatement("SELECT * FROM compras");
             rs = ps.executeQuery();
                while (rs.next()) {
                    Compra v = new Compra();
                    v.setId(rs.getInt("id"));
                    v.setTransaccion(rs.getString("transaccion"));
                    v.setFecha(rs.getString("fecha"));
                    v.setHora(rs.getString("hora"));
                    v.setMonto(rs.getDouble("monto"));
                    v.setNombreProveedor(rs.getString("proveedor_nombre"));
                    v.setMetodo(rs.getString("metodo_pago"));
                    v.setProducto(rs.getString("producto"));
                    v.setCantidad(rs.getInt("cantidad"));
                    comprasList.add(v);
                }
             return comprasList;
             
        } catch (SQLException e) {
            
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, "Error: "+e); 
            return comprasList;
            
        } 
    }
    
    
    public Compra ObtenerCompra(int id) {
        Compra v=new Compra();
        PreparedStatement ps = null;
        ResultSet rs=null;
        Connection con = getConnection();
        try {
             ps = con.prepareStatement("SELECT * FROM Compras WHERE id=?");
             ps.setInt(1, id);
             rs = ps.executeQuery();
                while (rs.next()) {
                    v.setId(rs.getInt("id"));
                    v.setTransaccion(rs.getString("transaccion"));
                    v.setFecha(rs.getString("fecha"));
                    v.setHora(rs.getString("hora"));
                    v.setMonto(rs.getDouble("monto"));
                    v.setNombreProveedor(rs.getString("proveedor_nombre"));
                    v.setMetodo(rs.getString("metodo_pago"));
                    v.setProducto(rs.getString("producto"));
                    v.setCantidad(rs.getInt("cantidad"));
                }
             return v;
             
        } catch (SQLException e) {
            
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, "Error: "+e); 
            return null;
            
        }
    }
    
    public int ObtenerIDgenerado(){
        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection con=getConnection();
        try {
            ps=con.prepareStatement("SELECT MAX(id) AS IDgenerado FROM Compras");
            rs=ps.executeQuery();
            if (rs.next()) {
                int id=rs.getInt("IDgenerado");
                return  id;    
            }        
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, "Error: "+e); 
            return 0;
        }
        return 0;
    }
    
    
    public int Cantidad(){
        int cantidad=0;
        PreparedStatement ps=null;
        Connection con=getConnection();
        ResultSet rs=null;
        try {
            ps=con.prepareStatement("SELECT count(*) AS cantidad FROM Compras");
            rs=ps.executeQuery(); 
            if (rs.next()) {
                cantidad=Integer.parseInt(rs.getString("cantidad"));
            }
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, "Error: "+e);
            System.out.println(e);
        }
      return cantidad;
    }
    
    public double GananciaTotal(){
        double monto=0;
        PreparedStatement ps=null;
        Connection con=getConnection();
        ResultSet rs=null;
        try {
            ps=con.prepareStatement("SELECT sum(monto) AS monto FROM Compras");
            rs=ps.executeQuery(); 
            if (rs.next()) {
                monto=Double.parseDouble(rs.getString("monto"));
            }
            return monto;
        } catch (SQLException e) {
            Logger.getLogger(ComprasDAO.class.getName()).log(Level.SEVERE, null, "Error: "+e);
            System.out.println(e);
        }
        return monto;
    }
        
}
