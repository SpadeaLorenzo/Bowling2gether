using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LobbyManager : MonoBehaviour
{
    private string code;
    [SerializeField]
    private TMP_Text t;
    // Start is called before the first frame update
    void Start()
    {
        getCode();
    }

    public void startGame()
    {
        SceneManager.LoadScene("GameScene");
    }

    public void getCode()
    {
        code = "1234 5678";
        t.text = code;
    }
}
