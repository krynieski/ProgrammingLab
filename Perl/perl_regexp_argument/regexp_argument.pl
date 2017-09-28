#!/usr/bin/perl
# KRYNIESKI 2017
# Passing regexp arguments to Perl function:
# - first argument: any
# - second argument: test_files/*
# EXPECTED RESULT: list all files provided by regexp * in second argument

sub main()
{
	#parsing list of arguments
	my ($arg, @files) = @ARGV;
	print "first argument:\n\t$arg\n";
	print "second argument:\n";
	foreach $file (@files)
	{
		print "\t$file\n";
	}
}

#run main
main();