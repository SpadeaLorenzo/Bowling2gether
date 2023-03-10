using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BallManager : MonoBehaviour
{
    private Rigidbody rb;
    private bool endLine = false;
    private Vector3 startPosition;

    public float g = 100f;
    public Vector3 launch;
    public GameObject MainCamera;
    private Vector3 mainCameraPosition;


    void Start()
    {
        rb = GetComponent<Rigidbody>();
        startPosition = rb.position;
        mainCameraPosition = MainCamera.transform.position;
        launchBall();
    }
    void FixedUpdate()
    {
        rb.AddForce(new Vector3(0, -1.0f, 0) * rb.mass * g);
    }

    void launchBall()
    {
        EventManager.OnThrowStarted();
        rb.AddForce(launch * rb.mass * g);
    }

    private void Update()
    {
        if (!endLine)
        {
            MainCamera.transform.position = new Vector3(rb.position.x, rb.position.y + 30, rb.position.z + 250);
            MainCamera.transform.LookAt(rb.position);
        }
    }

    private bool firstCollision = true;
    private void OnCollisionEnter(Collision collision)
    {
        if((collision.gameObject.tag == "Wall" || collision.gameObject.tag == "Pin") && firstCollision)
        {
            endLine = true;
            firstCollision = false;
            StartCoroutine(waitBeforeTp());
        }
    }

    IEnumerator waitBeforeTp()
    {
        yield return new WaitForSeconds(3);
        rb.position = startPosition;
        GameObject ScriptManager = GameObject.FindGameObjectWithTag("ScriptManager");
        Debug.Log(ScriptManager.GetComponent<GameManager>().fallPins.Count);
        EventManager.OnThrowEnded();
        MainCamera.transform.position = mainCameraPosition;
    }
}
