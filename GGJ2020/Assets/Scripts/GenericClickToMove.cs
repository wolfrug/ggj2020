using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Events;

[System.Serializable]
public class StartMove : UnityEvent<NavMeshAgent, Vector3> { }

[System.Serializable]
public class FinishMove : UnityEvent<NavMeshAgent, Vector3> { }

public class GenericClickToMove : MonoBehaviour {
    public Camera cam;
    public LayerMask layerMask;
    public bool hitEveryOtherLayer = false;
    [SerializeField]
    private bool active = true;
    [SerializeField]
    private float remainingDistance;
    [SerializeField]
    private bool isMoving = false;
    public NavMeshAgent targetAgent;
    public StartMove startMoveEvent;
    public FinishMove finishMoveEvent;
    // Start is called before the first frame update
    void Start () {
        if (cam == null) {
            cam = Camera.main;
        }
    }

    void CastRay () {
        /* int targetLayer = 1 << layerMask;
         if (hitEveryOtherLayer) {
             targetLayer = ~layerMask;
         }*/
        int targetLayer = layerMask;
        RaycastHit hit;

        if (Physics.Raycast (cam.ScreenPointToRay (Input.mousePosition), out hit, 100, targetLayer)) {
            Debug.Log ("Hit something!");
            targetAgent.SetDestination (hit.point);
            startMoveEvent.Invoke (targetAgent, hit.point);
            //Invoke ("LateStartMove", 0.1f);
            isMoving = true;
        } else {
            Debug.Log ("hit nothing!");
        }
    }

    void LateStartMove () {
        isMoving = true;
    }
    public void Activate (bool activate) {
        active = activate;
        targetAgent.isStopped = !activate;
        targetAgent.SetDestination (targetAgent.transform.position);
        isMoving = false;
        finishMoveEvent.Invoke (targetAgent, targetAgent.transform.position);
    }

    // Update is called once per frame
    void Update () {
        if (active) {
            if (Input.GetAxis ("Fire1") > 0f) {
                // Moving by clicking left
                CastRay ();
            }
            if (Input.GetButtonDown ("Fire2")) {
                // Interacting by clicking right
                CastRay ();
            }
            if (isMoving) {
                if (targetAgent.remainingDistance < 0.1f) {
                    finishMoveEvent.Invoke (targetAgent, targetAgent.transform.position);
                    isMoving = false;
                }
            }
            remainingDistance = targetAgent.remainingDistance;
        };

    }
}