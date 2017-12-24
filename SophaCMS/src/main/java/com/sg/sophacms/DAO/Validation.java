/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package com.sg.sophacms.DAO;
//
//import java.util.ArrayList;
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//
///**
// *
// * @author ritheenhep
// */
//public class Validation {
//    
//    private ArrayList pullLinks(String text) {
//ArrayList links = new ArrayList();
// 
//String regex = "\\(?\\b(http://|www[.])[-A-Za-z0-9+&amp;@#/%?=~_()|!:,.;]*[-A-Za-z0-9+&amp;@#/%=~_()|]";
//Pattern p = Pattern.compile(regex);
//Matcher m = p.matcher(text);
//while(m.find()) {
//String urlStr = m.group();
//if (urlStr.startsWith("(") &amp;&amp; urlStr.endsWith(")"))
//{
//urlStr = urlStr.substring(1, urlStr.length() - 1);
//}
//links.add(urlStr);
//}
//return links;
//}
//    
//}
