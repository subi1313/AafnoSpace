package com.AafnoSpace.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.AafnoSpace.model.ProductModel;
import com.AafnoSpace.utils.DBconfig;

/**
 * ProductDAO handles all database operations related to Product.
 * This includes CRUD operations, filtering and stock management.
 */
public class ProductDAO {
	
	/**
     * Inserts a new product record into the database.
     *
     * This method takes product details from the application layer
     * and stores them into the "product" table.
     */
	public int insertProduct(String productName, String description, String category, double price, int quantity, String imageName) 
			throws Exception {

		Connection con = DBconfig.getConnection();

		String sql = "INSERT INTO product(ProductName, Description, Category, Price, Quantity, ImageName) VALUES (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pst = con.prepareStatement(sql);
		
		pst.setString(1, productName);
		pst.setString(2, description);
		pst.setString(3, category);
		pst.setDouble(4, price);
		pst.setInt(5, quantity);
		pst.setString(6, imageName);
		
		int rowsAffected = pst.executeUpdate();
		
		pst.close();
		con.close();
		
		return rowsAffected;
	}
	
	/**
     * Retrieves all products that are not marked as deleted.
     *
     * This method ignores soft-deleted records where 'delStatus = TRUE'
     * and returns only active products to the application.
     */
	public List<ProductModel> getAllProducts() throws Exception {

        List<ProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT * FROM product WHERE delStatus = FALSE";

        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            ProductModel p = new ProductModel();

            p.setProductId(rs.getInt("ProductID"));
            p.setProductName(rs.getString("ProductName"));
            p.setDescription(rs.getString("Description"));
            p.setCategory(rs.getString("Category"));
            p.setPrice(rs.getDouble("Price"));
            p.setQuantity(rs.getInt("Quantity"));
            p.setImageName(rs.getString("ImageName"));

            products.add(p);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }
	
	/**
     * Fetches a single product using its unique ProductID.
     *
     */
	public ProductModel getProductById(int id) throws Exception {

	    Connection con = DBconfig.getConnection();

	    String sql = "SELECT * FROM product WHERE ProductID=? AND delStatus = FALSE";

	    PreparedStatement pst = con.prepareStatement(sql);
	    pst.setInt(1, id);

	    ResultSet rs = pst.executeQuery();

	    ProductModel p = null;

	    if (rs.next()) {
	        p = new ProductModel();
	        p.setProductId(rs.getInt("ProductID"));
	        p.setProductName(rs.getString("ProductName"));
	        p.setDescription(rs.getString("Description"));
	        p.setCategory(rs.getString("Category"));
	        p.setPrice(rs.getDouble("Price"));
	        p.setQuantity(rs.getInt("Quantity"));
	        p.setImageName(rs.getString("ImageName"));
	    }

	    rs.close();
	    pst.close();
	    con.close();

	    return p;
	}
	
	/**
     * Updates an existing product's details in the database based on ProductID.
     *
     */
	public int updateProduct(int productId, String productName,
            String description, String category,
            double price, int quantity, String imageName) throws Exception {

		Connection con = DBconfig.getConnection();
		
		String sql = "UPDATE product SET ProductName=?, Description=?, Category=?, Price=?, Quantity=?, ImageName=? WHERE ProductID=?";
		
		PreparedStatement pst = con.prepareStatement(sql);
		
		pst.setString(1, productName);
		pst.setString(2, description);
		pst.setString(3, category);
		pst.setDouble(4, price);
		pst.setInt(5, quantity);
		pst.setString(6, imageName);
        pst.setInt(7, productId);
		
		int rowsAffected = pst.executeUpdate();
		
		pst.close();
		con.close();
		
		return rowsAffected;
	}

	/**
     * Filters products based on search text, selected categories,
     * and price range options.
     *
     * This method dynamically builds the SQL query depending on
     * which filters are applied by the user.
     */
	public List<ProductModel> getFilteredProducts(String search, List<String> categories, List<String> priceRanges) throws Exception {
	    List<ProductModel> products = new ArrayList<>();
	    Connection con = DBconfig.getConnection();
	
	    StringBuilder sql = new StringBuilder("SELECT * FROM product WHERE delStatus = FALSE");
	
	    // Search by name
	    if (search != null && !search.isEmpty()) {
	        sql.append(" AND ProductName LIKE ?");
	    }
	
	    // Filter by categories
	    if (categories != null && !categories.isEmpty()) {
	        sql.append(" AND Category IN (");
	        for (int i = 0; i < categories.size(); i++) {
	            sql.append("?");
	            if (i < categories.size() - 1) sql.append(",");
	        }
	        sql.append(")");
	    }
	
	    // Filter by price ranges
	    if (priceRanges != null && !priceRanges.isEmpty()) {
	        sql.append(" AND (");
	        for (int i = 0; i < priceRanges.size(); i++) {
	            String range = priceRanges.get(i);
	            switch (range) {
	                case "range1": sql.append("Price < 5000"); break;
	                case "range2": sql.append("Price BETWEEN 5000 AND 12000"); break;
	                case "range3": sql.append("Price BETWEEN 12000 AND 27000"); break;
	                case "range4": sql.append("Price BETWEEN 27000 AND 50000"); break;
	                case "range5": sql.append("Price BETWEEN 50000 AND 80000"); break;
	            }
	            if (i < priceRanges.size() - 1) sql.append(" OR ");
	        }
	        sql.append(")");
	    }
	
	    PreparedStatement pst = con.prepareStatement(sql.toString());
	
	    int index = 1;
	    if (search != null && !search.isEmpty()) {
	        pst.setString(index++, "%" + search + "%");
	    }
	    if (categories != null) {
	        for (String category : categories) {
	            pst.setString(index++, category);
	        }
	    }
	
	    ResultSet rs = pst.executeQuery();
	
	    while (rs.next()) {
	        ProductModel p = new ProductModel();
	        p.setProductId(rs.getInt("ProductID"));
	        p.setProductName(rs.getString("ProductName"));
	        p.setDescription(rs.getString("Description"));
	        p.setCategory(rs.getString("Category"));
	        p.setPrice(rs.getDouble("Price"));
	        p.setQuantity(rs.getInt("Quantity"));
	        p.setImageName(rs.getString("ImageName"));
	        products.add(p);
	    }
	
	    rs.close();
	    pst.close();
	    con.close();
	
	    return products;
	}
	
	/**
     * Performs a soft delete of a product.
     *
     * Instead of permanently removing the record, it sets delStatus = TRUE,
     * so the product is hidden from users but still exists in the database
     * as data are most essential asset in today's world!
     */
	public int deleteProduct(int productId) throws Exception {
	    Connection con = DBconfig.getConnection();
	    String sql = "UPDATE product SET delStatus = TRUE WHERE ProductID = ?";
	    PreparedStatement pst = con.prepareStatement(sql);
	    pst.setInt(1, productId);
	    int rowsAffected = pst.executeUpdate();
	    pst.close();
	    con.close();
	    return rowsAffected;
	}
	
	/**
     * Reduces product stock after a purchase is made.
     *
     * It ensures that quantity is only decreased if enough stock is available,
     * preventing negative inventory values.
     */
	public int decreaseQuantity(int productId, int purchasedQty) throws Exception {

	    Connection con = DBconfig.getConnection();

	    String sql = "UPDATE product SET Quantity = Quantity - ? " + "WHERE ProductID = ? AND Quantity >= ?";

	    PreparedStatement pst = con.prepareStatement(sql);

	    pst.setInt(1, purchasedQty);
	    pst.setInt(2, productId);
	    pst.setInt(3, purchasedQty);

	    int rowsAffected = pst.executeUpdate();

	    pst.close();
	    con.close();

	    return rowsAffected;
	}
}