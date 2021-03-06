<%@ page import="org.w3c.dom.*,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder"%>
<%  
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    DocumentBuilder db = dbf.newDocumentBuilder();
    Document doc = db.parse("http://localhost:8080/assignment/publicationInfo.xml");

    NodeList articles = doc.getElementsByTagName("ar:article");
    NodeList books = doc.getElementsByTagName("bk:book");
%>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
    <div id="white_panel">
    <h1>Article</h1>
    <ul>
        <%for(int i = 0; i < articles.getLength(); i++){%>
        <li>
            <%
            Node article = articles.item(i);
            Element e = (Element) article;
            String title = e.getElementsByTagName("ar:title").item(0).getTextContent();
            String date = e.getElementsByTagName("ar:date").item(0).getTextContent();
            String firstName = e.getElementsByTagName("ar:firstName").item(0).getTextContent();
            String lastName = e.getElementsByTagName("ar:lastName").item(0).getTextContent();
            String volume = e.getElementsByTagName("ar:volume").item(0).getTextContent();
            String summary = e.getElementsByTagName("ar:summary").item(0).getTextContent();
            %>
            <b><%out.println("Title: "+title);%></b><br>
            <%out.println("Date: "+date);%><br>
            <%out.println("Author: "+ firstName+" "+lastName);%><br>
            <%out.println("Volume: "+volume);%><br>
            <%out.println("Summary: "+summary);%><br><br>
        </li>
        <%}%>
    </ul>
    <h1>Book</h1>
    <ul>
        <%for(int i = 0; i < books.getLength(); i++){%>
        <li>
            <%
            Node book = books.item(i);
            Element e = (Element) book;
            String title = e.getElementsByTagName("bk:title").item(0).getTextContent();
            String date = e.getElementsByTagName("bk:date").item(0).getTextContent();
            String firstName = e.getElementsByTagName("bk:firstName").item(0).getTextContent();
            String lastName = e.getElementsByTagName("bk:lastName").item(0).getTextContent();
            String edition = e.getElementsByTagName("bk:edition").item(0).getTextContent();
            String summary = e.getElementsByTagName("bk:summary").item(0).getTextContent();
            %>
            <b><%out.println("Title: "+title);%></b><br>
            <%out.println("Date: "+date);%><br>
            <%out.println("Author: "+ firstName+" "+lastName);%><br>
            <%out.println("Edition: "+edition);%><br>
            <%out.println("Summary: "+summary);%><br><br>
        </li>
        <%}%>
    </ul>
    </div>
    </body>
</html>