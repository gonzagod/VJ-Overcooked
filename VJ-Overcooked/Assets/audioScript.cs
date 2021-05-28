using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class audioScript : MonoBehaviour
{
    AudioSource[] audioSound;
    // Start is called before the first frame update
    void Start()
    {
        audioSound = GetComponents<AudioSource>();
        foreach(AudioSource audio in audioSound)
        {
            audio.PlayDelayed(1.5f);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
