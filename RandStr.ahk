Msgbox % GenerateRandomString(8)

GenerateRandomString(length) {
	
	abc := "abcdefghijklmnopqurstuvwxyz"
	num := "0123456789"
	StringSplit, abc, abc
	StringSplit, num, num
	
	while(length)
	{
		Random, rand, 1, 26
		password .= abc%rand%
		length--
		Random, rand, 1, 10
		password .= num%rand%
		length--
	}
	return password
}