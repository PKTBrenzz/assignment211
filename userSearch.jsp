<%@ page import="org.w3c.dom.*,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder"%>
<%!public boolean isFound(String filter, String type, Element e){
    if(type.equals("title")){
        String title;
        if(e.getNodeName().equals("ar:article")){
            title = e.getElementsByTagName("ar:title").item(0).getTextContent();
        }
        else{
            title = e.getElementsByTagName("bk:title").item(0).getTextContent();
        }
        return title.contains(filter);
    }
    else if(type.equals("author")){
        String author;
        if(e.getNodeName().equals("ar:article")){
            author = e.getElementsByTagName("ar:firstName").item(0).getTextContent() + " " + e.getElementsByTagName("ar:lastName").item(0).getTextContent() ;
        }
        else{
            author = e.getElementsByTagName("bk:firstName").item(0).getTextContent()  + " " + e.getElementsByTagName("bk:lastName").item(0).getTextContent() ;
        }
        return author.contains(filter);
    }
    return false;
}%>

<%  
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    DocumentBuilder db = dbf.newDocumentBuilder();
    Document doc = db.parse("http://localhost:8080/assignment/publicationInfo.xml");

    NodeList articles = doc.getElementsByTagName("ar:article");
    NodeList books = doc.getElementsByTagName("bk:book");
    String filter = request.getParameter("filter");
    String filter_type = request.getParameter("selectedFilter");
%>
<html>
    <head>
    </head>
    <body>
    <p><%out.println(filter_type);%></p>
    <h3>Article</h3>
    <ul>
        <%for(int i = 0; i < articles.getLength(); i++){%>
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
            <%if(isFound(filter,filter_type,e)){%>
                <li>                
                    <b><%out.println("Title: "+title);%></b><br>
                    <%out.println("Date: "+date);%><br>
                    <%out.println("Author: "+ firstName+" "+lastName);%><br>
                    <%out.println("Volume: "+volume);%><br>
                    <%out.println("Summary: "+summary);%><br><br>
                </li>
            <%}%>
        <%}%>
    </ul>
    <h3>Book</h3>
    <ul>
        <%for(int i = 0; i < books.getLength(); i++){%>
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
            <%if(isFound(filter,filter_type,e)){%>
                <li>
                    <b><%out.println("Title: "+title);%></b><br>
                    <%out.println("Date: "+date);%><br>
                    <%out.println("Author: "+ firstName+" "+lastName);%><br>
                    <%out.println("Edition: "+edition);%><br>
                    <%out.println("Summary: "+summary);%><br><br>
                </li>
            <%}%>
        <%}%>
    </ul>
    </body>
</html>