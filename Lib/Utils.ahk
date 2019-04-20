
class RGB
{
	b:=0
	g:=0
	r:=0
    hex:=0x000000

	__New(r,g,b,hex:=0x000000)
	{
		this.b:=b
		this.g:=g
		this.r:=r
        this.hex:=hex
        ;MsgBox, % "new rgb created with " r " " g " " b
	}

    Equals(other, variation:= 0)
    {
        red     := (this.r >= other.r-variation && this.r <= other.r+variation)
        green   := (this.g >= other.g-variation && this.g <= other.g+variation)
        blue    := (this.b >= other.b-variation && this.b <= other.b+variation)
        return (red && green && blue)
    }
}
HexToRGB(hexColor) 
{
	NumPut("0x" SubStr(hexColor,-5), (V:="000000"))
    rgb:=new RGB(NumGet(V,0,"UChar"), NumGet(V,1,"UChar"), NumGet(V,2,"UChar"), hexColor)
    ;MsgBox, % "HexToRGB = " rgb.r " " rgb.g " " rgb.b
    return rgb
}
GetPixelRGB(x, y)
{ 
    PixelGetColor, c, x, y
    return HexToRGB(c)
}




class Vec2
{
    x:=0
    y:=0

    __New(x,y)
    {
        this.x:=x
        this.y:=y
    }
}
