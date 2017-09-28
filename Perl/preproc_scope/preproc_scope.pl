#!/usr/bin/perl
#krystianx.potyralski@intel.com 2017
#
#SCRIPT TO LIST ALL FUNCTIONS THAT ARE
#"NESTED" IN GIVEN PREPROCESSOR DIRECTIVE
#
#Params:
# - param1: preprocessor directive
# - param2: file(s) to be parsed
#Output:
# - list of functions surrounded by given preprocessor directive;
# if directive is an empty string "", all functions in given file(s)
# will be listed

#constants definitions
use constant TRUE => 1;
use constant FALSE => 0;

sub help
{
	print ("List all functions in given file(s) that are\nin scope of given preprocessor directive\n");
	print ("Usage:\n\t./preproc_scope.pl <DIRECTIVE> <FILE(S)>\n");
	print ("Use cases:\n");
	print ("- if <DIRECTIVE> is empty string \"\", all functions in given file(s) will be listed\n");
	print ("- <FILE(S)> can be given separately: file1 file2 ..., or with regexp *\n");
}

sub main
{
	print("--- Preprocessor scope ---\n");
	#first argument ($ARGV[0]): preprocessor directive
	#second argument ($ARGV[1]): file(s) to be parsed
	my ($directive, @files) = @ARGV;
	#check arguments:
	if (!@files)
	{
		help();
		return;
	}

	#process all files provided in ARGV[1] (@files):
	print("Looking for all functions in scope of '$directive'...\n");
	foreach $file (@files)
	{
		open(my $fd, $file) or die "Could not open $file: $!\n";
		print("\n--- Processing file $file ---\n");

		#check if $directive exists in the file (grep)
		if (!(grep{/\Q$directive/} <$fd>))
		{
			print("\"$directive\" not found in \'$file\'!\n");
			close($fd);
			#Perl continue:
			next;
		}
	
		#directive found, continue parsing the file
		seek $fd, 0, 0;
		my @functions = ();
		my $is_open = FALSE;
		my $is_inner_open = FALSE;
		while(my $line = <$fd>)
		{
			#if provided empty directive, list all functions
			if(!$directive)
			{
				#get all lines starting with a letter (function declarations/definitions)
				if($line =~ /^\w/)
				{
					push @functions, $line;
				}
			}
			#else, list only functions in scope of directive
			else
			{
				#directive not found yet
				if (!$is_open)
				{
					if($line =~ /^#if.*$directive/)
					{
						$is_open = TRUE;
					}
				}
				else #inside directive scope
				{
					#directive inside directive
					if($line =~ /^#if/)
					{
						$is_inner_open = TRUE;
					}
					elsif($line =~ /^#endif/)
					{
						#endif of inner directive											
						if($is_inner_open)
						{
							$is_inner_open = FALSE;
						}
						#endif of searched directive
						else
						{
							$is_open = FALSE;
						}
					}
					#looking for lines starting with a letter
					# - function definitions
					elsif($line =~ /^\w/)
					{
						push @functions, $line;
					}
				}
			}
		}

		print("Functions in scope of '$directive':\n");
		print " @functions";
		close($fd);
	}
}

main();