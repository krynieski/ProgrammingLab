#!/usr/bin/perl
#krystianx.potyralski@intel.com 2016
#
# SCRIPT TO CHECK WHICH PREPROCESSOR DIRECTIVES (DEFINES)
# ARE RELATED TO GIVEN FUNCTION 
# (TO SEE IN WHICH PREPROCESSOR DIRECTIVES 
# THE GIVEN FUNCTION IS ACTUALLY NESTED)
#
# Params:
# - function to be checked
# - path to file with function declaration/definition
# Output:
# - preprocessor directives surrounding that function

sub help
{
	print ("List all preprocessor directives that\nsurround given line (pattern) in the code\n");
	print ("Usage\n\t./preproc_shelling.pl <PATTERN> <FILE>\n");
	print ("Use cases:\n");
	print ("- the given PATTERN does NOT have to be unique (can have multiple\n  occurances in the given file), all occurances will be processed separately\n");
}

sub main
{
	print ("--- Preprocessor shelling ---\n");
	#switch DEBUG on (1) to see all prints
	my $DEBUG = 0;
	my $fun = $ARGV[0];
	my $file = $ARGV[1];

	#check arguments:
	if (!$file)
	{
		help();
		return;
	}

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
		   while(my $line = <$fd>) {
			#store #ifdef(s) and #endif(s)
			if ($line =~ /#if|#endif/) {
				#push line to the list
				push @lines, "line ".$line_nr.": ".$line;
			}
			#we need only lines before $fun:
			#(\Q is for escaping any potentally problematic characters)
			if ($line =~ /\Q$function/ && !(grep $_ eq $line_nr, @lines_to_skip)) {
    			   #the #if and #endif lines were already store, now store only if wanted function is not directive
			   if (!($line =~ /#if|#endif/))
			   {
			   	push @lines, "line ".$line_nr.": ".$line;
			   }
			   #keep current function line number for further skipping and break the loop:
			   push @lines_to_skip, $line_nr;
			   print "$line_nr, lines to skip: @lines_to_skip\n" if ($DEBUG);
			   last;
			}
			$line_nr++;
		   }
		   print "\nTruncating all preprocessor directives not related to \"$function\"...\n";
		   print "Lines before processing:\n@lines\n" if ($DEBUG);
		   #Process the lines (remove all paired #ifdef-s and #endif-s before $function):
		   #has to be done until there is no #endif in the list
		   while (my ($matched) = grep $_ =~ /#endif/, @lines) {
			   my $index = -1;
			   foreach $line (@lines) {
				$index++;
				next if (!($line =~ /#if/));
				print "Processing line $index: $line" if ($DEBUG);
				if (@lines[$index+1] =~ /#endif/) {
					print "Found matching, removing lines (splice)...\n" if ($DEBUG);
					#remove #ifdef and following #endif (2 lines):
					splice(@lines, $index, 2);
					print "Lines after splice: \n@lines\n line=$line index=$index\n" if ($DEBUG);
				}
			   }
		   }
		   print "\nLines after processing:\n@lines\n";
		} #foreach $function END
	}
	else
	{
		print "$fun not found in $file\n";
	}
}

main();
	
