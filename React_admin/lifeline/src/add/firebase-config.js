// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import {getFirestore} from "firebase/firestore"
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCdo58WtZdzEzdbGpDPi5H36xX3Ysouk5g",
  authDomain: "blood-mgnt.firebaseapp.com",
  projectId: "blood-mgnt",
  storageBucket: "blood-mgnt.appspot.com",
  messagingSenderId: "944283467118",
  appId: "1:944283467118:web:db4ffbc5fa1672771e957f",
  measurementId: "G-93E6SSWJRK"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

export const db= getFirestore(app);