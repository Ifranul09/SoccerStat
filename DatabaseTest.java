package Org.example;
import java.sql.*;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;


public class DatabaseTest {

    String url = "jdbc:mysql://localhost:3306/SoccerStat";
    String username = "root";
    String password = "Shobuj14";

    Connection con = getConnection();

    private Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Test
    void checkClubCountTest() {
        String checkClubCount = "SELECT count(*) FROM CLUB";

        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkClubCount);
            rs.next();
            int result = rs.getInt(1);
            assertEquals(result, 13);
            System.out.println("checkClubCountTest ran successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    void checkCurrentSeasonCountTest() {
        String checkCurrentSeasonCount = "SELECT count(*) FROM CURRENT_SEASON";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkCurrentSeasonCount);
            rs.next();
            int result = rs.getInt(1);
            assertEquals(result, 13);
            System.out.println("checkCurrentSeasonCountTest ran successfully.");

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    void checkManagerCountTest() {
        String checkManagerCount = "SELECT count(*) FROM MANAGER";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkManagerCount);
            rs.next();
            int result = rs.getInt(1);
            assertEquals(result, 13);
            System.out.println("checkManagerCountTest ran successfully.");

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    void checkPlayerCountTest() {
        String checkPlayerCount = "SELECT count(*) FROM PLAYER";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkPlayerCount);
            rs.next();
            int result = rs.getInt(1);
            assertEquals(result, 26);
            System.out.println("checkPlayerCountTest ran successfully.");

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    void checkPlayerSeasonalStatsCountTest() {
        String checkPlayerSeasonalStatsCount = "SELECT count(*) FROM PLAYER_SEASONAL_STATS";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkPlayerSeasonalStatsCount);
            rs.next();
            int result = rs.getInt(1);
            assertEquals(result, 26);
            System.out.println("checkPlayerSeasonalStatsCountTest ran successfully.");

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    void checkManagerPreviousClubsCountTest() {
        String checkManagerPreviousClubsCount = "SELECT count(*) FROM MANAGER_PREVIOUS_CLUBS";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkManagerPreviousClubsCount);
            rs.next();
            int result = rs.getInt(1);
            assertEquals(result, 5);
            System.out.println("checkManagerPreviousClubsCountTest ran successfully.");

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Test
    void checkPlayerPreviousClubsCountTest() {
        String checkPlayerPreviousClubsCount = "SELECT count(*) FROM PLAYER_PREVIOUS_CLUBS";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkPlayerPreviousClubsCount);
            rs.next();
            int result = rs.getInt(1);
            assertEquals(result, 14);
            System.out.println("checkPlayerPreviousClubsCountTest ran successfully.");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Test
    void checkTeamByIDTest() {
        String checkTeamByID = "SELECT Club_Name FROM CLUB WHERE Club_ID = 1";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkTeamByID);
            rs.next();
            String result = rs.getString(1);
            assertEquals(result, "Arsenal");
            System.out.println("checkTeamByIDTest ran successfully.");
        }
        catch (SQLException e) {
            e.printStackTrace();

        }
    }

    @Test
    void checkPlayerByIDTest() {
        String checkPlayerByID = "SELECT Player_Name FROM PLAYERS WHERE Player_ID = 6776";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkPlayerByID);
            rs.next();
            String result = rs.getString(1);
            assertEquals(result, "Robert Lewandowski");
            System.out.println("checkPlayerByIDTest ran successfully.");
        }
        catch (SQLException e) {
            e.printStackTrace();

        }
    }

    @Test
    void checkNumberOfGoalscorersTest() {
        String checkNumberOfGoalscorers = "SELECT count(*) FROM PLAYER_SEASONAL_STATS WHERE Goals >= 3";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkNumberOfGoalscorers);
            rs.next();
            int result = rs.getInt(1);
            assertEquals(result, 9);
            System.out.println("checkNumberOfGoalscorersTest ran successfully.");
        }
        catch (SQLException e) {
            e.printStackTrace();

        }
    }


    @Test
    void checkNumberOfCleanSheetsTest() {
        String checkNumberOfCleanSheets = "SELECT count(*) FROM PLAYER_SEASONAL_STATS WHERE Clean_Sheets > 0";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkNumberOfCleanSheets);
            rs.next();
            int result = rs.getInt(1);
            assertEquals(result, 4);
            System.out.println("checkNumberOfGoalscorersTest ran successfully.");
        }
        catch (SQLException e) {
            e.printStackTrace();

        }
    }
}
