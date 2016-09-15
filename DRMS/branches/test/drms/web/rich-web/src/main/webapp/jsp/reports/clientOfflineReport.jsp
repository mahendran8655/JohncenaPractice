<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>

<html>

<f:view>
    <head>
		<title>Client Offline Daily Report</title>
		<jsp:include page="../head.jsp" />

    </head>

    <body>
	<h:form>
	<jsp:include page="../header_reports.jsp" />
		
			<a4j:keepAlive beanName="clientOfflineReport" />
			<rich:dataTable style="min-width: 500px;width:expression(document.body.clientWidth < 500 ? '500px' : '100%' );">
				<f:facet name="header4">
					<f:facet name="header">
						<rich:columnGroup>
							<rich:column style="text-align:left;font-size: 15px;">
								<h:outputText value="Client Offline Daily Report" />
							</rich:column>
						</rich:columnGroup>		
					</f:facet>
				</f:facet>
			</rich:dataTable>
			<rich:dataTable value="#{clientOfflineReport.summary}" var="item" style="min-width: 500px;width:expression(document.body.clientWidth < 500 ? '500px' : '100%' );">	 		
				<rich:column >
					<f:facet name="header"><h:outputText value="Date of Report" escape="false" /></f:facet>
					<h:outputText value="#{item.generateTime}" >
						<f:convertDateTime pattern="#{applicationScope.dateFormat}"/>
					</h:outputText>	
				</rich:column>
				<rich:column >
					<f:facet name="header"><h:outputText value="Action" escape="false" /></f:facet>
					<h:outputLink target="_self" value="jsp/reports/clientOfflineReportDetail.jsf">
							<f:verbatim>View Report Link</f:verbatim>
							<f:param name="reportID" value="#{item.UUID}" />
					</h:outputLink>	
				</rich:column>
			</rich:dataTable>
			
			<h:panelGrid columns="4" styleClass="event-panel-grid" style="display:none">
				<h:panelGroup>
					<p align="left">Search Date:</p>
				</h:panelGroup>
				<h:panelGroup>
					<rich:calendar value="#{clientOfflineReport.searchDate}" 
						   cellHeight="22px" style="width:180px" 
						   datePattern="#{applicationScope.dateFormat}"/>
				</h:panelGroup>
				<h:panelGroup>
					<p align="left">Search Time:</p>
				</h:panelGroup>
				<h:panelGroup>
					<h:selectOneMenu value="#{clientOfflineReport.searchHour}">
						<f:selectItems value="#{clientOfflineReport.hourList}"/>
					</h:selectOneMenu>
					:
					<h:selectOneMenu value="#{clientOfflineReport.searchMin}">
						<f:selectItems value="#{clientOfflineReport.minList}"/>
					</h:selectOneMenu>
				</h:panelGroup>
				<h:commandButton value="Generate" title="Generate" action="#{clientOfflineReport.generateReportAction}" />
				<h:commandButton value="Notification" title="Notification" action="#{clientOfflineReport.generateNotificationAction}" />
			</h:panelGrid>
			
			
		</h:form>
		<!--------------------------------------------------- Client Information Table End  --------------------------------------------------->
			<jsp:include page="../footer.jsp" />
    </body>
</f:view>
</html>