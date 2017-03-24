titleCut ["","Black Out",6];
titleCut ["","BLACK IN",6];
1 fademusic 0.8;
playMusic "katy";

cutText ["Das war die Mission","PLAIN",6];
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
showcinemaborder true;


;comment "18:40:07";
_camera camPrepareTarget [41575.21,99383.71,-66.15];
_camera camPreparePos [5305.39,6191.71,5.74];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

cutText ["Eye of the Tiger","PLAIN",6];
sleep 10;

;comment "18:40:38";
_camera camPrepareTarget [54979.23,93190.17,-66.15];
_camera camPreparePos [5435.81,6325.23,4.51];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

sleep 20;

;comment "18:40:59";
_camera camPrepareTarget [4507.60,106513.40,-76.22];
_camera camPreparePos [5573.40,6527.30,3.22];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

sleep 20;

;comment "18:41:15";
_camera camPrepareTarget [-57395.20,84301.52,-89.81];
_camera camPreparePos [5568.44,6612.53,4.55];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;
cutText ["Ich bedanke mich für alle die mitgespielt haben.","PLAIN",2];
sleep 20;

;comment "18:41:43";
_camera camPrepareTarget [48605.91,94729.88,19824.83];
_camera camPreparePos [5456.40,6736.58,2.68];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

sleep 20;

;comment "18:42:02";
_camera camPrepareTarget [3153.38,106464.20,-8304.65];
_camera camPreparePos [5518.91,6828.98,8.58];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;
cutText ["Und auch allen Leute die mitgeholfen sie zu scripten.","PLAIN",2];
sleep 20;

;comment "18:42:16";
_camera camPrepareTarget [43794.81,98962.12,-8265.01];
_camera camPreparePos [5520.74,6967.88,9.63];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

sleep 20;

;comment "18:42:50";
_camera camPrepareTarget [99943.76,40962.27,2013.64];
_camera camPreparePos [5773.30,7381.98,5.60];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

sleep 20;

;comment "18:43:14";
_camera camPrepareTarget [7086.61,107395.08,1953.19];
_camera camPreparePos [5992.63,7422.58,3.03];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

sleep 20;

;comment "18:43:29";
_camera camPrepareTarget [-61174.22,81535.38,1995.01];
_camera camPreparePos [5907.57,7542.77,9.75];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;

sleep 20;

;comment "18:43:51";
_camera camPrepareTarget [4743.78,107744.47,2022.21];
_camera camPreparePos [5789.04,7772.30,6.68];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;
cutText ["Also dann ab in die Nachbesprechung.","PLAIN",2];
sleep 20;

;comment "18:44:08";
_camera camPrepareTarget [-15985.95,105498.96,2005.04];
_camera camPreparePos [5790.03,8000.42,12.18];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;
cutText ["Euer Missionsbauer.","PLAIN",2];
sleep 20;

;comment "18:44:31";
_camera camPrepareTarget [-30399.25,96167.40,-30208.98];
_camera camPreparePos [5790.69,7997.33,146.98];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;
cutText ["Florian","PLAIN",2];
sleep 25;

titleCut ["","Black Out",6];
titleCut ["","BLACK IN",6];
Player cameraEffect ["terminate","back"];
camDestroy _camera;
