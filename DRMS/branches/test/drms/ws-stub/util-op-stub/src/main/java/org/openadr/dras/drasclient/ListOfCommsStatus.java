/*
 * www.akuacom.com - Automating Demand Response
 * 
 * org.openadr.dras.drasclient.ListOfCommsStatus.java - Copyright(c)1994 to 2010 by Akuacom . All rights reserved. 
 * Redistribution and use in source and binary forms, with or without modification, is prohibited.
 *
 */

package org.openadr.dras.drasclient;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * This is a list of DRAS Client CommsStatus.
 * 
 * 
 * <p>Java class for ListOfCommsStatus complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ListOfCommsStatus">
 * &lt;complexContent>
 * &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 * &lt;sequence>
 * &lt;element name="status" type="{http://www.openadr.org/DRAS/DRASClient}CommsStatus" maxOccurs="unbounded" minOccurs="0"/>
 * &lt;/sequence>
 * &lt;/restriction>
 * &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ListOfCommsStatus", propOrder = {
    "status"
})
public class ListOfCommsStatus
    implements Serializable
{

    /** The status. */
    protected List<CommsStatus> status;

    /**
     * Gets the value of the status property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the status property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     * getStatus().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CommsStatus }
     * 
     * @return the status
     */
    public List<CommsStatus> getStatus() {
        if (status == null) {
            status = new ArrayList<CommsStatus>();
        }
        return this.status;
    }

}
