package shoppingmall12pm; 

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import static shoppingmall12pm.detailPage.mypassword;
import static shoppingmall12pm.detailPage.myurl;
import static shoppingmall12pm.detailPage.myuser;

public class ShoppingMall12PM 
{ 
    public static void main(String[] args) 
    { 
        
        try 
        {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } 
        catch (Exception ex) 
        {
        }  
        
        try
        {  
            Connection conn = DriverManager.getConnection(myurl , myuser, mypassword);  
            String qry = "select * from usertable";
            PreparedStatement pst = conn.prepareStatement(qry);  
            ResultSet rst = pst.executeQuery();
            if(rst.next())
            { 
                LoginPage obj = new LoginPage();
                obj.setVisible(true);
            }
            else
            {
                CreateAdmin obj = new CreateAdmin();
                obj.setVisible(true);
            }
        }
        catch(Exception e)
        { 
        }     
        
    }
    
}
