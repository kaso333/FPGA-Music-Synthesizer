# FPGA-Music-Synthesizer

A simple sound synthesizer implemented on the **Arty A7 (Xilinx Artix-7)** FPGA platform. The project generates musical tones based on user input using PWM modulation to drive a buzzer.

---

## 🇬🇧 English Description

### Project Overview
The goal of this project was to create a functional electronic organ that generates specific musical frequencies (C4, D4, E4, etc.) by dividing the 100 MHz system clock. 

### Key Features
* **8-Note Range:** Supports notes from the 4th octave (C4, D4, E4, G4) and 5th octave (C5, D5, E5, G5).
* **Octave Switching:** Uses four sliding switches (SW[0] to SW[3]) to toggle between lower and higher octaves for each corresponding button.
* **Visual Feedback:** Features full RGB LED integration. [cite_start]LEDs glow **green** for the base octave and **red** for the higher octave when a note is played.
* **PWM Generation:** Sound is produced via Pulse Width Modulation by toggling the buzzer state based on calculated clock dividers.

### Hardware Requirements
* **Board:** Arty A7-35T or A7-100T.
* **Peripherals:** 4 Buttons, 4 Switches, 4 RGB LEDs, and an internal Buzzer.

---

## 🇵🇱 Opis po Polsku

### Przegląd Projektu
Celem projektu „Organki” było stworzenie prostego syntezatora dźwięku na platformie FPGA, który generuje tony muzyczne w zależności od wciśniętych przycisków. System wykorzystuje podział głównego zegara 100 MHz do uzyskania odpowiednich częstotliwości nut.

### Główne Funkcjonalności
* **Zakres 8 nut:** Obsługa nut C4, D4, E4, G4 oraz ich odpowiedników w wyższej oktawie (C5, D5, E5, G5).
* **Zmiana oktawy:** Wykorzystanie czterech przełączników (SW[0] do SW[3]) pozwala na zmianę oktawy dla każdej nuty przypisanej do przycisku.
* **Wizualizacja RGB:** Projekt wykorzystuje diody RGB do sygnalizacji stanu. Dioda świeci na **zielono** dla niższej oktawy i na **czerwono** dla wyższej.
* **Sterowanie PWM:** Sygnał dźwiękowy generowany jest przez przełączanie stanu buzzera w oparciu o licznik zegara (modulacja PWM).

### Struktura Plików
* `src/Organki.vhd` - Główny kod źródłowy w języku VHDL.
* `constr/Organki.xdc` - Plik ograniczeń projektowych (mapowanie pinów dla Arty A7).
* `docs/PUL_projekt.pdf` - Pełna dokumentacja projektu.

---

## Technical Implementation / Implementacja Techniczna

The core logic uses a priority-based button checking system (from Button[0] to Button[3]). The sound is only active when a button is pressed.

**Note Frequencies used:**
* C4: 261 Hz / C5: 523 Hz
* D4: 294 Hz / D5: 587 Hz
* E4: 330 Hz / E5: 659 Hz
* G4: 392 Hz / G5: 784 Hz

---
Author: **Kacper Sosnowski**
