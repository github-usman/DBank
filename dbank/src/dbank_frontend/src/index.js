// import { dbank_backend } from "../../declarations/dbank_backend";
import {dbank_backend} from "../../declarations/dbank_backend";

window.addEventListener("load",async function(){
  // console.log("finished");
  const currentAmount = await dbank_backend.checkBalance();
  // currentAmount = (currentAmount*100)/100;
  document.getElementById("value").innerHTML = Math.round(currentAmount*100)/100;

});


document.querySelector("form").addEventListener("submit",async function(event){
  
  // console.log("Submitted.");
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");
  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);
 
  button.setAttribute("disabled",true);

  if(document.getElementById("input-amount").value != 0){
    await dbank_backend.topUp(inputAmount);
  }
  
  if(document.getElementById("withdrawal-amount").value != 0){
    await dbank_backend.withdraw(outputAmount);
  }
  

  await dbank_backend.comound();
  const currentAmount = await dbank_backend.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount);
  document.getElementById("input-amount").value= "";
  document.getElementById("withdrawal-amount").value= "";
  button.removeAttribute("disabled");
});
