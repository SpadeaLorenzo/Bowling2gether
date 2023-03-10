using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class EventManager : MonoBehaviour
{
    public static event UnityAction throwEnded;
    public static event UnityAction throwStarted;

    public static void OnThrowEnded() => throwEnded.Invoke();
    public static void OnThrowStarted() => throwStarted.Invoke();
}
