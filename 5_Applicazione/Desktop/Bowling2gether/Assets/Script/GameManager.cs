using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class GameManager : MonoBehaviour
{
    [SerializeField]
    private List<GameObject> pins = new List<GameObject>();

    [HideInInspector]
    public List<GameObject> fallPins;

    private List<GameObject> allPins;
    private List<Vector3> pinsPosition = new List<Vector3>();
    private List<Quaternion> pinsRotation = new List<Quaternion>();


    public float g = 100f;
    // Start is called before the first frame update
    void Start()
    {

        allPins = new List<GameObject>(pins);
        foreach(GameObject pin in allPins.ToArray())
        {
            pinsPosition.Add(pin.transform.position);
            pinsRotation.Add(pin.transform.rotation);
        }
    }

    private void OnEnable()
    {
        EventManager.throwEnded += ResetPinsPosition;
    }

    private void OnDisable()
    {
        EventManager.throwEnded -= ResetPinsPosition;
    }

    void FixedUpdate()
    {
        foreach (GameObject pin in allPins.ToArray())
        {
            Rigidbody rb = pin.GetComponent<Rigidbody>();
            rb.AddForce(new Vector3(0, -1.0f, 0) * rb.mass * g);
        }
    }

    // Update is called once per frame
    void Update()
    {
        foreach (GameObject pin in pins.ToArray())
        {
            if (pin.transform.rotation.x * 360 > 215 || pin.transform.rotation.x * 360 < 145)
            {
                fallPins.Add(pin);

                pins.Remove(pin);
            }
        }
    }

    private void ResetPinsPosition()
    {
        for(int i = 0; i < allPins.Count; i++)
        {
            allPins[i].GetComponent<Rigidbody>().angularVelocity = new Vector3(0, 0, 0);
            allPins[i].transform.rotation = pinsRotation[i];
            allPins[i].transform.position = pinsPosition[i];

        }
    }
}
