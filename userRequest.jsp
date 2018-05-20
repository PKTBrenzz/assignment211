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
    </head>
    <body>
    <%   
        for(int i = 0; i < books.getLength(); i++){%>
            <p><%
            Node book = books.item(i);
            Element e = (Element) book;
            out.println(e.getElementsByTagName("bk:title").item(0).getTextContent());
            %> </p>
     <% } 
    %>
    
    </body>
</html>