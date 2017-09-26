#!/usr/bin/perl

# sposob na "szukanie" stringa za pomoca regexpa

sub if_regexp {
	my $string = "} dupa;";
	print "looking for \"".$string."\"\n";
	# szukanie stringa za pomoca regexpa "\^}.*;"
	if ($string =~ "\^}.*;")
	{
		print "found!\n";
	}
}

#call function:
if_regexp();