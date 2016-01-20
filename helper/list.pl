for my $f (glob "*.tex") { 
	open F, $f or die $!; 
	while(<F>) { 
		if(my ($title) = /title=\{(.*?)\}/)
		{ 
			print "$title";
			if(my ($interpret) = /interpret=\{(.*?)\}/)
			{ 
				print " - $interpret";
			}
			if(my ($key) = /key=\{(.*?)\}/)
			{ 
				print " ($key)";
			} 
		print "\n";
		}
		close $f; 
	}
}
