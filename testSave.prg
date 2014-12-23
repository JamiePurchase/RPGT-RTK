include("modelFileService.prg")

colorRGB(0,0,0)
fillRect(0,0,800,600)
setImage("Battle/Background/stage00VillageApproach01.png",0,0,800,600)
font("Times New Roman")
fontSize(16)
pixelText(50,50,"File Save / Load Test")

fileSave()

colorRGB(0,100,0)
fillRect(0,0,800,600)
wait()
windows()
