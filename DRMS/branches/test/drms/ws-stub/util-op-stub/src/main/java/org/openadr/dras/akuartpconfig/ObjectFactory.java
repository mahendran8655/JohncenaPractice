/*
 * www.akuacom.com - Automating Demand Response
 * 
 * org.openadr.dras.akuartpconfig.ObjectFactory.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
 * Redistribution and use in source and binary forms, with or without modification, is prohibited.
 *
 */

package org.openadr.dras.akuartpconfig;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each
 * Java content interface and Java element interface
 * generated in the org.openadr.dras.akuartpconfig package.
 * <p>An ObjectFactory allows you to programatically
 * construct new instances of the Java representation
 * for XML content. The Java representation of XML
 * content can consist of schema derived interfaces
 * and classes representing the binding of schema
 * type definitions, element declarations and model
 * groups.  Factory methods for each of these are
 * provided in this class.
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: org.openadr.dras.akuartpconfig
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ListOfRTPConfigs }.
     * 
     * @return the list of rtp configs
     */
    public ListOfRTPConfigs createListOfRTPConfigs() {
        return new ListOfRTPConfigs();
    }

    /**
     * Create an instance of {@link AkuaRTPConfig }.
     * 
     * @return the akua rtp config
     */
    public AkuaRTPConfig createAkuaRTPConfig() {
        return new AkuaRTPConfig();
    }

}
