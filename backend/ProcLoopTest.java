import static org.junit.Assert.*;
import junit.framework.JUnit4TestAdapter;
import org.junit.Test;

public class ProcLoopTest{

  // test 0 iterations of the loop
  @Test
  public void zeroProc(){
    TransactionProcessor transProc = new TransactionProcessor("MasterAccount.txt", "transactionsNone.trf");
    assertEquals(0,transProc.transactions.size());
  }

  // test only 1 iteration of the loop
  @Test
  public void oneProc(){
    TransactionProcessor transProc = new TransactionProcessor("MasterAccount.txt", "transactionsOnce.trf");
    assertEquals(1,transProc.transactions.size());
  }

  // test 2 iteration of the loop
  @Test
  public void twoProc(){
    TransactionProcessor transProc = new TransactionProcessor("MasterAccount.txt", "transactionsTwice.trf");
    assertEquals(2,transProc.transactions.size());
  }

  // test multiple iterations of the loop
  @Test
  public void MultiProc(){
    TransactionProcessor transProc = new TransactionProcessor("MasterAccount.txt", "transactions.trf");
    assertEquals(4,transProc.transactions.size());
  }

  public static junit.framework.Test suite(){
    return new JUnit4TestAdapter(ProcLoopTest.class);
  }
}
