#!/bin/bash
#!/bin/bash

tput clear
 
tput setb 3
tput cup 9 36

tput bold
echo "VIT"
tput sgr0
tput cup 10 32
tput smul
tput bold
tput setaf 4
echo "Vidyalankar" 
tput cup 11 25
echo "Institute of Technology"
tput sgr0

tput setaf 3
tput bold;
tput cup 15 31
echo -e "\e[3mBe Sure With  \e[0m"

tput cup 16 35
tput setaf 3
tput bold;
echo -e "\e[3mVidyalankar.....\e[0m"

tput sgr0
tput cup 30 54
read -p "Enter to continue:" d

tput clear
tput sgr0
tput rc

tput cup 3 36

tput bold;
echo "VIT"
tput sgr0
tput cup 5 32
tput smul;
tput bold;
tput setaf 4
echo "Vidyalankar" 
tput cup 6 25
echo "Institute of Technology"
tput sgr0

tput cup 9 28
echo "1. Management"
	 	
tput cup 10 28
echo "2. VIT in Pictures"
	
tput bold
tput cup 11 28
read -p "Enter your choice [1-2] " choice

case $choice in
1)

	while true
	do

	# clear the screen
	tput clear
	 
	# Move cursor to screen location X,Y (top left is 0,0)
	tput cup 5 30
	 
	# Set a foreground colour using ANSI escape
	tput setaf 3
	echo "College Management"
	tput sgr0
	 
	tput cup 7 30
	# Set reverse video mode
	tput rev
	echo "M A I N - M E N U"
	tput sgr0
	 
	tput cup 9 28
	echo "1. Student Management"
	 
	tput cup 10 28
	echo "2. Event Management"
	 
	tput cup 11 28
	echo "3. Result Management"
	 
	tput cup 12 28
	echo "4. Library Management"
	 
	tput cup 13 28
	echo "5. Admission Management"

	tput cup 14 28
	echo "6. Canteen Management"

	tput cup 15 28
	echo "7. Exit"

	# Set bold mode
	tput bold
	tput cup 16 28
	read -p "Enter your choice [1-7] " choice


	 
	tput clear
	tput sgr0
	tput rc

	case $choice in  
	1)
	 
	# clear the screen
	tput clear
	 
	# Move cursor to screen location X,Y (top left is 0,0)
	tput cup 5 30
	 
	# Set a foreground colour using ANSI escape
	tput setaf 3
	echo "Student Management"
	tput sgr0
	 
	tput cup 7 30
	# Set reverse video mode
	tput rev
	echo "M A I N - M E N U"
	tput sgr0
	 
	tput cup 9 28
	echo "1. Create Student Database"

	tput cup 10 28
	echo "2. View Student Database"
	 
	tput cup 11 28
	echo "3. Add Student Record"
	 
	tput cup 12 28
	echo "4. Delete Student Record"
	 
	tput cup 13 28
	echo "5. Modify Student Record"

	tput cup 14 28
	echo "6. Back to Main Menu"
	 
	# Set bold mode
	tput bold
	tput cup 15 28

	read -p "Enter your choice [1-6] " choice
	tput clear
	tput sgr0
	tput rc
		case $choice in
		1)
		zenity --forms --title="Student Registration" \
		--text="Enter the details in proper format" \
		--separator=" " \
		--add-entry="Rollno"  \
		--add-entry="First Name"  \
		--add-entry="Last Name"   \
		--add-calendar="Birthday"   \
		--add-entry="Email"  \
		--add-entry="Mobile no."  \
		--add-entry="Address"   \
		--add-entry="Father's Name"   \
		--add-entry="Mother's Name"   \
		--add-entry="Category" >> add.csv
	
	  	zenity --notification\
	    	--window-icon="info" \
	    	--text="Student Data Added successfully"

		rm temp.csv
		rm addr.csv   
		sort -k1 -n -t, add.csv >> temp.csv
		cp temp.csv addr.csv
		;;
	
		2)
		libreoffice addr.csv
		;;
	
		3)
		zenity --forms --title="Student Registration" \
		--text="Enter the details in proper format" \
		--separator=" " \
		--add-entry="Rollno"  \
		--add-entry="First Name"  \
		--add-entry="Last Name"   \
		--add-calendar="Birthday"   \
		--add-entry="Email"  \
		--add-entry="Mobile no."  \
		--add-entry="Address"   \
		--add-entry="Father's Name"   \
		--add-entry="Mother's Name"   \
		--add-entry="Category" >> add.csv
	
	  	zenity --notification\
	    	--window-icon="info" \
	    	--text="Student Data Added Successfully"

		rm temp.csv
		rm addr.csv   
		sort -k1 -n -t, add.csv >> temp.csv
		cp temp.csv addr.csv
		;;
	
		4)
		rn=$( zenity --entry \
		    --title="Deletion of Student Record" \
		    --text="Enter roll no of student:" )
	
	       grep ^$rn addr.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found"
	    
	       else  
	       rm tmp.csv
	       rm add.csv
	       grep -v ^$rn addr.csv >> tmp.csv
	       cp tmp.csv add.csv
	       rm addr.csv
	       cp add.csv addr.csv
	       zenity --notification\
	   	--window-icon="info" \
	    	--text="Deletion Successful"  
	       fi
	       ;;
	    	
	    	5)
	    	rn=$( zenity --entry \
		    --title="Deletion of Student Record" \
		    --text="Enter roll no of student:" )
	
	
	       grep ^$rn addr.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found"
	    	
	    	else
	    	rm tmp.csv
	        rm add.csv
	        grep -v ^$rn addr.csv >> tmp.csv
	        cp tmp.csv add.csv
	        rm addr.csv
	        cp add.csv addr.csv
	  
	    	zenity --forms --title="Student Details Modification" \
		--text="Enter the details in proper format" \
		--separator=" " \
		--add-entry="Rollno"  \
		--add-entry="First Name"  \
		--add-entry="Last Name"   \
		--add-calendar="Birthday"   \
		--add-entry="Email"  \
		--add-entry="Mobile no."  \
		--add-entry="Address"   \
		--add-entry="Father's Name"   \
		--add-entry="Mother's Name"   \
		--add-entry="Category" >> add.csv
	
	  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Student Data Modified successfully"

		rm temp.csv
		rm addr.csv   
		sort -k1 -n -t, add.csv >> temp.csv
		cp temp.csv addr.csv
	    	
	   	fi
		;;
		6)

		;;
	   	esac

	;;

	2)
	 
	# clear the screen
	tput clear
	 
	# Move cursor to screen location X,Y (top left is 0,0)
	tput cup 5 30
	 
	# Set a foreground colour using ANSI escape
	tput setaf 3
	echo "Event Management"
	tput sgr0
	 
	tput cup 7 30
	# Set reverse video mode
	tput rev
	echo "M A I N - M E N U"
	tput sgr0
	 
	tput cup 9 28
	echo "1. View details for the events"
	 
	tput cup 10 28
	echo "2. Register for an event"

	tput cup 11 28
	echo "3. View Registered Students"
	 
	tput cup 12 28
	echo "4. Delete a Record"
	 
	tput cup 13 28
	echo "5. Modify a Record"

	tput cup 14 28
	echo "6. Back to Main Menu"
	 
	# Set bold mode
	tput bold
	tput cup 15 28

	read -p "Enter your choice [1-6] " choice
	tput clear
	tput sgr0
	tput rc
		case $choice in
		1)
		FILE=`dirname $0`/events.txt
		zenity --text-info \
	       	--title="Event Details" \
	       	--filename=$FILE \
		;;
		2)
		zenity --forms --title="Event Registration" \
		--text="Enter details" \
		--separator=" " \
		--add-entry="Rollno"  \
		--add-entry="Name"  \
		--add-entry="Branch"  \
		--add-entry="Division"   \
		--add-entry="Event Name" \
		--add-entry="Money to be Paid"  \
		--add-entry="Mobile No">> add1.csv
	        rm event.csv
	        cp add1.csv event.csv
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Your Registration Successfully Recorded"
		;;
	
		3)
		libreoffice event.csv
		;;
	
		4)
		rn=$( zenity --entry \
		    --title="Deletion of Student Record" \
		    --text="Enter roll no of student:" )
	
	       grep ^$rn event.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found"
	    
	       else  
	       rm tmp.csv
	       rm add1.csv
	       grep -v ^$rn event.csv >> tmp.csv
	       cp tmp.csv add1.csv
	       rm event.csv
	       cp add1.csv event.csv
	       zenity --notification\
	   	--window-icon="info" \
	    	--text="Deletion Successful"  
	       fi
		;;
	
		5)
		rn=$( zenity --entry \
		    --title="Modification of Event Record" \
		    --text="Enter roll no of student:" )
	
	
	       grep ^$rn event.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found"
	    	
	    	else
	    	rm tmp.csv
	        rm add1.csv
	        grep -v ^$rn event.csv >> tmp.csv
	        cp tmp.csv add1.csv
	        rm event.csv
	        cp add1.csv event.csv
	  
	        zenity --forms --title="Event Registration" \
		--text="Enter details" \
		--separator=" " \
		--add-entry="Rollno"  \
		--add-entry="Name"  \
		--add-entry="Branch"  \
		--add-entry="Division"   \
		--add-entry="Event Name" \
		--add-entry="Money to be Paid"  \
		--add-entry="Mobile No">> add1.csv
	

	    	rm event.csv
	        add1.csv >> event.csv
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Your Registration Successfully Recorded"
	   	fi
		;;
	
		6)

		;;
		esac
	;;

	3)
	# clear the screen
	tput clear
	 
	# Move cursor to screen location X,Y (top left is 0,0)
	tput cup 5 30
	 
	# Set a foreground colour using ANSI escape
	tput setaf 3
	echo "Result Management"
	tput sgr0
	 
	tput cup 7 30
	# Set reverse video mode
	tput rev
	echo "M A I N - M E N U"
	tput sgr0
	 
	tput cup 9 28
	echo "1. Create Result Database"

	tput cup 10 28
	echo "2. View Result Database"
	 
	tput cup 11 28
	echo "3. Add a Record"

	tput cup 12 28
	echo "4. Delete a Record"
	 
	tput cup 13 28
	echo "5. Modify a Record"

	tput cup 14 28
	echo "6. Back to Main Menu"
	 
	# Set bold mode
	tput bold
	tput cup 15 28

	read -p "Enter your choice [1-6] " choice
	tput clear
	tput sgr0
	tput rc
		case $choice in
		1)
		zenity --forms --title="Result" \
			--text="Marks of SEM-I" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-I"  \
			--add-entry="Applied Physics-I"   \
			--add-entry="Applied Chemistry-I"  \
			--add-entry="Engineering Mechanics"  \
			--add-entry="Basics of Electronics"   \
			--add-entry="Environmental Studies"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result1.csv
		rm temp.csv    
		sort -k1 -n -t, result1.csv >> temp.csv
		rm result1.csv
	        cp temp.csv result1.csv

	

		zenity --forms --title="Result" \
			--text="Marks of SEM-II" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-II"  \
			--add-entry="Applied Physics-II"   \
			--add-entry="Applied Chemistry-II"  \
			--add-entry="Structured Progamming"  \
			--add-entry="Engineering Drawing"   \
			--add-entry="Communication Skills"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result2.csv
		rm temp.csv    
		sort -k1 -n -t, result2.csv >> temp.csv
		rm result2.csv
		cp temp.csv result2.csv

	
		zenity --forms --title="Result" \
			--text="Marks of SEM-III" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-III"  \
			--add-entry="DLDA "   \
			--add-entry="Discrete Mathematics"  \
			--add-entry="ECCF"  \
			--add-entry="Data Structures"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result3.csv
		rm temp.csv    
		sort -k1 -n -t, result3.csv >> temp.csv
		rm result3.csv
		cp temp.csv result3.csv

	

		zenity --forms --title="Result" \
			--text="Marks of SEM-IV" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-IV"  \
			--add-entry="Analysis Of Algorithms"   \
			--add-entry="Computer Architecture"  \
			--add-entry="Operating Systems"  \
			--add-entry="Computer Graphics"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result4.csv
		rm temp.csv    
		sort -k1 -n -t, result4.csv >> temp.csv
		rm result4.csv
	         cp temp.csv result4.csv
	
	  	zenity --notification\
		    	--window-icon="info" \
		    	--text="Result of Student Added Successfully"
		;;
	
		2)
		libreoffice result1.csv
		
	       	libreoffice result2.csv
		
	       	libreoffice result3.csv
		
	       	libreoffice result4.csv
		;;
	
		3)
		zenity --forms --title="Result" \
			--text="Marks of SEM-I" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-I"  \
			--add-entry="Applied Physics-I"   \
			--add-entry="Applied Chemistry-I"  \
			--add-entry="Engineering Mechanics"  \
			--add-entry="Basics of Electronics"   \
			--add-entry="Environmental Studies"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result1.csv
		rm temp.csv    
		sort -k1 -n -t, result1.csv >> temp.csv
		rm result1.csv
		cp temp.csv result1.csv	

	

		zenity --forms --title="Result" \
			--text="Marks of SEM-II" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-II"  \
			--add-entry="Applied Physics-II"   \
			--add-entry="Applied Chemistry-II"  \
			--add-entry="Structured Progamming"  \
			--add-entry="Engineering Drawing"   \
			--add-entry="Communication Skills"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result2.csv
		rm temp.csv    
		sort -k1 -n -t, result2.csv >> temp.csv
		rm result2.csv
		cp temp.csv result2.csv	

	

		zenity --forms --title="Result" \
			--text="Marks of SEM-III" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-III"  \
			--add-entry="DLDA "   \
			--add-entry="Discrete Mathematics"  \
			--add-entry="ECCF"  \
			--add-entry="Data Structures"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result3.csv
		rm temp.csv    
		sort -k1 -n -t, result3.csv >> temp.csv
		rm result3.csv
		cp temp.csv result3.csv

	
		zenity --forms --title="Result" \
			--text="Marks of SEM-IV" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-IV"  \
			--add-entry="Analysis Of Algorithms"   \
			--add-entry="Computer Architecture"  \
			--add-entry="Operating Systems"  \
			--add-entry="Computer Graphics"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result4.csv
		rm temp.csv    
		sort -k1 -n -t, result4.csv >> temp.csv
		rm result4.csv
		cp temp.csv result4.csv
	
	  	zenity --notification\
		    	--window-icon="info" \
		    	--text="Result of Student Added Successfully"
		;;
	
		4)
		rn=$( zenity --entry \
		    --title="Deletion of result of student" \
		    --text="Enter roll no of student:" )
	
	       grep ^$rn result1.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found"
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn result1.csv >> tmp.csv
	       rm result1.csv
	       cp tmp.csv result1.csv
	       zenity --notification\
	   	--window-icon="info" \
	    	--text="Deletion of result in semester 1 successful"  
	        fi
	        grep ^$rn result2.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found"
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn result2.csv >> tmp.csv
	       rm result2.csv
	       cp tmp.csv result2.csv
	        zenity --notification\
	   	--window-icon="info" \
	    	--text="Deletion of result in semester 2 successful"  
	        fi
	        
	       grep ^$rn result3.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found"
	    
	       else  
	        rm tmp.csv
	       grep -v ^$rn result3.csv >> tmp.csv
	       rm result1.csv
	       cp tmp.csv result3.csv
	       zenity --notification\
	   	--window-icon="info" \
	    	--text="Deletion of result in semester 3 successful"  
	    	 fi
	      
	       grep ^$rn result4.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found"
	    
	       else  
	        rm tmp.csv
	       grep -v ^$rn result4.csv >> tmp.csv
	       rm result1.csv
	       cp tmp.csv result4.csv
	       zenity --notification\
	   	--window-icon="info" \
	    	--text="Deletion of result in semester 4 successful"  
	    	fi
		;;
	
		5)
		rn=$( zenity --entry \
		    --title="Modification of Result ofstudent" \
		    --text="Enter roll no of student:" )
	
	
	         grep ^$rn result1.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found in semester 1 result"
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn result1.csv >> tmp.csv
	       rm result1.csv
	       cp tmp.csv result1.csv
	      
	        
	         zenity --forms --title="Result" \
			--text="Marks of SEM-I" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-I"  \
			--add-entry="Applied Physics-I"   \
			--add-entry="Applied Chemistry-I"  \
			--add-entry="Engineering Mechanics"  \
			--add-entry="Basics of Electronics"   \
			--add-entry="Environmental Studies"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result1.csv
		rm temp.csv    
		sort -k1 -n -t, result1.csv >> temp.csv
		rm result1.csv
	        cp temp.csv result1.csv	

		zenity --notification\
		    	--window-icon="info" \
		    	--text="Result of Student Modified Successfully"
		fi
	
		  grep ^$rn result2.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found in Semester 2"
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn result2.csv >> tmp.csv
	       rm result2.csv
	       cp tmp.csv result2.csv
	       

		zenity --forms --title="Result" \
			--text="Marks of SEM-II" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-II"  \
			--add-entry="Applied Physics-II"   \
			--add-entry="Applied Chemistry-II"  \
			--add-entry="Structured Progamming"  \
			--add-entry="Engineering Drawing"   \
			--add-entry="Communication Skills"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result2.csv
		rm temp.csv    
		sort -k1 -n -t, result2.csv >> temp.csv
		rm result2.csv
		cp temp.csv result2.csv

	
		fi
		    	
		  grep ^$rn result3.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found in Semester 3"
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn result3.csv >> tmp.csv
	       rm result3.csv
	       cp tmp.csv result3.csv
	      
		zenity --forms --title="Result" \
			--text="Marks of SEM-III" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-III"  \
			--add-entry="DLDA "   \
			--add-entry="Discrete Mathematics"  \
			--add-entry="ECCF"  \
			--add-entry="Data Structures"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result3.csv
		rm temp.csv    
		sort -k1 -n -t, result3.csv >> temp.csv
		rm result3.csv
		cp temp.csv result3.csv

	
		fi
		    	
		  grep ^$rn result4.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found in Semester 4 Result"
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn result4.csv >> tmp.csv
	       rm result4.csv
	       cp tmp.csv result4.csv
	      
		zenity --forms --title="Result" \
			--text="Marks of SEM-IV" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Branch"  \
			--add-entry="Applied Mathematics-IV"  \
			--add-entry="Analysis Of Algorithms"   \
			--add-entry="Computer Architecture"  \
			--add-entry="Operating Systems"  \
			--add-entry="Computer Graphics"   \
			--add-entry="SGPA"   \
			--add-entry="CGPA">> result4.csv
		rm temp.csv    
		sort -k1 -n -t, result4.csv >> temp.csv
		rm result4.csv
		cp temp.csv result4.csv
	
	  	zenity --notification\
		    	--window-icon="info" \
		    	--text="Result of Student Modified Successfully"
	   	fi
	   	;;
	   	
	   	6)
	   
		;;
	
		esac
	;;	

	4)
	# clear the screen
	tput clear
	 
	# Move cursor to screen location X,Y (top left is 0,0)
	tput cup 5 30
	 
	# Set a foreground colour using ANSI escape
	tput setaf 3
	echo "Library Management"
	tput sgr0
	 
	tput cup 7 30
	# Set reverse video mode
	tput rev
	echo "M A I N - M E N U"
	tput sgr0
	 
	tput cup 9 28
	echo "1. Issue a Book"

	tput cup 10 28
	echo "2. Avaliable Books list"

	tput cup 11 28
	echo "3. View Library Record"

	tput cup 12 28
	echo "4. Returning a Book"
	 
	tput cup 13 28
	echo "5. Delete a Record"
	 
	tput cup 14 28
	echo "6. Modify a Record"

	tput cup 15 28
	echo "7. Back to Main Menu"
	 
	# Set bold mode
	tput bold
	tput cup 16 28

	read -p "Enter your choice [1-7] " choice
	tput clear
	tput sgr0
	tput rc
		case $choice in
		1)
		zenity --forms --title="Library Records" \
		--text="For issuing a book" \
		--separator=" " \
		--add-entry="Rollno"  \
		--add-entry="Name"  \
		--add-entry="Branch"  \
		--add-entry="Semester"   \
		--add-entry="Book Name" \
		--add-entry="Author's Name"  \
		--add-entry="Issuing Date"  \
		--add-entry="Returning Date"   \
		--add-entry="Mobile No">> library1.csv

		zenity --notification\
	    	--window-icon="info" \
	    	--text="Record Added Successfully"
		;;
	
		2)
		FILE=`dirname $0`/bookslist.txt
		zenity --text-info \
	       	--title="List of Books" \
	       	--filename=$FILE \
		;;
	
		3)
		libreoffice library1.csv
		;;
	
		4)
		zenity --forms --title="Library Records" \
			--text="For returning a book" \
			--separator=" " \
			--add-entry="Rollno"  \
			--add-entry="Name"  \
			--add-entry="Branch"  \
			--add-entry="Semester"   \
			--add-entry="Book Name" \
			--add-entry="Author's Name"  \
			--add-entry="Issued Date"  \
			--add-entry="Returning Date"   \
			--add-entry="Mobile No">> library2.csv

			zenity --notification\
		    	--window-icon="info" \
		    	--text="Record Added Successfully"
		;;
	
		5)
		rn=$( zenity --entry \
		    --title="Deletion of record" \
		    --text="Enter roll no of student:" )
	
	       grep ^$rn library1.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found in issue record"
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn library1.csv >> tmp.csv
	       rm library1.csv
	       cp tmp.csv library1.csv
	       zenity --notification\
	   	--window-icon="info" \
	    	--text="Issue record successfully deleted"  
	        fi
	       
	
	       grep ^$rn library2.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \4
	    	--text="Roll number not found in returning record"
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn library2.csv >> tmp.csv
	       rm result1.csv
	       cp tmp.csv library2.csv
	       zenity --notification\
	   	--window-icon="info" \
	    	--text="Returning record deleted sucessfully"  
	        fi
		;;
	
		6)
		rn=$( zenity --entry \
		    --title="Deletion of record" \
		    --text="Enter roll no of student:" )
	
	       grep ^$rn library1.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Roll number not found in issue record"
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn library1.csv >> tmp.csv
	       rm library1.csv
	       cp tmp.csv library1.csv 
	        
	        zenity --forms --title="Library Records" \
		--text="For issuing a book" \
		--separator=" " \
		--add-entry="Rollno"  \
		--add-entry="Name"  \
		--add-entry="Branch"  \
		--add-entry="Semester"   \
		--add-entry="Book Name" \
		--add-entry="Author's Name"  \
		--add-entry="Issuing Date"  \
		--add-entry="Returning Date"   \
		--add-entry="Mobile No">> library1.csv

		zenity --notification\
	    	--window-icon="info" \
	    	--text="Issue Record Modified Successfully"
	        fi
		;;
	
		7)
		;;
		esac
	;;

	5)
	# clear the screen
	tput clear
	 
	# Move cursor to screen location X,Y (top left is 0,0)
	tput cup 5 30
	 
	# Set a foreground colour using ANSI escape
	tput setaf 3
	echo "Admission Management"
	tput sgr0
	 
	tput cup 7 30
	# Set reverse video mode
	tput rev
	echo "M A I N - M E N U"
	tput sgr0
	 
	tput cup 9 28
	echo "1. Create Admission Database"

	tput cup 10 28
	echo "2. View Admission Database"

	tput cup 11 28
	echo "3. Add a Record"
	 
	tput cup 12 28
	echo "4. Delete a Record"
	 
	tput cup 13 28
	echo "5. Modify a Record"

	tput cup 14 28
	echo "6. Back"
	 
	# Set bold mode
	tput bold
	tput cup 15 28

	read -p "Enter your choice [1-6] " choice
	tput clear
	tput sgr0
	tput rc
		case $choice in
		1)
		zenity --forms --title="Admission Progress" \
		--text="Enter details" \
		--separator=" " \
		--add-entry="First Name"  \
		--add-entry="Last Name"  \
		--add-entry="Year of Admission"  \
		--add-entry="Email"  \
		--add-entry="Mobile No"   \
		--add-entry="Address"  \
		--add-entry="School Name"  \
		--add-entry="10th Percentage"   \
		--add-entry="College Name"   \
		--add-entry="12th Percentage"   \
		--add-entry="MHT-CET Score"  \
		--add-entry="Category">> admission.csv

		zenity --notification\
	    	--window-icon="info" \
	    	--text="Admission Database Created Successfully"
		;;
	
		2)
		libreoffice admission.csv
		;;
	
	
		3)
		zenity --forms --title="Admission Progress 2016-17" \
		--text="Enter details" \
		--separator=" " \
		--add-entry="First Name"  \
		--add-entry="Last Name"  \
		--add-entry="Email"  \
		--add-entry="Mobile No"   \
		--add-entry="Address"  \
		--add-entry="School Name"  \
		--add-entry="10th Percentage"   \
		--add-entry="College Name"   \
		--add-entry="12th Percentage"   \
		--add-entry="MHT-CET Score"  \
		--add-entry="Category">> admission.csv

		zenity --notification\
	    	--window-icon="info" \
	    	--text="Record Added Successfully"
		;;
	
		4)
		rn=$( zenity --entry \
		    --title="Deletion of record" \
		    --text="Enter name:" )
	
	       grep ^$rn admission.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Name not found "
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn admission.csv >> tmp.csv
	       rm admission.csv
	       cp tmp.csv admission.csv
	       zenity --notification\
	   	--window-icon="info" \
	    	--text="Record successfully deleted"  
	        fi
		;;
	
		5)
		rn=$( zenity --entry \
		    --title="Deletion of record" \
		    --text="Enter name of student:" )
	
	       grep ^$rn admission.csv
	       echo $?
	       if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="Name not found "
	    
	       else  
	       rm tmp.csv
	       grep -v ^$rn admission.csv >> tmp.csv
	       rm admission.csv
	       cp tmp.csv admission.csv
	       zenity --forms --title="Admission Progress" \
		--text="Enter details" \
		--separator=" " \
		--add-entry="First Name"  \
		--add-entry="Last Name"  \
		--add-entry="Year of Admission"  \
		--add-entry="Email"  \
		--add-entry="Mobile No"   \
		--add-entry="Address"  \
		--add-entry="School Name"  \
		--add-entry="10th Percentage"   \
		--add-entry="College Name"   \
		--add-entry="12th Percentage"   \
		--add-entry="MHT-CET Score"  \
		--add-entry="Category">> admission.csv

		zenity --notification\
	    	--window-icon="info" \
	    	--text="Admission Database Modified Successfully"
	    	fi
		;;
	
		6)
	
		;;
		esac
	;;


	
	6)
	# clear the screen
	tput clear
	 
	# Move cursor to screen location X,Y (top left is 0,0)
	tput cup 5 30
	 
	# Set a foreground colour using ANSI escape
	tput setaf 3
	echo "Canteen Management"
	tput sgr0
	 
	tput cup 7 30
	# Set reverse video mode
	tput rev
	echo "M A I N - M E N U"
	tput sgr0
	 
	tput cup 9 28
	echo "1. Display Menu Card"

	tput cup 10 28
	echo "2. Order a Dish"

	tput cup 11 28
	echo "3. Order a Beverage"

	tput cup 12 28
	echo "4. View Ordered Menu"

	tput cup 13 28
	echo "5. Cancel an order "

	tput cup 14 28
	echo "6. Back to Main Menu"

	 
	# Set bold mode
	tput bold
	tput cup 15 28

	read -p "Enter your choice [1-5] " choice
	tput clear
	tput sgr0
	tput rc
		case $choice in
		1)
	        	FILE=`dirname $0`/menu.txt
		zenity --text-info \
	       	--title="Menu" \
	       	--filename=$FILE \
		;;
	
	
		2)
		zenity --forms --title="Canteen" \
		--text="Enter a dish" \
		--separator=" " \
		--add-entry="Rollno"  \
		--add-entry="Name"  \
		--add-entry="Branch"  \
		--add-entry="Dish Name"   \
		--add-entry="Quantity"  \
		--add-entry="Money to be Paid">> canteend.csv

		zenity --notification\
	    	--window-icon="info" \
	    	--text="Your Menu is Successfully Accepted"

		;;
	
		3)
		zenity --forms --title="Canteen" \
		--text="Enter a beverage" \
		--separator=" " \
		--add-entry="Rollno"  \
		--add-entry="Name"  \
		--add-entry="Branch"  \
		--add-entry="Beverage Name"   \
		--add-entry="Quantity"  \
		--add-entry="Money to be Paid">> canteenb.csv

		zenity --notification\
	    	--window-icon="info" \
	    	--text="Your Menu is Successfully Accepted"

		;;
	
		4)
	        	libreoffice canteend.csv
	        	
		libreoffice canteenb.csv
		;;
	
		5)
	        rn=$( zenity --entry \
		    --title="Cancellation of dish" \
		    --text="Enter roll no of student:" )
	
	        grep ^$rn canteend.csv
	        echo $?
	        if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="No dish found of Roll number "
	    
	        else  
	        rm tmp.csv
	        grep -v ^$rn canteend.csv >> tmp.csv
	        rm canteend.csv
	        cp tmp.csv canteend.csv
	        zenity --notification\
	    	--window-icon="info" \
	    	--text="Dishes cancelled successfully"
	        fi
	        grep ^$rn canteenb.csv
	        echo $?
	        if [ $? -ne 0 ]; then  
		zenity --notification\
	    	--window-icon="info" \
	    	--text="No beverages found on Roll no"
	    
	        else  
	        rm tmp.csv
	        grep -v ^$rn canteenb.csv >> tmp.csv
	        rm canteenb.csv
	        cp tmp.csv canteenb.csv
	        zenity --notification\
	    	--window-icon="info" \
	    	--text="Cancellation of Beverages is Successful"
	        fi
	        ;;
	
	        6)
	
	        ;;
	        esac
	;;

	7)
	tput clear
	tput cup 8 28
	tput setaf 4
	echo "THANK YOU"
	sleep 5
	tput clear
	exit
	;;
	esac
	done
;;

2)
eog a.JPG
;;
esac
