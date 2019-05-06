
package Model;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
public class BillPayDAO {
   public boolean insert(String uname,String date,String billtype,String company,String accnumber,String amount,String name) {
       BillPay bp = new BillPay();
      
       bp.setUname(uname);
       bp.setDate(date);
       bp.setBilltype(billtype);
       bp.setCompany(company);
       bp.setAccnumber(accnumber);
       bp.setAmount(amount);
       bp.setName(name);
       Configuration cf = null;
       SessionFactory sf = null;
       Session session = null;
       try{
        cf= new Configuration();
        cf.configure();
        sf = cf.buildSessionFactory();
        session = sf.openSession();
        Transaction tr = session.beginTransaction();
        session.save(bp);
        tr.commit();
    }
        catch(Exception e){
            System.out.println(e);
            return false;
        }
        finally{
            session.close();
            sf.close();
            return true;
       }
   }
}

