﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour {
    public static GameManager instance;
    public bool paused = false;

    public GenericClickToMove playerController;
    public bool disableControls = false;
    void Awake () {
        if (instance == null) {
            instance = this;
        } else {
            Destroy (this);
        }
    }
    // Start is called before the first frame update
    void Start () {
        float playerLocation = PlayerPrefs.GetFloat ("GGJ2020_playerLocation_x");
        if (playerLocation != 0f) {
            LoadGame ();
        }
        else {
            InkWriter.main.StartStory();
        }
    }
    public void PauseGame (bool pause) {
        paused = pause;
        playerController.Activate (!pause);
    }

    public void SaveGame () {
        InkWriter.main.SaveStory ();
        Vector3 playerPos = GameObject.FindGameObjectWithTag ("Player").transform.position;
        PlayerPrefs.SetFloat ("GGJ2020_playerLocation_x", playerPos.x);
        PlayerPrefs.SetFloat ("GGJ2020_playerLocation_z", playerPos.z);
        PlayerPrefs.SetFloat ("GGJ2020_playerLocation_y", playerPos.y);
        Debug.Log ("saved player pos: " + playerPos);
    }
    public void LoadGame () {
        Debug.Log ("Loading game!");
        InkWriter.main.LoadStory ();
        Transform player = GameObject.FindGameObjectWithTag ("Player").transform;
        Vector3 playerNewPos = new Vector3 { };
        playerNewPos.x = PlayerPrefs.GetFloat ("GGJ2020_playerLocation_x");
        playerNewPos.z = PlayerPrefs.GetFloat ("GGJ2020_playerLocation_z");
        playerNewPos.y = PlayerPrefs.GetFloat ("GGJ2020_playerLocation_y");
        Debug.Log ("Player pos: " + playerNewPos);
        player.GetComponent<UnityEngine.AI.NavMeshAgent> ().Warp (playerNewPos);
    }

    public void Restart () {
        SceneManager.LoadScene (SceneManager.GetActiveScene ().name);
    }

    [EasyButtons.Button]
    public void ResetGame () {
        InkWriter.main.ResetStory ();
        PlayerPrefs.SetFloat ("GGJ2020_playerLocation_x", 0f);
        PlayerPrefs.SetFloat ("GGJ2020_playerLocation_z", 0f);
        PlayerPrefs.SetFloat ("GGJ2020_playerLocation_y", 0f);
        Restart ();
    }

    public void QuitGame () {
        Application.Quit ();
    }

    // Update is called once per frame
    void Update () {

    }
}