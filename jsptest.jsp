<%-- 
    Document   : jsptest
    Created on : Jun 15, 2017, 11:07:10 AM
    Author     : g.s.perera
--%>

<html>
<head>

<script type="text/javascript">
function foo() {
    theApplet = document.getElementById("app");
        // The following line clobbers the document...
    //document.write(theApplet.method());
    document.getElementById("display").value= "Hello";
    //document.getElementById("display").innerHTML = theApplet.MyClass();
}
</script>

</head>
<body>

<applet id="app" width=0 height=0 code= "MyClass.class" > </applet>
<form>
    <p><input type="button" onclick="javascript:foo()" value="ok"></p>
</form>
<div id="display"></div>

</body>
</html
