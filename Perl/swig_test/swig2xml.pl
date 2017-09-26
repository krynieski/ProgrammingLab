#!/usr/bin/perl

sub main
{
	print "KRYNIESKIE SWIG PERL TEST\n";

	# --- PRZYGOTOWANIE PLIKU TYMCZASOWEGO ---
	# Defajny:
	my @defines = ('PRINT_I', 'PRINT_C');
	# Includy:
	my @c_includes = ('header.h');
	# Otwarcie nowego pliku tymczasowego dla swig:
	open(my $fd, "> tmp.h") or die "Cannot open tmp.h to write!($)\n";
	# Dodawanie definow do pliku tymczasowego:
	foreach my $def (@defines) {
	   print "#define $def > tmp.h\n";
	   print $fd '#define ' . $def . "\n";
	}
	# Dodawanie includow do pliku tymczasowego:
	foreach my $inc (@c_includes) {
	   print "#include $inc > tmp.h\n";
	   print $fd '#include "' . $inc . '"'."\n";
	}

	# --- SWIG - TWORZENIE PLIKOW WYNIKOWYCH ---
	my $swig = "swig";
	my $swig_module = "test";
	# swig do formatu xml:
	my $xml_output = "swig.xml";
	print "Calling swig to xml...\n";
	system("$swig -o $xml_output -xml -includeall -module $swig_module tmp.h");
	# swig do formatu C:
	my $c_output = "swig.c";
	print "Calling swig to C...\n";
	system("$swig -o $c_output -includeall -module $swig_module tmp.h");

	print "Done, see swig.xml and swig.c\n";
}

main();
