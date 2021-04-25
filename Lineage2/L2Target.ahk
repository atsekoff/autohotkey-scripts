#Include ..\Utils\Utils.ahk

Class L2Target
{


	SetTargetHealthBarPos()
	{
		MouseGetPos,mouseX,mouseY
		PixelSearch, cX, cY, mouseX-5, mouseY-5, mouseX+5, mouseY+5, healthyColor.hex, 1, Fast
		if(ErrorLevel == 0)
		{
			targetHealthPos:= new Vec2(cX,cY)
			ToolTip,% "Successfully found health bar!"
		}
		else
		{
			ToolTip,% "No health bar found"
		}
		Sleep 1000
		ToolTip
		return
	}

	IsAlive()
	{
		c := GetPixelRGB(targetHealthPos.x, targetHealthPos.y)
		if(c.Equals(healthyColor))
		{
			return 1
		}
		else if(c.Equals(unhealthyColor,5))
		{
			return 0
		}
		
		return -1
	}
}