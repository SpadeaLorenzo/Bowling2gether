using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using UnityEngine;

public class SocketManager : MonoBehaviour
{
    private static TcpClient socket;
    private static Thread listenThread;

    private const string HOST = "";
    private const int PORT = 0;
    private const int bufferLength = 1024;
    public static void createConnection()
    {
        try
        {
            listenThread = new Thread(new ThreadStart(ListenData));
            listenThread.IsBackground = true;
            listenThread.Start();
        }
        catch(Exception e)
        {
            Debug.LogError("Connection excpetion " + e);
        }
    }

    private static void ListenData()
    {
        try
        {
            socket = new TcpClient(HOST,PORT);
            Byte[] buffer = new Byte[bufferLength];
            while (true)
            {
                using(NetworkStream stream = socket.GetStream())
                {
                    int length;
                    while((length = stream.Read(buffer, 0, buffer.Length)) != 0)
                    {

                    }
                }
            }
        }
        catch(Exception e)
        {
            Debug.LogError("Socket exception " + e);
        }
    }

    private static void sendData(string message)
    {
        if(socket != null)
        {
            try
            {
                NetworkStream stream = socket.GetStream();
                if (stream.CanWrite)
                {
                    byte[] byteMessage = Encoding.ASCII.GetBytes(message);
                    stream.Write(byteMessage, 0, byteMessage.Length);
                }
            }
            catch(Exception e)
            {
                Debug.LogError("Socket exception " + e);
            }
        }
    }
}
