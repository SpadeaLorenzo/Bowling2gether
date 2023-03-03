using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PinManager : MonoBehaviour
{
    private Rigidbody rb;
    public float g = 100f;
    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }
    void FixedUpdate()
    {
        rb.AddForce(new Vector3(0, -1.0f, 0) * rb.mass * g);
    }
}
