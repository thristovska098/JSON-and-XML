<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h1>Education centers...</h1>
        <xsl:for-each select="education_centers/education_center">
        <h5>The name of the education center is:                  <xsl:value-of select="name_of_center"/></h5>

        <h5>List of academies: </h5>


        <ol>
                     <xsl:for-each select="education_programs/education_program[type_program = 'academy']">
                   <li><xsl:value-of select="name_program"/> - <xsl:value-of select="program_price"/> den. -
                    <xsl:value-of select="total_lectures"/> lectures. </li>
                    </xsl:for-each>
        </ol>
        <h5>List of courses: </h5>


        <ol>
                     <xsl:for-each select="education_programs/education_program[type_program = 'course']">
                   <li><xsl:value-of select="name_program"/> - <xsl:value-of select="program_price"/> den. -
                    <xsl:value-of select="total_lectures"/> lectures. </li>
                    </xsl:for-each>
        </ol>
        
        <h6>Sorted lectures by lecture number..</h6>
       <xsl:for-each select="schedules/schedule/lectures/lecture">
         <xsl:sort select="lecture_number"/>
         <h6>Lecture number:<xsl:value-of select="lecture_number"/>, Lecture code:<xsl:value-of select="@code_lecture"/></h6>
        </xsl:for-each>
        
        <h6>Sorted lectures by lecture code..</h6>
       <xsl:for-each select="schedules/schedule/lectures/lecture">
         <xsl:sort select="@code_lecture"/>
         <h6>Lecture number:<xsl:value-of select="lecture_number"/>, Lecture code:<xsl:value-of select="@code_lecture"/></h6>
        </xsl:for-each>
        
        <h3>Show the lecturers education..</h3>
        <table border="1">
        <tr><th>SSN</th><th>First name</th><th>Last name</th><th>Education degree</th></tr>
        <xsl:for-each select="lecturers/lecturer">
        <tr>
        <td><xsl:value-of select="@ssn_lecturer"/></td>
        <td><xsl:value-of select="first_name"/></td>
        <td><xsl:value-of select="last_name"/></td>
        <td><xsl:value-of select="education"/></td>
        </tr>
        </xsl:for-each>
        </table>
        
        <h3>Show the candidates from Bitola..</h3>
        <table border="1">
        <tr><th>SSN</th><th>City</th></tr>
        <xsl:for-each select="candidates/candidate">
        <xsl:if test="address/city='Bitola'">
        <tr><td><xsl:value-of select="@ssn_candidate"/></td>
        <td><xsl:value-of select="address/city"/></td>
        </tr>
        </xsl:if>
        </xsl:for-each>
        </table>
        
        <h3>Color the lectures that are less then two hours in red, otherwise in blue..</h3>
        <xsl:for-each select="schedules/schedule/lectures/lecture">
         <xsl:choose>
         <xsl:when test="duration_hours &lt; 2">
         <p style="background-color:red;"><xsl:value-of select="@code_lecture"/></p>
         </xsl:when>
         <xsl:otherwise> <p style="background-color:blue;"><xsl:value-of select="@code_lecture"/></p></xsl:otherwise>
         </xsl:choose>
        </xsl:for-each>
        
        
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>




