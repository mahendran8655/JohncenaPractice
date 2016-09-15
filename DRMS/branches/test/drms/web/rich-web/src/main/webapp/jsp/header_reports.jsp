<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ page import="java.util.Date,com.akuacom.pss2.richsite.*"%>

<h:panelGroup styleClass="#{header1.headerStyle}" layout="block" id="page_wrapper">
	<div class="header"><br>
<h1>Demand Response Automation Server</h1>

<ul id="nav">

	<li id="programs"><h:outputLink value="/pss2.website/uoProgram.do">
		<f:verbatim> Programs </f:verbatim>
	</h:outputLink></li>

	<li id="participants"><h:outputLink
		value="/pss2.website/participantsMap.do">
		<f:verbatim> Participants </f:verbatim>
	</h:outputLink></li>

	<li id="clients"><h:outputLink value="/pss2.website/clientsMap.do">
		<f:verbatim> Clients </f:verbatim>
	</h:outputLink></li>

	<li id="events"><h:outputLink value="/pss2.website/uoEvent.do">
		<f:verbatim> Events </f:verbatim>
	</h:outputLink></li>

	<a4j:region rendered="#{footer.newsEnabled}">
		<li id="news"><h:outputLink value="/pss2.website/news.do">
			<f:verbatim> News & Info </f:verbatim>
		</h:outputLink></li>
	</a4j:region>

	<li id="current"><h:outputLink value="/pss2.website/logList.do">
		<f:verbatim> Report </f:verbatim>
	</h:outputLink></li>

	<li id="options"><h:outputLink value="/pss2.website/options.do">
		<f:verbatim> Options </f:verbatim>
	</h:outputLink></li>

	<li id="about"><h:outputLink value="/pss2.website/about.do">
		<f:verbatim> About </f:verbatim>
	</h:outputLink></li>
</ul>

      <h:outputLink id="scorecardlink" target="_blank"
          rendered="#{header1.scorecardEnabled}"
          styleClass="viewScorecardLink"
          value="/pss2.utility/jsp/reports/scoreCard.jsf">
            <f:verbatim>Scorecard</f:verbatim>
			<a4j:support ajaxSingle="true" process="scorecardlink" event="onclick" reRender="scorecardlink"/>			
        </h:outputLink>       
		
<ul id="navright">
	<li>
				
					<h:commandLink action="#{header1.logoutAndCleanSession}" style="font-weight: normal;">
						<f:verbatim>Logout</f:verbatim>
					</h:commandLink>
				
			</li>
	<li><a href="#"><h:outputText
		value="Welcome #{header1.welcomeName} - (#{header1.userRole})" /> </a></li>
	
	<a4j:region rendered="#{header1.displayPrice}">
			<li>
				<h:outputText value="#{header1.austrialiaPrice}" title="#{header1.priceInformation}"/>
			</li>
	</a4j:region>
			
	<li><a href="#"><h:outputText value="#{header1.serverTime}">
		<f:convertDateTime pattern="#{applicationScope.headerDateTimeFormat}" />
	</h:outputText> </a></li>
</ul>
</div>
</h:panelGroup>
