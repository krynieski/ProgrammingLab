#!/usr/bin/perl

# sposob na definiowanie stalych w perlu:
use constant TRUE => 1;
use constant FALSE => 0;

sub true_false {
	my $bool = FALSE;

	if ($bool == TRUE)
	{
		print "bool is TRUE\n";
	}
	else
	{
		print "bool is FALSE\n";
	}
}

#call function:
true_false();