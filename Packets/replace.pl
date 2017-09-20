#!/usr/local/bin/perl

use File::Find;

sub what_to_do
{
  $filename=$_;

  if ($filename=~/.view/i || $filename=~/\.class/i || $filename=~/\.method/i)
  {
    #print "$filename\n";
    open(f_in,$filename)||die("!!");

    @line = <f_in>;
    close(f_in);

    open(f_out,">$filename");
    $count = 1;
    $tags = 0;
    @columns=();
  }

  if ($filename=~/.view/i)
  {
    while ($count <= @line) 
    {

      $line[$count-1]  =~ s/\|USERCONTEXT 0|\|USERCONTEXT 1//;

      if ($line[$count-1] eq "===========================================================================\n")  {$tags++;}

      if ($tags<1 || $tags>2)
      {
        print f_out ($line[$count-1]);
      }
      $count++;
    }

    close(f_out);
  }

  if ($filename=~/.method/i)
  {
    while ($count <= @line) 
    {
      if ($line[$count-1] !~ /^Package_Name:|^Text_Type:|^Modified:/i)
      {
        print f_out ($line[$count-1]);
      }
      $count++;
    }

    close(f_out);
  }

  if ($filename=~/\.class/i)
  {
    while ($count <= @line) 
    {
      if ($line[$count-1] !~ /^Modified:/i && $line[$count-1] !~ /^Storage_Group:/i)
      { 	
        if ($tags==3)
        {
          if ($line[$count-1] eq "\n")
          {
            @columns=sort(@columns);
            print f_out (@columns);
            $tags=0;
            @columns=();
          }
          else
          {
            $line[$count-1]=~  s/(,\d+)/,Номер колонки/;
            #print $line[$count-1];
            $columns[@columns]=$line[$count-1]
          }
        }

        if ($line[$count-1] =~ /^IDX_Z#/i)
        {
           $line[$count-1]=~  s/(,A\n)/,\n/;
        }

        if ($line[$count-1] =~ /Колонки/i)
        {
           $tags=1; 
        }

        if ($tags==1 && $line[$count-1] eq "\n")

        {
           $tags=2; 
        } 

        if ($tags<=2)
        {
          print f_out ($line[$count-1]);
        }


        if ($tags==2)
        {
           $tags=3  
        }

        
      }
      $count++;
    }

    close(f_out);
  }

}


#find(\&what_to_do, ("IBS", "");

find(\&what_to_do, ("./corr/IBS", "./corr/sc_full_distr_autotest_copy_mdb"));
