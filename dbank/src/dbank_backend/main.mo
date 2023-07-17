    import Debug "mo:base/Debug";
    // import Nat "mo:base/Nat";
    import Time "mo:base/Time";
    import Float "mo:base/Float";
import Nat "mo:base/Nat";
    
    

    actor Bank{

   stable var currentValue:Float = 300;
    // currentValue := 300;
    Debug.print(debug_show(currentValue));

    stable var startTime = Time.now();
    // startTime := Time.now();
    Debug.print(debug_show(startTime));
    // var myId = "be2us-64aaa-aaaaa-qaabq-cai";

    let id = 324324243242334234;
    // Debug.print(debug_show(id));
    // Debug.print(debug_show(id));

    public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
    };

    public func withdraw(amount: Float){
      let tempValue: Float = currentValue-amount;
      if(tempValue >= 0){
        currentValue -= amount;
        Debug.print(debug_show(currentValue));
      }else{
        // currentValue -= amount;
        Debug.print(debug_show("Amount too large, currentValue less than zero"));
      }
      
    };

    public query func checkBalance(): async Float {
      return currentValue;
    };
    // topUp();
    public func comound(){
      let currentTime = Time.now();
      let timeElapsedNs = currentTime-startTime;
      let timeElapsedS = timeElapsedNs/1000000000;
      // let Value: Nat = 1.01;
      currentValue := currentValue*(1.01 **Float.fromInt(timeElapsedS));
      startTime := currentTime;
    };
"http://localhost:8000/?canisterId=$be2us-64aaa-aaaaa-qaabq-cai";
    }