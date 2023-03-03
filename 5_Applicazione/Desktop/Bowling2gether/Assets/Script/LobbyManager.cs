using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LobbyManager : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {

    }

    public void startGame()
    {
        SceneManager.LoadScene("GameScene");
    }


}
