using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BallManager : MonoBehaviour
{
    private Rigidbody rb;
    public float g = 100f;
    public Vector3 launch;
    public GameObject MainCamera;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        launchBall();
    }
    void FixedUpdate()
    {
        rb.AddForce(new Vector3(0, -1.0f, 0) * rb.mass * g);
    }

    void launchBall()
    {
        rb.AddForce(launch * rb.mass * g);
    }

    private void Update()
    {
        MainCamera.transform.position = new Vector3(rb.position.x, rb.position.y + 30, rb.position.z + 250);
        MainCamera.transform.LookAt(rb.position);
    }
}
