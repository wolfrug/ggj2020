using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIResourceObject : MonoBehaviour {
    public string inkVariableName;
    public TextMeshProUGUI amounttext;
    public Animator animator;
    //public int startingValue = 0;
    public int currentValue = 0;
    // Start is called before the first frame update
    void Start () {
        //Invoke ("LateStart", 0.5f);
    }
    public void Init () {
        SetValueToInkValue ();
        if (inkVariableName != "") {
            InkWriter.main.story.ObserveVariable ((inkVariableName), (string varName, object newValue) => {
                EventListener (varName, (int) newValue);
            });
        }
    }
    public void SetValue (int value) {
        //Debug.Log ("Set value of " + gameObject.name + " to " + value);
        if (value < currentValue) {
            animator.SetTrigger ("down");
        } else {
            animator.SetTrigger ("up");
        }
        currentValue = value;
        amounttext.text = value.ToString ();
    }
    public void SetValueToInkValue () {
        int currentValue = (int) InkWriter.main.story.variablesState[(inkVariableName)];
        SetValue (currentValue);
    }
    public void EventListener (string tag, int valuechange) { // from the tag listener
        SetValue (valuechange);
    }

    // Update is called once per frame
    void Update () {

    }
}