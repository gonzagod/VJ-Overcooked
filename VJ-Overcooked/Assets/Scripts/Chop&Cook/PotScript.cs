using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PotScript : MonoBehaviour
{

    public int numIngredients = 0;
    public List<string> ingredientNames = new List<string>();
    public float timeCooked = 0;
    public float maxTimeToCook = 10;
    public bool burned = false;
    public bool foodReady = false;
    public float burningCount = 0f;
    public bool visibleTimeBar = false;
    public bool soupReady = false;
    public string madeOf = "";
    private bool burningAlarm = false;
    private GameObject parentPlace = null;
    private GameObject content = null;
    private GameObject soup = null;
    private GameObject steam = null;
    private GameObject burnedContent = null;
    private AudioSource audioPot = null;
    private AudioSource audioCooking = null;
    private AudioSource[] addSound = new AudioSource[6];
    private AudioSource[] audioSound;
    private AudioSource audioCooked = null;
    bool isAudioCooking = false;

    // Start is called before the first frame update
    void Start()
    {
        content = gameObject.transform.Find("Content").gameObject;
        soup = content.transform.Find("Soup").gameObject;
        steam = content.transform.Find("PFX_PotSteam").gameObject;
        burnedContent = content.transform.Find("Burned").gameObject;
        audioSound = gameObject.GetComponents<AudioSource>();
        audioPot = audioSound[0];
        audioCooking = audioSound[7];
        audioCooked = audioSound[8];
        for (int i = 0; i < 6; ++i) addSound[i] = audioSound[i + 1];
        burningCount = 0f;
    }

    // Update is called once per frame
    void Update()
    {
        if(numIngredients < 1) desactivateContent();
        if(numIngredients > 0) activateContent();
        checkBurned();
        soup.GetComponent<Animator>().SetInteger("numIngredients", numIngredients);
        parentPlace = gameObject.transform.parent.gameObject;
        if(parentPlace.name == "AttachPoint"){
            if(parentPlace.transform.parent.gameObject.tag == "CookingStation"){
                if(numIngredients > 0 && timeCooked < 20f){
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
        if(timeCooked >= maxTimeToCook*2 && !burned) burnPot();
        if(timeCooked >= maxTimeToCook && timeCooked < maxTimeToCook*1.2 && !foodReady) foodReadyAnim();
        if(timeCooked >= maxTimeToCook*1.5 && !burningAlarm) alarmPot();

        if(burningCount <= 0){
            transform.Find("BurningPot").gameObject.SetActive(false);
        }
    }

    public void addIngredient(string foodName){
        int rand6 = UnityEngine.Random.Range(0, 5);
        if(numIngredients == 0) madeOf = foodName;
        else if(madeOf != foodName) madeOf = "Error";
        visibleTimeBar = true;
        ingredientNames.Add(foodName);
        numIngredients++;
        switch(numIngredients){
            case 1:
                soup.transform.position = soup.transform.position + new Vector3(0,-0.34f, 0);
                break;
            case 2:
                soup.transform.position = soup.transform.position + new Vector3(0, 0.15f, 0);
                break;
            case 3:
                soup.transform.position = soup.transform.position + new Vector3(0, 0.19f, 0);
                break;
            default:
                break;
        }
        updateIcons();
        if(numIngredients > 1){
            if(timeCooked >= 10f) timeCooked = 5f;
            else timeCooked /= 2;
        }
        foodReady = false;
        burningAlarm = false;
        addSound[rand6].Play();
        if (!isAudioCooking)
        {
            isAudioCooking = true;
            audioCooking.Play();
        }
    }

    public void cleanPot(){
        numIngredients = 0;
        soup.transform.localPosition = new Vector3(0, 0, 0);
        burningAlarm = false;
        ingredientNames.Clear();
        visibleTimeBar = false;
        timeCooked = 0;
        foodReady = false;
        soupReady = false;
        burned = false;
        burningCount = 0f;
        checkBurned();
        updateIcons();
        isAudioCooking = false;
        audioCooking.Stop();
    }

    private void updateIcons(){
        string iconUsed = "";
        if(!burned){
            switch(numIngredients){
                case 1:
                    transform.Find("OneIcon").gameObject.SetActive(true);
                    transform.Find("TwoIcons").gameObject.SetActive(false);
                    transform.Find("ThreeIcons").gameObject.SetActive(false);
                    iconUsed = "OneIcon";
                    break;
                case 2:
                    transform.Find("OneIcon").gameObject.SetActive(false);
                    transform.Find("TwoIcons").gameObject.SetActive(true);
                    transform.Find("ThreeIcons").gameObject.SetActive(false);
                    iconUsed = "TwoIcons";
                    break;
                case 3:
                    transform.Find("OneIcon").gameObject.SetActive(false);
                    transform.Find("TwoIcons").gameObject.SetActive(false);
                    transform.Find("ThreeIcons").gameObject.SetActive(true);
                    iconUsed = "ThreeIcons";
                    break;
                default:
                    transform.Find("OneIcon").gameObject.SetActive(false);
                    transform.Find("TwoIcons").gameObject.SetActive(false);
                    transform.Find("ThreeIcons").gameObject.SetActive(false);
                    break;
            }
            SpriteRenderer iconRenderer = null;
            if(iconUsed != ""){
                Sprite mushroomSprite = gameObject.GetComponent<PotMaterials>().Mushroom;
                Sprite tomatoSprite = gameObject.GetComponent<PotMaterials>().Tomato;
                Sprite onionSprite = gameObject.GetComponent<PotMaterials>().Onion;
                Sprite burnedSprite = gameObject.GetComponent<PotMaterials>().Burned;
                int i = 0;
                foreach(Transform icon in transform.Find(iconUsed)){
                    if(icon.tag == "Icon"){
                        iconRenderer = icon.gameObject.GetComponent<SpriteRenderer>();
                        if(ingredientNames[i] == "Mushroom") iconRenderer.sprite = mushroomSprite;
                        else if(ingredientNames[i] == "Tomato") iconRenderer.sprite = tomatoSprite;
                        else if(ingredientNames[i] == "Onion") iconRenderer.sprite = onionSprite;
                        else if(ingredientNames[i] == "Burned") iconRenderer.sprite = burnedSprite;
                        ++i;
                    }
                }
            }
        } else{
            transform.Find("OneIcon").gameObject.SetActive(false);
            transform.Find("TwoIcons").gameObject.SetActive(false);
            transform.Find("ThreeIcons").gameObject.SetActive(false);
            transform.Find("BurnedIcon").gameObject.SetActive(true);
        }
    }

    private void burnPot(){
        cleanPot();
        var fireSound =  Resources.Load("FireIgnition") as AudioClip;
        audioPot.PlayOneShot(fireSound);
        burned = true;
        burningCount = 2.5f;
        updateIcons();
    }

    private void activateContent(){
        soup.SetActive(true);
    }

    private void desactivateContent(){
        soup.SetActive(false);
        steam.SetActive(false);
    }

    private void checkBurned(){
        if(burned){
            burnedContent.SetActive(true);
            transform.Find("BurningPot").gameObject.SetActive(true);
        }else {
            burnedContent.SetActive(false);
            transform.Find("BurningPot").gameObject.SetActive(false);
            transform.Find("BurnedIcon").gameObject.SetActive(false);
        }
    }

    private void foodReadyAnim(){
        audioCooked.Play();
        foodReady = true;
        if(numIngredients == 3) soupReady = true;
        StartCoroutine(DoFadeIn(transform.Find("CookingTick/Icon").gameObject.GetComponent<SpriteRenderer>()));
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

    private void alarmPot(){
        burningAlarm = true;
        StartCoroutine(burnAnimation(transform.Find("BurnWarning").gameObject.GetComponent<SpriteRenderer>()));
        audioPot.clip = Resources.Load("CookingWarning") as AudioClip;
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
                audioPot.Play(0);
            }
            _sprite.color = tmpColor;

            yield return null;
        }
        tmpColor.a = 0;
        _sprite.color = tmpColor;
    }

    public bool canSoupItem(string nameItem){
        if(nameItem != "Onion" && nameItem != "Mushroom" && nameItem != "Tomato") return false;
        return true;
    }
}
