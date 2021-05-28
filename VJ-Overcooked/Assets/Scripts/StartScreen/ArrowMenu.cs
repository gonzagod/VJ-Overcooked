using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class ArrowMenu : MonoBehaviour
{

    public bool canMove = false;
    public string showing = "Main";
    public int option = 0;
    private ManagerScript manager;
    private AudioSource audioMenu = null;

    // Start is called before the first frame update
    void Start()
    {
        manager = GameObject.Find("GameManager").GetComponent<ManagerScript>();
        audioMenu = gameObject.GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        if(canMove){
            if (Input.GetKeyUp(KeyCode.DownArrow) & transform.position.z > 5.6f)
            {
                transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z - 0.28f);
                if(option < 3) ++option;
                Random rnd = new Random();
                int optionSound = UnityEngine.Random.Range(1, 4);
                if(optionSound == 1){
                    var optionSoundAudio =  Resources.Load("One") as AudioClip;
                    audioMenu.PlayOneShot(optionSoundAudio);
                }else if(optionSound == 2){
                    var optionSoundAudio =  Resources.Load("Two") as AudioClip;
                    audioMenu.PlayOneShot(optionSoundAudio);
                }else if(optionSound == 3){
                    var optionSoundAudio =  Resources.Load("Three") as AudioClip;
                    audioMenu.PlayOneShot(optionSoundAudio);
                }
            }

            if (Input.GetKeyUp(KeyCode.UpArrow) & transform.position.z < 6.3f)
            {
                transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z + 0.28f);
                if(option > 0) --option;
                Random rnd = new Random();
                int optionSound = UnityEngine.Random.Range(1, 4);
                if(optionSound == 1){
                    var optionSoundAudio =  Resources.Load("One") as AudioClip;
                    audioMenu.PlayOneShot(optionSoundAudio);
                }else if(optionSound == 2){
                    var optionSoundAudio =  Resources.Load("Two") as AudioClip;
                    audioMenu.PlayOneShot(optionSoundAudio);
                }else if(optionSound == 3){
                    var optionSoundAudio =  Resources.Load("Three") as AudioClip;
                    audioMenu.PlayOneShot(optionSoundAudio);
                }
            }

            if (Input.GetKeyDown("space"))
            {
                var selectAudio =  Resources.Load("Select") as AudioClip;
                audioMenu.PlayOneShot(selectAudio);

                if (option == 0) SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
                else if (option == 1){
                    manager.showInstructions();
                }
                else if (option == 2){
                    manager.showCredits();
                }
                else if (option == 3){
                    Application.Quit();
                }
            }
        }
        if(showing == "Instructions" || showing == "Credits"){
            if(Input.GetKeyDown(KeyCode.Escape)){
                var back =  Resources.Load("Back") as AudioClip;
                audioMenu.PlayOneShot(back);
                manager.showMainMenu();
            }
        }
    }
}
