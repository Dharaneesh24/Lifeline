import { useState, useEffect } from "react";

import React, { Component } from "react";
import { Map, InfoWindow, Marker, GoogleApiWrapper } from "google-maps-react";
import { db } from "./firebase-config";
import { collection, getDocs } from "firebase/firestore";

const ref = collection(db, "bb_hospitals_markers");
const ref1 = collection(db, "donors");

export class LocationTracking extends Component {
  getDocuments() {
    return getDocs(ref);
  }
  getDocuments1() {
    return getDocs(ref1);
  }

  getDataDocs = async () => {
    const data = await this.getDocuments();
    this.state.BBLoginList = await data.docs.map((doc) => ({
      ...doc.data(),
      id: doc.id,
    }));

    await console.log(this.state.BBLoginList);
    //
    const data1 = await this.getDocuments1();
    this.state.DonorList = await data1.docs.map((doc) => ({
      ...doc.data(),
      id: doc.id,
    }));

    await console.log(this.state.DonorList);
    //
    this.setState({});
  };

  constructor(props) {
    super(props);
    this.getDataDocs();
    this.state = {
      BBLoginList: [],
      DonorList: [],
      showingInfoWindow: false,
      activeMarker: {},
      selectedPlace: {},
    };
  }
  funcGetd = async () => {
    await this.getDataDocs();
  };
  componentDidMount = async () => {
    await this.getDataDocs();
    console.log(3);
    console.log(this.state.BBLoginList);
    console.log(this.state.DonorList);
  };

  displayMarkers = () => {
    console.log(1);
    console.log(this.state.BBLoginList);
    return this.state.BBLoginList.map((store, index) => {
      console.log(2);
      console.log(store.latitude, store.longitude);
      if (store.color === "orange") {
        return (
          <Marker
            key={index}
            id={index}
            name={store.title}
            onClick={this.onMarkerClick}
            icon={{
              url: "http://maps.google.com/mapfiles/ms/icons/orange-dot.png",
            }}
            position={{
              lat: store.latitude,
              lng: store.longitude,
            }}
          />
        );
      } else {
        return (
          <Marker
            key={index}
            id={index}
            onClick={this.onMarkerClick}
            name={store.title}
            position={{
              lat: store.latitude,
              lng: store.longitude,
            }}
          />
        );
      }
    });
  };

  displayMarkers1 = () => {
    console.log(1);
    console.log(this.state.DonorList);
    return this.state.DonorList.map((store, index) => {
      console.log(2);
      return (
        <Marker
          key={index}
          id={index}
          onClick={this.onMarkerClick}
          name={store.name}
          icon={{
            url: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
          }}
          position={{
            lat: store.latitude,
            lng: store.longitude,
          }}
        />
      );
    });
  };

  onMarkerClick = (props, marker, e) =>
    this.setState({
      selectedPlace: props,
      activeMarker: marker,
      showingInfoWindow: true,
    });

  onMapClicked = (props) => {
    if (this.state.showingInfoWindow) {
      this.setState({
        showingInfoWindow: false,
        activeMarker: null,
      });
    }
  };

  render() {
    console.log(this.BBLoginList);
    console.log(this.DonorList);
    return (
      <div>
        {
          <Map
            google={this.props.google}
            onClick={this.onMapClicked}
            initialCenter={{
              lat: 11.0186253,
              lng: 77.004836,
            }}
            zoom={14}
          >
            <Marker
              onClick={this.onMarkerClick}
              title={"PSG Hospitals"}
              name={"PSG"}
              icon={{
                url: "http://maps.google.com/mapfiles/ms/icons/orange-dot.png",
              }}
              position={{ lat: 11.0186253, lng: 77.004836 }}
            />

            {this.displayMarkers()}
            {this.displayMarkers1()}
            <InfoWindow
              marker={this.state.activeMarker}
              visible={this.state.showingInfoWindow}
            >
              <div>
                <h1>{this.state.selectedPlace.name}</h1>
              </div>
            </InfoWindow>
          </Map>
        }
      </div>
    );
  }
}

export default GoogleApiWrapper({
  apiKey: "AIzaSyDnBfIEP2ZRyNKQY8M0MTN8JrDLMnz8T2c",
})(LocationTracking);
