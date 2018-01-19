#ifndef MIDI2SPI_H_
#define MIDI2SPI_H_

#define IGNORE_REC 0
#define CC_REC 1
#define NOTEON_REC 2
#define CC_SECOND_REC 3
#define NOTEON_SECOND_REC 4

#define VOICES 1

extern unsigned char MIDICCParams[256];

unsigned char notes[VOICES];
unsigned char notes_velocity[VOICES];
unsigned char notes_last_index;

#endif
