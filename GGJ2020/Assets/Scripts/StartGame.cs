using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class StartGame : MonoBehaviour {
    // Start is called before the first frame update
    public Button startGameButton;
    public Button restartGame;

    public Button quitGame;
    void Start () {
        float playerLocation = PlayerPrefs.GetFloat ("GGJ2020_playerLocation_x");
        if (playerLocation != 0f) {
            startGameButton.GetComponentInChildren<TMPro.TextMeshProUGUI> ().text = "Continue";
            restartGame.gameObject.SetActive (true);
        }
        startGameButton.onClick.AddListener (() => SceneManager.LoadScene ("SampleScene"));
        restartGame.onClick.AddListener (ResetGame);
        quitGame.onClick.AddListener (QuitGame);
    }

    void ResetGame () {
        PlayerPrefs.SetFloat ("GGJ2020_playerLocation_x", 0f);
        PlayerPrefs.SetFloat ("GGJ2020_playerLocation_z", 0f);
        PlayerPrefs.SetFloat ("GGJ2020_playerLocation_y", 0f);
        PlayerPrefs.SetString ("defaultsavedInkStory", "");
        PlayerPrefs.SetString ("defaultlastSavedTextChunk", "");
        PlayerPrefs.SetString ("defaultlastSavedTags", "");
        SceneManager.LoadScene ("SampleScene");
    }

    void QuitGame () {
        Application.Quit ();
    }

    // Update is called once per frame
    void Update () {

    }
}