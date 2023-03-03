using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class CodeManager : MonoBehaviour
{
    private string code;
    [SerializeField]
    private TMP_Text t;
    // Start is called before the first frame update
    void Start()
    {
        getCode();
    }

    public void getCode()
    {
        code = "1234 5678";
        t.text = code;
    }
}
