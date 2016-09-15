/*
 * www.akuacom.com - Automating Demand Response
 * 
 * org.openadr.dras.utilityoperator.UtilityOperator_Service.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
 * Redistribution and use in source and binary forms, with or without modification, is prohibited.
 *
 */

package org.openadr.dras.utilityoperator;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.1.1-b03-
 * Generated source version: 2.0
 */
@WebServiceClient(name = "UtilityOperator", targetNamespace = "http://www.openadr.org/DRAS/UtilityOperator/", wsdlLocation = "file:/C:/bin/pss2-4.3/pss2.utilopws.stubs/UtilityOperator.wsdl")
public class UtilityOperator_Service
    extends Service
{

    /** The Constant UTILITYOPERATOR_WSDL_LOCATION. */
    private final static URL UTILITYOPERATOR_WSDL_LOCATION;

    static {
        URL url = null;
        try {
            url = new URL("file:/C:/bin/pss2-4.3/pss2.utilopws.stubs/UtilityOperator.wsdl");
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        UTILITYOPERATOR_WSDL_LOCATION = url;
    }

    /**
     * Instantiates a new utility operator_ service.
     * 
     * @param wsdlLocation the wsdl location
     * @param serviceName the service name
     */
    public UtilityOperator_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    /**
     * Instantiates a new utility operator_ service.
     */
    public UtilityOperator_Service() {
        super(UTILITYOPERATOR_WSDL_LOCATION, new QName("http://www.openadr.org/DRAS/UtilityOperator/", "UtilityOperator"));
    }

    /**
     * Gets the utility operator port.
     * 
     * @return the utility operator port
     * 
     * returns UtilityOperator
     */
    @WebEndpoint(name = "UtilityOperatorPort")
    public UtilityOperator getUtilityOperatorPort() {
        return (UtilityOperator)super.getPort(new QName("http://www.openadr.org/DRAS/UtilityOperator/", "UtilityOperatorPort"), UtilityOperator.class);
    }

}
