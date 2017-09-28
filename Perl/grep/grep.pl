#!/usr/bin/perl

sub main()
{
	my @list = ();
	my $item = 17;
	push @list, $item;
	#$item = 16;
	print("item=$item, list=@list\n");
	#look for item in @list
	if (grep $_ eq $item, @list)
	{
		print "found it!\n";
	}
}

main();