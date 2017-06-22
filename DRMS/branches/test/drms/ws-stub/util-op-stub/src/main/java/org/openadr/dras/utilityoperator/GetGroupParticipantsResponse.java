/*
 * www.akuacom.com - Automating Demand Response
 * 
 * org.openadr.dras.utilityoperator.GetGroupParticipantsResponse.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
 * Redistribution and use in source and binary forms, with or without modification, is prohibited.
 *
 */

package org.openadr.dras.utilityoperator;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for GetGroupParticipantsResponse complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="GetGroupParticipantsResponse">
 * &lt;complexContent>
 * &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 * &lt;sequence>
 * &lt;element name="GetGroupParticipantsResponse" type="{http://www.w3.org/2001/XMLSchema}string"/>
 * &lt;element name="returnValue" type="{http://www.w3.org/2001/XMLSchema}string"/>
 * &lt;/sequence>
 * &lt;/restriction>
 * &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GetGroupParticipantsResponse", propOrder = {
    "getGroupParticipantsResponse",
    "returnValue"
})
public class GetGroupParticipantsResponse
    implements Serializable
{

    /** The get group participants response. */
    @XmlElement(name = "GetGroupParticipantsResponse", required = true)
    protected String getGroupParticipantsResponse;
    
    /** The return value. */
    @XmlElement(required = true)
    protected String returnValue;

    /**
     * Gets the value of the getGroupParticipantsResponse property.
     * 
     * @return the gets the group participants response
     * 
     * possible object is
     * {@link String }
     */
    public String getGetGroupParticipantsResponse() {
        return getGroupParticipantsResponse;
    }

    /**
     * Sets the value of the getGroupParticipantsResponse property.
     * 
     * @param value allowed object is
     * {@link String }
     */
    public void setGetGroupParticipantsResponse(String value) {
        this.getGroupParticipantsResponse = value;
    }

    /**
     * Gets the value of the returnValue property.
     * 
     * @return the return value
     * 
     * possible object is
     * {@link String }
     */
    public String getReturnValue() {
        return returnValue;
    }

    /**
     * Sets the value of the returnValue property.
     * 
     * @param value allowed object is
     * {@link String }
     */
    public void setReturnValue(String value) {
        this.returnValue = value;
    }

}