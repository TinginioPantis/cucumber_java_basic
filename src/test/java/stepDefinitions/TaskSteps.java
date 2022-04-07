package stepDefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import java.util.Map;

import static org.junit.Assert.*;

public class TaskSteps {
    private WebDriver driver;

    public TaskSteps() {
        this.driver = Hooks.driver;
    }

    @Given("^I am on enter the people with jobs page$")
    public void iAmOnThePeopleWithJobsPage() throws Throwable {
        driver.get("https://kristinek.github.io/site/tasks/list_of_people_with_jobs.html");
    }

    @When("^I click add person button$")
    public void iClickAddPersonButton() throws Throwable {
        driver.findElement(By.xpath("//*[text()='Add person']")).click();
    }

    @And("^I enter input$")
    public void iEnterInput(Map<String, String> valuesToEnter) throws Throwable {
        for (Map.Entry<String, String> e : valuesToEnter.entrySet()) {
            driver.findElement(By.id(e.getKey())).clear();
            driver.findElement(By.id(e.getKey())).sendKeys(e.getValue());
        }
    }

    @And("^I click add button$")
    public void iClickAddButton() throws Throwable {
        driver.findElement(By.xpath("//*[text()='Add']")).click();
    }

    @And("^I click edit button$")
    public void iClickEditButton() throws Throwable {
        driver.findElement(By.xpath("//*[text()='Edit']")).click();
    }

    @Then("^I can see name \"([^\"]*)\" added in the list$")
    public void iSeeNameAddedInList(String name) throws Throwable {
        assertEquals(name, driver.findElement(By.xpath("//*[@id='person3']/span[3]")).getText());
    }

    @Then("^I can see job \"([^\"]*)\" added in the list$")
    public void iSeeJobAddedInList(String job) throws Throwable {
        assertEquals(job, driver.findElement(By.xpath("//*[@id='person3']/span[4]")).getText());
    }

    @When("^I click on pencil icon near name$")
    public void iClickPencilIcon() throws Throwable {
        driver.findElement(By.xpath("//*[@id=\"person0\"]/span[2]/i")).click();
    }

    @Then("^I can see edited job \"([^\"]*)\" added in the list$")
    public void iSeeEditedJobAddedInList(String job) throws Throwable {
        assertEquals(job, driver.findElement(By.xpath("//*[@id='person0']/span[4]")).getText());
    }

    @Then("^I can see edited name \"([^\"]*)\" added in the list$")
    public void iSeeEditedNameAddedInList(String name) throws Throwable {
        assertEquals(name, driver.findElement(By.xpath("//*[@id='person0']/span[3]")).getText());
    }

    @When("^I click on x icon near name$")
    public void iClickXIcon() throws Throwable {
        driver.findElement(By.xpath("//*[@id=\"person0\"]/span[1]")).click();
    }

    @Then("^I can no longer see this persons name and job in the list$")
    public void iSeeNoNameAndJobAInList() throws Throwable {
        assertTrue(driver.findElements(By.xpath("//*[@id='person0']/span[3]")).isEmpty());
        assertTrue(driver.findElements(By.xpath("//*[@id='person0']/span[4]")).isEmpty());
    }

    @Then("^I click Clear all fields button$")
    public void iClickClearAllFieldsButton() throws Throwable {
        driver.findElement(By.xpath("//*[text()='Clear all fields']")).click();
    }

    @And("^I see empty input fields$")
    public void iSeeEmptyInputFields() throws Throwable {
        assertTrue(driver.findElement(By.id("name")).getAttribute("value").isEmpty());
        assertTrue(driver.findElement(By.id("job")).getAttribute("value").isEmpty());
    }

    @Then("^I click reset list$")
    public void iClickResetList() throws Throwable {
        driver.findElement(By.xpath("//*[text()='Reset List']")).click();
    }

    @Then("^I check if I see list without a new person$")
    public void iSeeOriginalList() throws Throwable {
        assertTrue(driver.findElements(By.xpath("//*[@id='person3']/span[3]")).isEmpty());
        assertTrue(driver.findElements(By.xpath("//*[@id='person3']/span[4]")).isEmpty());
    }

    @Then("^I check if I see list without edited details$")
    public void OriginalList() throws Throwable {
        assertNotEquals("Ruth", driver.findElement(By.xpath("//*[@id='person0']/span[3]")).getText());
        assertNotEquals("Assistant", driver.findElement(By.xpath("//*[@id='person0']/span[4]")).getText());
    }

    @And("^I see this person again in the list$")
    public void iSeeListWithRemovedPerson() throws Throwable {
        assertFalse(driver.findElements(By.xpath("//*[@id='person0']/span[3]")).isEmpty());
        assertFalse(driver.findElements(By.xpath("//*[@id='person0']/span[4]")).isEmpty());
    }

}

