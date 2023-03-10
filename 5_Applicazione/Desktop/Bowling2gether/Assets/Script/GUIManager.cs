using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GUIManager : MonoBehaviour
{
    [SerializeField]
    private GameObject canvas;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    private void OnEnable()
    {
        EventManager.throwStarted += HideGUI;
        EventManager.throwEnded += ShowGUI;
    }

    private void ShowGUI()
    {
        canvas.SetActive(true);
    }

    private void HideGUI()
    {
        canvas.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
