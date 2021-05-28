using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PanScript : MonoBehaviour
{

    public string ingredientName = "";
    public string primaryFood = "";
    public float timeCooked = 0;
    public float maxTimeToCook = 10;
    public bool burned = false;
    public bool foodReady = false;
    public float burningCount = 0f;
    public bool visibleTimeBar = false;
    private bool burningAlarm = false;
    private GameObject parentPlace = null;
    private GameObject content = null;
    private GameObject food = null;
    private GameObject steam = null;
    private GameObject burnedContent = null;
    private AudioSource audioPan = null;
    private AudioSource[] audioSound;
    private AudioSource[] addSound = new AudioSource[6];
    private AudioSource audioCooked = null;
    private AudioSource audioCooking = null;
    bool isAudioCooking = false;

    // Start is called before the first frame update
    void Start()
    {
        content = gameObject.transform.Find("Content").gameObject;
        steam = content.transform.Find("PFX_PanSteam").gameObject;
        burnedContent = content.transform.Find("Burned").gameObject;
        audioSound = gameObject.GetComponents<AudioSource>();
        audioPan = audioSound[0];
        audioCooking = audioSound[7];
        audioCooked = audioSound[8];
        for (int i = 0; i < 6; ++i) addSound[i] = audioSound[i + 1];
        burningCount = 0f;
    }

    // Update is called once per frame
    void Update()
    {
        if(ingredientName == "") steam.SetActive(false);
        checkBurned();
        parentPlace = gameObject.transform.parent.gameObject;
        if(parentPlace.name == "AttachPoint"){
            if(parentPlace.transform.parent.gameObject.tag == "CookingStation"){
                if(ingredientName != "" && timeCooked < 20f){
                    timeCooked += Time.deltaTime;
                    steam.SetActive(true);
                }
            }
        }else{
            if(timeCooked > maxTimeToCook) {
                timeCooked = maxTimeToCook;
                burningAlarm = false;
            }
        }
        if(timeCooked >= maxTimeToCook*2 && !burned) burnPan();
        if(timeCooked >= maxTimeToCook && timeCooked < maxTimeToCook*1.2 && !foodReady) foodReadyAnim();
        if(timeCooked >= maxTimeToCook*1.5 && !burningAlarm) alarmPan();

        if(burningCount <= 0){
            transform.Find("BurningPan").gameObject.SetActive(false);
        }
    }

    public void addIngredient(GameObject ingredient, string foodName){
        int rand6 = UnityEngine.Random.Range(0, 5);
        food = ingredient;
        food.transform.SetParent(content.transform, false);
        ingredientName = foodName;
        visibleTimeBar = true;
        foodReady = false;
        burningAlarm = false;
        updateIcons();
        addSound[rand6].Play();
        if (!isAudioCooking)
        {
            isAudioCooking = true;
            audioCooking.Play();
        }
    }

    public void cleanPan(){
        ingredientName = "";
        primaryFood = "";
        burningAlarm = false;
        visibleTimeBar = false;
        timeCooked = 0;
        foodReady = false;
        burned = false;
        burningCount = 0f;
        foreach(Transform child in content.transform) if(child.gameObject.name.Contains("Plated")) Destroy(child.gameObject);
        food = null;
        checkBurned();
        updateIcons();
        isAudioCooking = false;
        audioCooking.Stop();
    }

    private void updateIcons(){
        string iconUsed = "";
        if(!burned){
            if(ingredientName != "") transform.Find("OneIcon").gameObject.SetActive(true);
            else transform.Find("OneIcon").gameObject.SetActive(false);

            SpriteRenderer iconRenderer = null;
            if(iconUsed != ""){
                Sprite mushroomSprite = gameObject.GetComponent<PanMaterials>().Mushroom;
                Sprite potatoSprite = gameObject.GetComponent<PanMaterials>().Potato;
                Sprite chickenSprite = gameObject.GetComponent<PanMaterials>().Chicken;
                Sprite meatSprite = gameObject.GetComponent<PanMaterials>().Meat;
                Sprite burnedSprite = gameObject.GetComponent<PanMaterials>().Burned;
                int i = 0;
                foreach(Transform icon in transform.Find(iconUsed)){
                    if(icon.tag == "Icon"){
                        iconRenderer = icon.gameObject.GetComponent<SpriteRenderer>();
                        if(ingredientName == "Mushroom") iconRenderer.sprite = mushroomSprite;
                        else if(ingredientName == "Potato") iconRenderer.sprite = potatoSprite;
                        else if(ingredientName == "Chicken") iconRenderer.sprite = chickenSprite;
                        else if(ingredientName == "Meat") iconRenderer.sprite = meatSprite;
                        else if(ingredientName == "Burned") iconRenderer.sprite = burnedSprite;
                        ++i;
                    }
                }
            }
        } else{
            transform.Find("OneIcon").gameObject.SetActive(false);
            transform.Find("BurnedIcon").gameObject.SetActive(true);
        }
    }

    private void burnPan(){
        cleanPan();
        var fireSound =  Resources.Load("FireIgnition") as AudioClip;
        audioPan.PlayOneShot(fireSound);
        burned = true;
        burningCount = 2.5f;
        updateIcons();
    }

    private void checkBurned(){
        if(burned){
            burnedContent.SetActive(true);
            transform.Find("BurningPan").gameObject.SetActive(true);
        }else {
            burnedContent.SetActive(false);
            transform.Find("BurningPan").gameObject.SetActive(false);
            transform.Find("BurnedIcon").gameObject.SetActive(false);
        }
    }

    private void foodReadyAnim(){
        audioCooked.Play();
        foodReady = true;
        StartCoroutine(DoFadeIn(transform.Find("CookingTick/Icon").gameObject.GetComponent<SpriteRenderer>()));
        updateContent();
    }

    private void updateContent(){
        GameObject newFood = null;
        switch(ingredientName){
            case "ChoppedBurger":
                foreach(Transform child in content.transform) if(child.gameObject.tag == "Ingredient") Destroy(child.gameObject);
                GameObject newMeat= Instantiate(Resources.Load("Plates/PlatedBurger"), Vector3.zero, Quaternion.identity) as GameObject;
                food = newMeat;
                ingredientName = "PlatedBurger";
                food.transform.SetParent(content.transform, false);
                primaryFood = "Burger";
                newFood = Instantiate(Resources.Load("Icons/"+ primaryFood + "Icon"), new Vector3(0, 100f, 0), Quaternion.identity) as GameObject;
                newFood.transform.localScale = new Vector3(20f, 20f, 1);
                newFood.transform.SetParent(food.transform, false);
                break;
            case "ChoppedChicken":
                foreach(Transform child in content.transform) if(child.gameObject.tag == "Ingredient") Destroy(child.gameObject);
                GameObject newChicken= Instantiate(Resources.Load("Plates/PlatedChicken"), Vector3.zero, Quaternion.identity) as GameObject;
                food = newChicken;
                ingredientName = "PlatedChicken";
                food.transform.SetParent(content.transform, false);
                primaryFood = "Chicken";
                newFood = Instantiate(Resources.Load("Icons/"+ primaryFood + "Icon"), new Vector3(0, 1f, 0), Quaternion.identity) as GameObject;
                newFood.transform.SetParent(food.transform, false);
                break;
            case "ChoppedPotato":
                foreach(Transform child in content.transform) if(child.gameObject.tag == "Ingredient") Destroy(child.gameObject);
                GameObject newPotato= Instantiate(Resources.Load("Plates/PlatedPotato"), Vector3.zero, Quaternion.identity) as GameObject;
                food = newPotato;
                ingredientName = "PlatedPotato";
                food.transform.SetParent(content.transform, false);
                primaryFood = "Potato";
                newFood = Instantiate(Resources.Load("Icons/"+ primaryFood + "Icon"), new Vector3(0, 1.3f, 0), Quaternion.identity) as GameObject;
                newFood.transform.SetParent(food.transform, false);
                break;

            default:
                break;
        }

    }

    private IEnumerator DoFadeIn(SpriteRenderer _sprite) {
        Color tmpColor = _sprite.color;
        float timeFade = 1f;
        float time = 0f;
        float cont = 0f;
        while(time < 2f)
        {
            time += Time.deltaTime;
            cont += Time.deltaTime / timeFade;
            if (time < (timeFade/2)) tmpColor.a = cont;
            else tmpColor.a = timeFade - cont;
            _sprite.color = tmpColor;

            yield return null;
        }
        tmpColor.a = 0;
        _sprite.color = tmpColor;
    }

    private void alarmPan(){
        burningAlarm = true;
        StartCoroutine(burnAnimation(transform.Find("BurnWarning").gameObject.GetComponent<SpriteRenderer>()));
        audioPan.clip = Resources.Load("CookingWarning") as AudioClip;
    }

    private IEnumerator burnAnimation(SpriteRenderer _sprite) {
        Color tmpColor = _sprite.color;
        float timeTotalFade = 0.7f;
        float timeFading = 0.35f;
        bool playSound = false;
        float time = 0f;
        float cont = 0f;
        while(time < 5f && timeCooked >= 15f && timeCooked< 20f)
        {
            time += Time.deltaTime;
            cont += Time.deltaTime;
            if(cont > timeTotalFade) {
                cont = 0f;
                playSound = false;
            }
            if (cont < timeFading) tmpColor.a = cont*2;
            else tmpColor.a = (timeTotalFade - cont)*2;
            if(cont > timeFading - 0.1 && !playSound){
                playSound = true;
                audioPan.Play(0);
            }
            _sprite.color = tmpColor;

            yield return null;
        }
        tmpColor.a = 0;
        _sprite.color = tmpColor;
    }

    public bool canFryItem(string nameItem){
        if(nameItem != "Burger" && nameItem != "Potato" && nameItem != "Chicken") return false;
        return true;
    }
}
