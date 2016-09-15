<ui:composition xmlns="http://www.w3.org/1999/xhtml"
      xmlns:ui="http://java.sun.com/jsf/facelets"
      xmlns:h="http://java.sun.com/jsf/html"
      xmlns:f="http://java.sun.com/jsf/core"
      xmlns:a4j="http://richfaces.org/a4j"
      xmlns:rich="http://richfaces.org/rich">
    <h:form>
        <rich:dataTable value="#{capitalsBean.capitals}" var="cap" rows="20" reRender="ds" id="simpletable">
            <f:facet name="header">
                <rich:columnGroup>
                    <rich:column colspan="2" >
                        <h:outputText value="Filtering Example"/>
                    </rich:column>
                    <rich:column breakBefore="true">
                        <h:outputText value="State Name"/>
                    </rich:column>
                    <rich:column>
                        <h:outputText value="State Capital"/>
                    </rich:column>
                </rich:columnGroup>
            </f:facet>
            <rich:column filterBy="#{cap.state}" filterEvent="onkeyup" filterValue="#{capitalsBean.currentStateFilterValue}">
                <h:outputText value="#{cap.state}"/>
            </rich:column>
            <rich:column filterBy="#{cap.name}" filterEvent="onkeyup" filterValue="#{capitalsBean.currentNameFilterValue}">
                <h:outputText value="#{cap.name}"/>
            </rich:column>
            <f:facet name="footer">
                <rich:datascroller id="ds" renderIfSinglePage="false"></rich:datascroller>
            </f:facet>
        </rich:dataTable>
        <a4j:commandButton action="#{capitalsBean.resetFilter}" value="Reset Current Filtering" reRender="simpletable" ajaxSingle="true" limitToList="true"/>
    </h:form>
</ui:composition>