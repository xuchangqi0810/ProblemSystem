package com.xcq.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTest {//计算两个时间相差的天数
    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            //int i = (int) ((sdf.parse("2019-06-14").getTime() - sdf.parse("2019-06-14").getTime()) / 1000 / 60 / 60 / 24);

            System.out.println(sdf.parse("2019-06-21"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
