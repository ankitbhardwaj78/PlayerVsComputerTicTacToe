puts "ENTER THE SIZE OF THE SQUARE"
a=gets
b= Array.new(a.to_i){Array.new(a.to_i)}

for i in 0...(a.to_i)
	for j in 0...(a.to_i)
		b[i][j]=" "
	end
end







def printBoard b , a ,check
	for i in 0...(a.to_i)
		for j in 0...(a.to_i)
			print b[i][j].to_s+"|"
		end
		puts "\n"
		for j in 0...(a.to_i)
			print "--"
		end
		puts "\n"
	end
	return !check
end






count=printBoard b , a , false





def chk b , a
	for i in 0...(a.to_i)
		for j in 0...(a.to_i)
			if b[j][i].to_s.eql?(" ")
				return true
			end
		end
	end
	return false
end






def win b , c , a	
	for i in 0...(a.to_i)
		flag=true
		for j in 0...(a.to_i)
			if b[i][j].to_s.eql?(" ") || b[i][j].to_s.eql?(c)==false
				flag=false
				break;
			end
		end
		if flag
			return false
		end
	end


	for i in 0...(a.to_i)
		flag=true
		for j in 0...(a.to_i)
			if b[j][i].to_s.eql?(" ")|| b[j][i].to_s.eql?(c)==false
				flag=false
			end
			if !flag
				break;
			end
		end
		if flag
			return false
		end
	end


	for i in 0...(a.to_i)
		flag=true
		for j in 0...(a.to_i)
			if (i==j)
				if b[i][j].to_s.eql?(c)==false || b[i][j].to_s.eql?(" ")
					flag=false
					break;
				end
			end
		end
		if !flag
			return true
		end
	end
	if flag
		return false
	end


	for i in 0...(a.to_i)
		flag=true
		for j in 0...(a.to_i)
			if (i+j==(a.to_i)-1)
				if b[i][j].to_s.eql?(c)==false || b[i][j].to_s.eql?(" ")
					puts i.to_s+" "+j.to_s
					flag=false
					break;
				end
			end
		end
		if !flag
			return true
		end
		if flag
			return false
		end
	end
	return true
end




def player temp ,a
	for i in 0...(a.to_i)
		for j in 0...(a.to_i)
			if temp[i][j]==" "
				temp[i][j]="0"
				#printBoard temp,a,false
				my_ans=chk1(temp,a,"0")
				#puts my_ans
				if my_ans
					temp[i][j]=" "
					return false
				else
					temp[i][j]=" "
				end
			end
		end
	end
	return true
end






def computer temp , a , b
	for i in 0...(a.to_i)
		for j in 0...(a.to_i)
			if temp[i][j]==" "
				temp[i][j]="X"
				my_result=player temp,a
				if(my_result)
					return 
				else
					temp[i][j]=" "
				end
			end
		end
	end
end






def chk1 temp,a,c


	
	flag=true
	checker=true
	count=0
	for i in 0...(a.to_i)
		flag=true
		checker=true
		for j in 0...(a.to_i)
			if temp[i][j].to_s.eql?(" ")
				if(flag)
					flag=false
				else 
					checker=false
					break
				end
			elsif temp[i][j].to_s.eql?(c)==false
				checker=false
				break
			end
		end
		if checker
			count=count+1
		end
	end
	flag=true
	
	
#puts count

checker=true


for i in 0...(a.to_i)
	flag=true
	checker=true
	for j in 0...(a.to_i)
		if temp[j][i].to_s.eql?(" ")
			if(flag)
				flag=false
			else 
				checker=false
			end
		elsif temp[j][i].to_s.eql?(c)==false
			checker=false
			break
		end
	end
	if checker
		count=count+1
	end
end
flag=true



#puts count
checker=true

for i in 0...(a.to_i)
	for j in 0...(a.to_i)
		if (i==j)
			if temp[i][j].to_s.eql?(" ")
				if(flag)
					flag=false
				else 
					checker=false
				end
			elsif temp[i][j].to_s.eql?(c)==false
				checker=false
				break
			end
		end
	end
end
flag=true
if checker
	count=count+1
end


checker=true

for i in 0...(a.to_i)
	for j in 0...(a.to_i)
		if (i+j==(a.to_i)-1)
			if temp[i][j].to_s.eql?(" ")
				if(flag)
					flag=false
				else 
					checker=false
				end
			elsif temp[i][j].to_s.eql?(c)==false
				checker=false
				break
			end
		end
	end
end
if checker 
	count=count+1
end


if (count>=2)
	return true
else
	return false
end

end





def selfplay temp,a,b,c,countx

	for i in 0...(a.to_i)
		checker=true
		for j in 0...(a.to_i)
			if temp[i][j].to_s.eql?(" ")
				flag=true

			elsif temp[i][j].to_s.eql?(c)==false
				checker=false
			end
		end
		if(checker)
			for j in 0...(a.to_i)
				if temp[i][j].to_s.eql?(" ")
					temp[i][j]="X"
					countx=countx+1
					return
				end
			end
			
		end
	end

	for i in 0...(a.to_i)
		checker=true
		for j in 0...(a.to_i)
			if temp[i][j].to_s.eql?(" ")
				flag=true
			elsif temp[j][i].to_s.eql?(c)==false
				checker=false
			end
		end
		if(checker)
			for j in 0...(a.to_i)
				if temp[j][i].to_s.eql?(" ")
					temp[j][i]="X"
					countx=countx+1
					return
				end
			end
			
		end


	end

end




def countmoves temp ,a
	count=0

	for i in 0...(a.to_i)
		for j in 0...(a.to_i)
			if temp[j][i].to_s.eql?("X")
				count=count+1
			end
		end
	end
	return count




end






def onemove temp,a ,c



	flag=true
	checker=true
	count=0
	for i in 0...(a.to_i)
		flag=true
		checker=true
		for j in 0...(a.to_i)
			if temp[i][j].to_s.eql?(" ")
				if(flag)
					count=i
					flag=false
				else 
					checker=false
					break
				end
			elsif temp[i][j].to_s.eql?(c)==false
				checker=false
				break
			end
		end
		if checker
			for k in 0...(a.to_i)
				if temp[count][k].to_s.eql?(" ")
					temp[count][k]="X"
					break
				end
			end
			return true
		end
	end
	flag=true
	checker=true


	for i in 0...(a.to_i)
		flag=true
		checker=true
		for j in 0...(a.to_i)
			if temp[j][i].to_s.eql?(" ")
				if(flag)
					count=i;
					flag=false
				else 
					checker=false
				end
			elsif temp[j][i].to_s.eql?(c)==false
				checker=false
				break
			end
		end
		if checker
			for k in 0...(a.to_i)
				if temp[k][count].to_s.eql?(" ")
					temp[k][count]="X"
					break
				end
			end
			return true
		end
	end
	flag=true
	
	


	checker=true

	for i in 0...(a.to_i)
		for j in 0...(a.to_i)
			if (i==j)
				if temp[i][j].to_s.eql?(" ")
					if(flag)
						flag=false
					else 
						checker=false
					end
				elsif temp[i][j].to_s.eql?(c)==false
					checker=false
					break
				end
			end
		end
	end
	flag=true
	if checker
		for i in 0...(a.to_i)
			for j in 0...(a.to_i)
				if (i==j)
					if temp[i][j].to_s.eql?(" ")

						temp[i][j]="X"
					end
				end
			end
		end
		return true
	end


	checker=true

	for i in 0...(a.to_i)
		for j in 0...(a.to_i)
			if (i+j==(a.to_i)-1)
				if temp[i][j].to_s.eql?(" ")
					if(flag)
						flag=false
					else 
						checker=false
					end
				elsif temp[i][j].to_s.eql?(c)==false
					checker=false
					break
				end
			end
		end
	end
	if checker
		for i in 0...(a.to_i)
			for j in 0...(a.to_i)
				if (i+j==(a.to_i)-1)
					if temp[i][j].to_s.eql?(" ")

						temp[i][j]="X"
					end
				end
			end
		end
		return true
	end
	return false
end



countx=0
my_bool=true
first=true
while my_bool

	if count
		puts "\n"
		puts "1... player turn"
		d=gets
		e=gets
		if (d.to_i)>=(a.to_i) || (e.to_i)>=(a.to_i)
			puts "Wrong choice"
		elsif b[d.to_i][e.to_i]!=" "
			puts "Wrong choice"
		else 
			b[d.to_i][e.to_i]="0"
			count=printBoard(b,a,count)
			my_bool=win(b,"0",a)
			if !my_bool
				puts "1 win"
				break
			end
			my_bool=chk(b,a)
			if !my_bool
				puts "draw"
				break
			end
		end
	else 
		puts "\n"
		puts "2... player turn"
		temp=b;
		if first
			if b[1][1]==" "
				b[1][1]="X"
				count=printBoard(b,a,count)
				countx=countx+1
			end
			first=false
		else
			result=onemove temp,a,"X"
			#puts result
			if(!result)
				result=onemove temp,a,"0"
				if(!result)
				beforeplay=countx
				computer temp,a,b
				countx=countmoves temp,a
				if beforeplay==countx
					selfplay temp,a,b,"X",countx
				end
			end
			end
			count=printBoard(b,a,count)
			my_bool=win(b,"X",a)
			if !my_bool
				puts "computer win"
				break
			end
			my_bool=chk(b,a)
			if !my_bool
				puts "draw"
				break
			end
		end
	end
end



