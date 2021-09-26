Msgbox % GenerateRandomString(8)

GenerateRandomString(length)
{
	abc := "abcdefghijklmnopqurstuvwxyz"
	num := "0123456789"
	abcArr := StrSplit(abc)
	numArr := StrSplit(num)
	OutputDebug, % abcArr
	while(length)
	{
		Random, rand, 1, abcArr.Length()
		password .= abcArr[rand]
		length--
		Random, rand, 1, numArr.Length()
		password .= numArr[rand]
		length--
	}
	return password
}
