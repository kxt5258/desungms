De-suung Management Information System (DMIS) is designed to manage the desuups and their activities in Bhutan

<h4>Requirements:</h4>
1. Grails 2.4.4

2. MySQL or PostgreSQL database for data storage

3. Tomcat application server

4. JDK7

5. Wkhtmltopdf
<h2>1. Grails 2.4.4</h2>
For the installation of grails, follow the instructions on the <a href="https://grails.org/wiki/2.4.4%20Release%20Notes">grails page</a>
<h2>2. MySQL or PostgreSQL</h2>
For MySQL, follow the installation <a href="http://downloads.mysql.com/docs/mysql-installation-excerpt-5.1-en.pdf">guide document</a>, and for PostgreSQL, follow <a href="https://wiki.postgresql.org/wiki/Detailed_installation_guides">this page</a>.
<h2>3. Tomcat Application Server</h2>
For the installation of tomcat, follow the instructions on <a href="http://wiki.apache.org/tomcat/GettingStarted">this page</a>
<h2>4. Wkhtmltopdf</h2>
Wkhtmltopdf is used for rendering the gsp pages as pdf document.
<div>
<h2 id="user-content-installation">Installation</h2>
<div>
<div>

mac

</div>
<div>
<div>
<pre>brew install wkhtmltopdf</pre>
</div>
</div>
<div>

linux

</div>
<div>
<div>
<pre>apt-get install wkhtmltopdf</pre>
</div>
</div>
<div>

Finally make sure the following command works as expected:

</div>
<div>
<div>
<pre>wkhtmltopdf www.google.de test.pdf</pre>
</div>
</div>
</div>
</div>
<div>
<h2 id="user-content-configuration"><a id="user-content-configuration" class="anchor" href="https://github.com/rlovtangen/grails-wkhtmltopdf#configuration"></a>Configuration</h2>
<div>
<div>

Put the following line into your application.groovy and adjust the path to your wkhtmltopdf binary (<code>which wkhtmltopdf</code>)

</div>
<div>

unix

</div>
<div>
<div>
<pre>grails.plugin.wkhtmltopdf.binary = "/pathTo/wkhtmltopdf"</pre>
</div>
</div>
<div>

windows

</div>
<div>
<div>
<pre>grails.plugin.wkhtmltopdf.binary="C:/pathTo/wkhtmltopdf.exe"</pre>
</div>
</div>
<div>
<h2>4. Database settings</h2>
Change the contents of conf/DataSource.groovy to reflect the database

</div>
</div>
</div>
,
<h2 id="user-content-wkhtmltopdf"></h2>

heapsize: in /etc/default/tomcat7    jdk1.7.0_79
