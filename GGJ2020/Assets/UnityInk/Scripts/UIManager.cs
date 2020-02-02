using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour {
    public static UIManager instance;
    public InkCharacterObject[] characters;
    public Transform portraitParent;
    [SerializeField]
    private UIResourceObject[] allResourceObjects;
    private Dictionary<string, ProgressBar> progressBars = new Dictionary<string, ProgressBar> { };
    private Dictionary<string, InkCharacterObject> charactersDict = new Dictionary<string, InkCharacterObject> { };
    private Dictionary<InkCharacterObject, GameObject> spawnedPortraits = new Dictionary<InkCharacterObject, GameObject> { };
    void Awake () {
        if (instance == null) {
            instance = this;
        } else {
            Destroy (this);
        }
    }

    // Start is called before the first frame update
    void Start () {
        foreach (InkCharacterObject ico in characters) {
            charactersDict.Add (ico.characterName, ico);
        }
        allResourceObjects = FindObjectsOfType<UIResourceObject> ();
    }
    public void Init () {
        foreach (UIResourceObject obj in allResourceObjects) {
            obj.Init ();
        }
    }

    public void AddProgressBar (ProgressBar bar) {
        if (!progressBars.ContainsValue (bar)) {
            progressBars.Add (bar.barName, bar);
            bar.SetValueToInkValue ();
        }
    }

    public void UpdateProgressBar (string tag, int value) {
        ProgressBar outBar;
        progressBars.TryGetValue (tag, out outBar);
        if (outBar != null) {
            outBar.SetValue (value);
        }
    }

    public void ChangePortrait (object[] inputVariables) {
        // assume there is only one object in the list
        Debug.Log (inputVariables[0]);
        string character = inputVariables[0].ToString ();
        InkCharacterObject outVar;
        charactersDict.TryGetValue (character, out outVar);
        Debug.Log (outVar?.characterName);
        // Is the portrait already spawned?
        GameObject tryGetObject = null;
        spawnedPortraits.TryGetValue (outVar, out tryGetObject);
        // If spawned, make it visible and make all others invisible
        if (tryGetObject != null) {
            DeactivatePortraits ();
            tryGetObject.SetActive (true);

        } else { // otherwise, spawn it - and make everything else invisible.
            DeactivatePortraits ();
            GameObject newPortrait = Instantiate (outVar.portraitPrefab, portraitParent);
            spawnedPortraits.Add (outVar, newPortrait);
        }

    }

    void DeactivatePortraits () {
        foreach (KeyValuePair<InkCharacterObject, GameObject> entry in spawnedPortraits) {
            entry.Value.SetActive (false);
        }
    }

    public void PauseGame (bool pause) {
        GameManager.instance.PauseGame (pause);
    }

    public void SaveGame () {
        GameManager.instance.SaveGame ();
    }
    public void LoadGame () {
        GameManager.instance.LoadGame ();
    }

    public void Restart () {
        GameManager.instance.Restart ();
    }

    [EasyButtons.Button]
    public void ResetGame () {
        GameManager.instance.ResetGame ();
    }

    public void QuitGame () {
        GameManager.instance.QuitGame ();
    }

    // Update is called once per frame
    void Update () {

    }
}