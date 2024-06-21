# aprs

This repo holds my configuration for a [local APRS iGateway/Digipeater](https://aprs.fi/info/a/W8JFL-10). 

## Hardware
- Yaesu FT-2980R
- Astron SS-18 Power Supply
- Tigertronics SignaLink USB
- Custom tuned APRS antenna tuned for 144.39 MHz from [Ed Fong](https://edsantennas.weebly.com)
- 50ft RG8 Coax w/ PL259 Ends

### Configuration

#### Yaesu FT-2980R

1. Tune to 144.390Mhz
2. Ensure SQL is fully counter-clockwise (off)

####  Tigertronics SignaLink USB

0. Install SLMODR1Y jumper
1. Ensure 3.5mm audio cable is plugged into FT-2980R's rear audio port
2. Ensure RJ-11 mic cable is connected into FT-2980R's front mic port
3. Ensure USB cable is connected to server running Direwolf
4. Turn TX knob to ~270°
5. Turn RX knob to ~0°
6. Turn DLY knob fully counter-clockwise (off)
