using System.Collections;
using System.Collections.Generic;
using Cinemachine;
using UnityEngine;

public class CameraController : MonoBehaviour {
    public static CameraController instance;

    public CinemachineVirtualCamera zoomedInCamera;
    public CinemachineVirtualCamera travelCamera;

    void Awake () {
        if (instance == null) {
            instance = this;
        } else {
            Destroy (gameObject);
        }
    }
    // Start is called before the first frame update
    void Start () {

    }

    public void TravelCameraUse () {
        travelCamera.Priority = 10;
        zoomedInCamera.Priority = 9;
    }
    public void ZoomedInCameraUse () {
        travelCamera.Priority = 9;
        zoomedInCamera.Priority = 10;
    }

    // Update is called once per frame
    void Update () {

    }
}