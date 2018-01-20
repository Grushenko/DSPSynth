#include "tt.h"
#include "midi2spi.h"

unsigned char notes[VOICES];
unsigned char notes_velocity[VOICES];
unsigned char notes_last_index;

unsigned char liczba;
unsigned char byte_2nd;
unsigned char byte_3rd;
unsigned char indeks_midi;
unsigned char index;

float pitch[128] = {
    8.175798915643707, 8.661957218027252, 9.177023997418987, 9.722718241315029, 10.300861153527185, 10.913382232281371,
    11.562325709738575, 12.249857374429665, 12.978271799373285, 13.75, 14.56761754744031, 15.433853164253879, 16.351597831287414,
    17.323914436054505, 18.354047994837973, 19.445436482630058, 20.60172230705437, 21.826764464562743, 23.12465141947715,
    24.49971474885933, 25.95654359874657, 27.5, 29.13523509488062, 30.867706328507758, 32.70319566257483, 34.64782887210901,
    36.70809598967595, 38.890872965260115, 41.20344461410874, 43.653528929125486, 46.2493028389543, 48.99942949771866, 51.91308719749314,
    55.0, 58.27047018976124, 61.7354126570155, 65.40639132514966, 69.29565774421802, 73.41619197935188, 77.78174593052023,
    82.4068892282175, 87.30705785825097, 92.4986056779086, 97.99885899543733, 103.82617439498628, 110.0, 116.54094037952248,
    123.470825314031, 130.8127826502993, 138.59131548843604, 146.83238395870376, 155.56349186104046, 164.813778456435,
    174.61411571650194, 184.9972113558172, 195.99771799087466, 207.65234878997256, 220.0, 233.0818807590449, 246.94165062806212,
    261.6255653005986, 277.1826309768721, 293.66476791740763, 311.1269837220809, 329.62755691286986, 349.22823143300394,
    369.9944227116344, 391.9954359817492, 415.3046975799452, 440.0, 466.1637615180898, 493.88330125612424, 523.2511306011972,
    554.3652619537442, 587.3295358348153, 622.2539674441618, 659.2551138257397, 698.4564628660079, 739.9888454232688,
    783.9908719634984, 830.6093951598904, 880.0, 932.3275230361796, 987.7666025122485, 1046.5022612023945, 1108.7305239074883,
    1174.6590716696305, 1244.5079348883237, 1318.5102276514795, 1396.9129257320158, 1479.9776908465376, 1567.9817439269968,
    1661.2187903197807, 1760.0, 1864.6550460723593, 1975.533205024497, 2093.004522404789, 2217.4610478149766, 2349.318143339261,
    2489.0158697766474, 2637.020455302959, 2793.8258514640315, 2959.955381693075, 3135.9634878539937, 3322.4375806395615,
    3520.0, 3729.3100921447212, 3951.0664100489917, 4186.009044809578, 4434.922095629955, 4698.636286678519,
    4978.031739553295, 5274.040910605921, 5587.65170292806, 5919.91076338615, 6271.926975707992, 6644.875161279119, 7040.0,
    7458.6201842894425, 7902.132820097983, 8372.018089619156, 8869.84419125991, 9397.272573357039, 9956.06347910659, 10548.081821211843,
    11175.30340585612, 11839.8215267723};



float MIDICCparams[256];
    
void handle_LED(int);

void InitSPI()
{
    int i;
    index = 0;
    /* First configure the SPI Control registers */
    /* First clear a few registers     */

    for (i = 0; i < 256; i++)
        MIDICCparams[i] = 0;

    for (i = 0; i < VOICES; i++)
    {
        notes[i] = 0;
        notes_velocity[i] = 0;
    }
    notes_last_index = 0;

    *pSPICTL = (TXFLSH | RXFLSH);
    //    *pSPIFLG = 0;

    /* Setup the SPI Flag register to FLAG3 : 0xF708*/
    //*pSPIFLG = 0xFF00;

    /*
    	PIEN - enable SPI
    	MSBF - begin with MSB
    	WL16 - word length set to 16bits
    	TIMOD1 - send when there's data incoming
    	SENDZ - send zeros if there was no data to be sent
    	ISSEN - enable SPI activation with SS
    	CLKPL - change data polarity
    */

    *pSPICTL = (SPIEN | MSBF | WL16 | CPHASE); //TIMOD1 | SENDZ | ISSEN | CLKPL);
    handle_LED(0);
}

void SpiISR(int sig_int)
{
    /*
    unsigned int rdata = *pRXSPI;
    unsigned int index = (rdata >> 8) & 0xff;
    params[index] = rdata & 0xff;
    *pTXSPI = index;
    */

    index++;

    unsigned int rdata = *pRXSPI;
    rdata = rdata & 0x00FF;
    //params[index]=rdata;

    if (rdata > 127)
    {
        liczba = rdata & 0xF0;
        if (liczba == 0xB0)
        {                         //polecenie controll change, dowolny adres MIDI
            indeks_midi = CC_REC; //nastepny odebrany bajt <128 wpisz do 2nd_byte
        }
        else if (liczba == 0x90)
        { //polecenie noteon
            indeks_midi = NOTEON_REC;
        }
        else
        {
            indeks_midi = IGNORE_REC; //polecenie inne niz controll change, ignoruj
        }
    }
    else
    {
        if (indeks_midi == CC_REC)
        {
            byte_2nd = rdata;
            indeks_midi = CC_SECOND_REC; //nastepny odebrany bajt <128 wpisz do 3rd_byte
        }
        else if (indeks_midi == NOTEON_REC)
        {
            byte_2nd = rdata;
            indeks_midi = NOTEON_SECOND_REC; //nastepny odebrany bajt <128 wpisz do 3rd_byte
        }
        else if (indeks_midi == CC_SECOND_REC)
        {
            byte_3rd = rdata;
            indeks_midi = CC_REC; //jesli odbierze potem jeszcze jeden bajt <128, to kolejna dana
            MIDICCparams[byte_2nd] = byte_3rd/127.0;
        }
        else if (indeks_midi == NOTEON_SECOND_REC)
        {
            byte_3rd = rdata;
            indeks_midi = NOTEON_REC; //jesli odbierze potem jeszcze jeden bajt <128, to kolejna dana
            if (byte_3rd != 0)
            {
                activateNote(pitch[byte_2nd], byte_3rd / 127.0);
            }
            else
            {
                turnDownNote(pitch[byte_2nd]);
            }
        }
    }
}

void DisableSPI()
{
    *pSPICTL = (TXFLSH | RXFLSH);
}

void handle_LED(int led_value)
{
    //lights as described at the top of the file
    *pPPCTL = 0;

    *pIIPP = (int)&led_value;
    *pIMPP = 1;
    *pICPP = 1;
    *pEMPP = 1;
    *pECPP = 1;
    *pEIPP = 0x400000;

    *pPPCTL = PPTRAN | PPBHC | PPDUR20 | PPDEN | PPEN;
}
