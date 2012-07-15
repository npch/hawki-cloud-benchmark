#!/usr/bin/perl -w



        # submit job
	$numProc=2;
        $cmd = "qsub -cwd -pe orte $numProc benchmark.sge";
        print $cmd."\n";

        my $ret = `$cmd`;
        die "Error: $?" if($? != 0);

        chomp($ret);
        my @words = split(/ /,$ret);
        my $jobId = $words[2];

        print "Job ID: $jobId submitted for $numProc processes\n";

        #check queue
        while(1)
        {
                my $line = "";

                open(QUEUE,"qstat | grep $jobId |") or die "Unable to run qstat";
                while(<QUEUE>)
                {
                        chomp;
                        $line = $_;
                }
                close QUEUE;

                last if($line eq "");
                sleep(2);
        }

        print "Job ID: $jobId completed $numProc processes\n";
        my $file = "image.sge.o$jobId";