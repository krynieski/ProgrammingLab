#!/usr/bin/perl
# KRYNIESKI 2017
# Perl continue = next

sub main()
{
	my @list = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
	foreach $element (@list)
	{
		#skip all elements divisible by 2
		if(!($element % 2))
		{
			#Perl continue = next:
			next;
		}
		print("$element\n");
	}
}

main();