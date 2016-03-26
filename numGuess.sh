
count=0
PASSWORD="1234"

GENNR=$((RANDOM %10))
if [ "$GENNR" == "0" ]; then
        GENNR=1
fi

COUNTER=0

#first timestamp variable 
START=$(date +%s)

function numGuess
{
while : 
do
echo "Choose a number between 1 and 10"
echo "Enter number: " 
read KEYNR
COUNTER=`expr $COUNTER + 1`

if [ "$KEYNR" == "$GENNR" ]; then
	echo "You guessed the number in: $COUNTER guesses"
	#second timestamp variable
	END=$(date +%s)
	#difference between second and first timestamp
	DIFF=$(( $END - $START ))
	echo "It took you $DIFF seconds to guess the number"
	exit
else 
	if [ "$KEYNR" -lt "$GENNR" ]; then
		echo "---Try a higher number!"
	
	else 
		echo "---Try a lower number!"
	fi
fi
done
}



function checkPass
{
echo "hint: 1234"
echo "Password:"
read USERPASSWORD

if [ "$USERPASSWORD" == "$PASSWORD" ]; then
	echo "You can now start playing the numGuess game!"
	numGuess
	exit
else

	date
	echo "ACCESS DENIED!"
fi
}


while : 
do
if [ $count -lt 3 ]; then
	checkPass
	count=`expr $count + 1`
else
	echo "PROCESS TERMINATED! You can't try anymore"
	exit
fi
done


