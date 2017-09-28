#!/usr/bin/perl

sub main()
{
	my $iteration = 0;
	while($iteration < 10)
	{
		$iteration++;
		next if ($iteration == 5);
		print("$iteration\n");
	}
}

main();