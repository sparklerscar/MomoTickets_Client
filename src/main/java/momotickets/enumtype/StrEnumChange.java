package momotickets.enumtype;

/**
 * Created by sparkler on 2018/3/8.
 */
public class StrEnumChange {
    public Enum Str2Enum(String str) {
        OrderType orderType = null;
        CheckType checkType = null;
        UserType userType = null;
        ShowType showType = null;
        if (str.equals("PAYED")) {
            orderType = OrderType.PAYED;
        } else if (str.equals("WAIT")) {
            orderType = OrderType.WAIT;
        } else if (str.equals("CANCEL")) {
            orderType = OrderType.CANCEL;
        } else if (str.equals("CLOSED")) {
            orderType = OrderType.CLOSED;
        } else if (str.equals("USED")) {
            orderType = OrderType.USED;
        } else if (str.equals("REGISTER")) {
            checkType = CheckType.REGISTER;
        } else if (str.equals("CHECKED")) {
            checkType = CheckType.CHECKED;
        } else if (str.equals("CHANGE")) {
            checkType = CheckType.CHANGE;
        } else if (str.equals("MEMBER")) {
            userType = UserType.MEMBER;
        } else if (str.equals("THERTER")) {
            userType = UserType.THERTER;
        } else if (str.equals("MANAGER")) {
            userType = UserType.MANAGER;
        } else if (str.equals("DRAMA")) {
            showType = ShowType.DRAMA;
        } else if (str.equals("MOVIE")) {
            showType = ShowType.MOVIE;
        } else if (str.equals("CONCERT")) {
            showType = ShowType.CONCERT;
        }

        if (orderType != null) {
            return orderType;
        } else if (checkType != null) {
            return checkType;
        } else if (userType != null) {
            return userType;
        } else if (showType != null) {
            return showType;
        }
        return null;
    }

    public String Enum2Str(Enum enumStr) {
        return String.valueOf(enumStr);
    }
}
