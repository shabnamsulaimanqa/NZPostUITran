package nz.co.nzpost.automation.page;

import com.codeborne.selenide.Condition;
import nz.co.nzpost.automation.annotations.Page;
import nz.co.nzpost.automation.domain.Address;
import nz.co.nzpost.automation.domain.MapHolder;
import nz.co.nzpost.automation.domain.RedeliveryDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.$$;

@Page
public class ParcelForYouDateTimePage {

  private final String host;

  @Autowired
  public ParcelForYouDateTimePage(@Value("${host}") String host) {
    this.host = host;
  }

  public void selectFromDateCard() {
    $(".redelivery-date-selection-cell-0").click();
  }

  public void selectFromTimeCard() {
    $(".redelivery-time-selection-cell-daytime").click();
  }

  public String getDateText() {
   return  $(".redelivery-date-selection-cell-0").getText().replaceAll("\n"," ");
  }

  public String getTimeText() {
    return  $(".redelivery-time-selection-cell-daytime").getText().replaceAll("\n", " ").replace("FREE", "").trim();
  }

  public void clickNext() {
    $(".redelivery-date-selection-submit.next-button").click();
  }

  public String getAuthorisedLeaveHeading() {
    return $(".autotest-redelivery-atl-header").getText();
  }
}
