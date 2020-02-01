using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class StoryLocation : MonoBehaviour {
    public string name;
    public string knotName;

    public TextMeshProUGUI textObject;
    public Button enterButton;

    // Start is called before the first frame update
    void Start () {
        SetName ();
        enterButton.onClick.AddListener (EnterObject);
    }

    [EasyButtons.Button]
    void SetName () {
        textObject.text = name;
    }

    void EnterObject () {
        InkWriter.main.GoToKnot (knotName);
    }

    // Update is called once per frame
    void Update () {

    }
}