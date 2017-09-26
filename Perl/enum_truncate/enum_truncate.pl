#!/usr/bin/perl

# globals:
use constant TRUE 	=> 1;
use constant FALSE 	=> 0;

sub enum_truncate
{
	#switch DEBUG on (1) to see all prints
	my $DEBUG = 0;
	my $fun = $ARGV[0];
	my $file = $ARGV[1];
	#open file:
	open(my $fd, $file) or die "Could not open $file: $!\n";
	
	# look for string $fun in the file (grep):
	#(\Q is for escaping any potentally problematic characters)
	my @functions = grep{/\Q$fun/} <$fd>;
	my $count = scalar @functions;
	print("$count occurences found\n");
	print @functions if ($DEBUG);
	if (@functions)
	{
		my $loop = 0;
		my @lines_to_skip;
		foreach $function (@functions)
		{
		   # COLLECT ALL OCCURANCES WITH LINE NUMBERS
		   $loop++;
		   print("$loop:");
		   #rewind to the begining of the file (has to be done
		   #beause grep moved it):
		   seek $fd, 0, 0;
		   #look for function and defines and write it to the list @lines:
		   my @lines = ();
		   #adding line number for better information
		   my $line_nr = 1;
		   my $is_enum_open = FALSE;
		   my $is_line_found = FALSE;
		   while(my $line = <$fd>) {
			print "DEBUG: processing line ".$line."\n" if ($DEBUG);
			#(\Q is for escaping any potentally problematic characters)
			if ($is_line_found == FALSE && $line =~ /\Q$function/ && !(grep $_ eq $line_nr, @lines_to_skip)) {
    			   #store line:
			   print "DEBUG: push\n" if ($DEBUG);
			   push @lines, "line ".$line_nr.": ".$line;
			   $is_line_found = TRUE;
			   #keep current function line number for further skipping and break the loop:
			   push @lines_to_skip, $line_nr;
			   print "DEBUG: $line_nr, lines to skip: @lines_to_skip\n" if ($DEBUG);
			   if ($is_enum_open == FALSE)
			   {
				#no enum is "open", we don't have to look for enum definition end (we can end here)
				print "DEBUG: no enum is open, end the loop\n" if ($DEBUG);
			   	last;
			   }
			}
			#store "typedef enum"
			if ($line =~ "\^typedef enum") {
				#push line to the list
				print "DEBUG: push\n" if ($DEBUG);
				push @lines, "line ".$line_nr.": ".$line;
				#found "typedef enum", set enum_open to true
				$is_enum_open = TRUE;
			}
			elsif ($is_enum_open == TRUE && $line =~ "\^}.*;")
			{
				if ($is_line_found == TRUE)
				{
					# enum closing bracket found, push line to the list:
					print "DEBUG: push\n" if ($DEBUG);
					push @lines, "line ".$line_nr.": ".$line;
					# enum is "closed":
					$is_enum_open = FALSE;
					# if searched line was already found, we can end here
					print "DEBUG: line already found, end the loop\n" if ($DEBUG);
					last;
				}
				else
				{
					# line not found but end of enum found - pop enum start line from the list
					my $pop_line = pop @lines;
					print "DEBUG: line \"".$pop_line."\" removed from the list\n" if ($DEBUG);
				}				
			}
			$line_nr++;
		   }
		   print "Lines after processing:\n@lines\n";
		} #foreach $function END
	}
	else
	{
		print "$fun not found in $file\n";
	}
}

#call
enum_truncate();