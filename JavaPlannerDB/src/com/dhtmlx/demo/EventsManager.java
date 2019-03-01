package com.dhtmlx.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;
 
public class EventsManager extends DHXEventsManager {
	 
    public EventsManager(HttpServletRequest request) {
                   super(request);
    }

    public Iterable getEvents() {
    	DHXEventsManager.date_format = "yyyy-MM-dd hh:mm:ss";
    	List<DHXEvent> evs = new ArrayList<DHXEvent>();
    	
    	try {
    		
    		Connection conn = DatabaseConnection.getConnection();
            Statement statement = conn.createStatement();

            String query = "SELECT event_id, event_name, start_date, end_date FROM events";
            ResultSet resultset = statement.executeQuery(query);

            while (resultset.next()) {
               DHXEvent e = new DHXEvent();
               e.setId(Integer.parseInt(resultset.getString("event_id")));
               e.setText(resultset.getString("event_name"));
               e.setStart_date(resultset.getTimestamp("start_date"));
               e.setEnd_date(resultset.getTimestamp("end_date"));
               evs.add(e);
            }
            conn.close();
    	}
    	catch (SQLException e1) {
    		e1.printStackTrace();
    	}
    	DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";
    	return evs;
    }

    @Override
    public DHXStatus saveEvent(DHXEv event, DHXStatus status) {
    	
    	Connection conn = DatabaseConnection.getConnection();
    	PreparedStatement ps = null;
    	ResultSet result = null;
    	
    	try {
    		String query = null;
    		String start_date = new SimpleDateFormat("dd-MMM-yy hh:mm:ss a").format(event.getStart_date());
    		String end_date = new SimpleDateFormat("dd-MMM-yy hh:mm:ss a").format(event.getEnd_date());
    		String [] arr = new String[]{"EVENT_ID"};
    				
    		if (status == DHXStatus.UPDATE) {
    			query = "UPDATE events SET event_name=?, start_date=?, end_date=? WHERE event_id=?";
    			
    			ps = conn.prepareStatement(query, arr);
    			ps.setString(1, event.getText());
    			ps.setString(2, start_date);
    			ps.setString(3, end_date);
    			ps.setInt(4, event.getId());
    		}
    		else if (status == DHXStatus.INSERT) {
    			query = "INSERT INTO events (event_name, start_date, end_date) VALUES (?, ?, ?)";
    			ps = conn.prepareStatement(query, arr);
    			ps.setString(1, event.getText());
    			ps.setString(2, start_date);
    			ps.setString(3, end_date);
    		}
    		else if (status == DHXStatus.DELETE) {
    			query = "DELETE FROM events WHERE event_id=?";
    			ps = conn.prepareStatement(query, arr);
    			ps.setInt(1, event.getId());
    		}
    		
    		if (ps != null) {
    			
    			if(ps.executeUpdate() > 0) {
    				
    				if(status == DHXStatus.INSERT) {
    					try {
    						result = ps.getGeneratedKeys();
    					}
    					catch(SQLFeatureNotSupportedException e) {
    						System.out.println("SQLFeatureNotSupportedException in EventManager.java");
    						e.printStackTrace();
    					}
    					catch(SQLException e) {
    						System.out.println("SQLException in EventManager.java");
    						e.printStackTrace();
    					}
    					
    					if ((result != null) && (result.next())) {
    						event.setId(result.getInt(1));
    					}
    				}
    			}
    			else {
    				System.out.println("ps.executeUpdate() resulted in exception in EventsManager.java");
    			}
    		}
    	}
    	catch (SQLException e) {
    		e.printStackTrace();
    	}
    	finally {
            if (result != null) try { result.close(); } catch (SQLException e) {}
            if (ps != null) try { ps.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    	return status;
    }

    @Override
    public DHXEv createEvent(String id, DHXStatus status) {
                   return new DHXEvent();
    }
}