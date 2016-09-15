
/**
 * NdfdXMLCallbackHandler.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.5.4  Built on : Dec 19, 2010 (08:18:42 CET)
 */

    package gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl;

    /**
     *  NdfdXMLCallbackHandler Callback class, Users can extend this class and implement
     *  their own receiveResult and receiveError methods.
     */
    public abstract class NdfdXMLCallbackHandler{



    protected Object clientData;

    /**
    * User can pass in any object that needs to be accessed once the NonBlocking
    * Web service call is finished and appropriate method of this CallBack is called.
    * @param clientData Object mechanism by which the user can pass in user data
    * that will be avilable at the time this callback is called.
    */
    public NdfdXMLCallbackHandler(Object clientData){
        this.clientData = clientData;
    }

    /**
    * Please use this constructor if you don't want to set any clientData
    */
    public NdfdXMLCallbackHandler(){
        this.clientData = null;
    }

    /**
     * Get the client data
     */

     public Object getClientData() {
        return clientData;
     }

        
           /**
            * auto generated Axis2 call back method for latLonListLine method
            * override this method for handling normal response from latLonListLine operation
            */
           public void receiveResultlatLonListLine(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.LatLonListLineResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from latLonListLine operation
           */
            public void receiveErrorlatLonListLine(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for nDFDgen method
            * override this method for handling normal response from nDFDgen operation
            */
           public void receiveResultnDFDgen(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.NDFDgenResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from nDFDgen operation
           */
            public void receiveErrornDFDgen(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for latLonListSubgrid method
            * override this method for handling normal response from latLonListSubgrid operation
            */
           public void receiveResultlatLonListSubgrid(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.LatLonListSubgridResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from latLonListSubgrid operation
           */
            public void receiveErrorlatLonListSubgrid(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for nDFDgenLatLonList method
            * override this method for handling normal response from nDFDgenLatLonList operation
            */
           public void receiveResultnDFDgenLatLonList(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.NDFDgenLatLonListResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from nDFDgenLatLonList operation
           */
            public void receiveErrornDFDgenLatLonList(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for nDFDgenByDayLatLonList method
            * override this method for handling normal response from nDFDgenByDayLatLonList operation
            */
           public void receiveResultnDFDgenByDayLatLonList(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.NDFDgenByDayLatLonListResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from nDFDgenByDayLatLonList operation
           */
            public void receiveErrornDFDgenByDayLatLonList(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for latLonListSquare method
            * override this method for handling normal response from latLonListSquare operation
            */
           public void receiveResultlatLonListSquare(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.LatLonListSquareResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from latLonListSquare operation
           */
            public void receiveErrorlatLonListSquare(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for gmlLatLonList method
            * override this method for handling normal response from gmlLatLonList operation
            */
           public void receiveResultgmlLatLonList(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.GmlLatLonListResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from gmlLatLonList operation
           */
            public void receiveErrorgmlLatLonList(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for nDFDgenByDay method
            * override this method for handling normal response from nDFDgenByDay operation
            */
           public void receiveResultnDFDgenByDay(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.NDFDgenByDayResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from nDFDgenByDay operation
           */
            public void receiveErrornDFDgenByDay(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for gmlTimeSeries method
            * override this method for handling normal response from gmlTimeSeries operation
            */
           public void receiveResultgmlTimeSeries(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.GmlTimeSeriesResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from gmlTimeSeries operation
           */
            public void receiveErrorgmlTimeSeries(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for latLonListZipCode method
            * override this method for handling normal response from latLonListZipCode operation
            */
           public void receiveResultlatLonListZipCode(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.LatLonListZipCodeResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from latLonListZipCode operation
           */
            public void receiveErrorlatLonListZipCode(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for latLonListCityNames method
            * override this method for handling normal response from latLonListCityNames operation
            */
           public void receiveResultlatLonListCityNames(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.LatLonListCityNamesResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from latLonListCityNames operation
           */
            public void receiveErrorlatLonListCityNames(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for cornerPoints method
            * override this method for handling normal response from cornerPoints operation
            */
           public void receiveResultcornerPoints(
                    gov.weather.graphical.xml.dwmlgen.wsdl.ndfdxml_wsdl.CornerPointsResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from cornerPoints operation
           */
            public void receiveErrorcornerPoints(java.lang.Exception e) {
            }
                


    }
    