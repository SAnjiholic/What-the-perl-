#!/usr/bin/perl -w
#-------------------- Package Definition --------------------
#----------------------- Dependencies -----------------------
use Tkx;

#---------------- User Defined Declarations -----------------


#------------------------ Main Window -----------------------
my $mw = MainWindow->new( -height => 213, -width => 318);
$mw_imageptr = $mw->Photo( -data => ImageResource1());
$mw->Icon( -image => $mw_imageptr);


#---------- Adding Button
my $Button0 = $mw->Button(
                           -text => "Run Me",
                           -relief => "raised",
                           -background => "#F75037"
                           );
$Button0->place( -x => 7, -y => 10, -height => 40, -width => 50);
$Button0->bind( "<Button>", \&hello);

#---------- Adding Text
my $Text1 = $mw->Scrolled( 'Text', -scrollbars => 'e'
,
                                                      -background => "
+#E88B46"
                                                      );
$Text1->place( -x => 71, -y => 8, -height => 72, -width => 152);

#---------- Adding Canvas
my $Canvas2 = $mw->Scrolled( 'Canvas', -scrollbars => 'se'
,
                                                           
														   -relief => 
+"raised",
                                                           -background
+ => "#7378BB"
                                                           );
$Canvas2->place( -x => 72, -y => 88, -height => 112, -width => 152);

#------------------------ Main Menu -------------------------

#-------------------- Sizing Main Window --------------------
$mw->geometry('318x213');
#---------------------- User Load Code ----------------------


MainLoop;
#------------------------ Main Body -------------------------

#---------------------- Image Resources ---------------------
sub hello {$Text1 -> insert('end',"Hello, perl/TK");}

sub ImageResource1
{
   my $d = "
   R0lGODlhKAAoAPcAAAQCBASGBJSyjMzexBSyHOTq5GSCZIzShFSuVCSSJDRCN
   MzyxKzSpCSiJFTKVKTipOT25MTqxDSuPExmTHzChCQmBASaBFx2XNTy1LTWtP
   T29Cw2JC+aNASWBGjObKHCnNXi1GyybDGiNECiRDnCPCS6LNrq1LzitFxuXCO
   aJCwuBGzSbJS2lMrmxPTy9KfapOn+5Nz+1BSSFLTqtCyuLOfy5IzejEy2VETG
   RHSOdMz6xFpuVJzClByqHGJ+XLzetPr+9BQSBCCqJBwiFBSaFJ/KnCyqNMDiv
   M7ezERSPO327NTqzITKhOHy3DU+NEy+TNzq3CqaLJy+lBmSHCS2LA+OFOzq7H
   SGdJTWlGSyZFVqVLzWvPz2/DiePHzGfGzCbDiiPFSqVHzSfLLarBceFBKiFFy
   uXCeWLDxCPNPyzLTSrCmiLGTSZEyuTIzGjGR6ZDQ+LOTm3ESqRBwiHAqODIS+
   hGyGbDlGNFzKXOj65MvuxDS2PFNqTIzGhGB6XNv21LfatCwuFKTenGS6ZHnCf
   ExeRHjKdIzajESuRDy+RCy6NFy2XKzOpJzSnJS6jDQ2BHyWdJTKlBwaBITOfA
   SiBGy6bCKyJM7mzPH+7MPqvO3y7GV+ZCyqLKC+nDC2NKzmrCkqDC06LAiSDGR
   yZHTSdOH63CyuNEzGTNH6zByaHCwyHIS+fJTelL3evPz+/DSqPIzKjBseHEyq
   TIzSjMjixOXu5GyGZFCyVCGWJKTWpB+mJITGhPb69DKeNKLGnNrm1DSmNESmR
   Nnu1LjmtGByXCSeJJi6lKzepBGWFFxyVCQmFJzOnMLmvM7izOz67NDuzNz23E
   nCTOHu3CueLBqWHO/u7HyKdDymPKzerNT2zK7WrBwmHFjOXJzinETCRDC+NKT
   WnASWDOT+3DSyNNT+zBieHAQGBASKBJS2jMz2xDSyPCw6JGzWbCyyLHSSdLza
   vPz6/HzWfFyyXFy6XHTWdEzKTGyCZDxCNOz25MzqxFRmTITChGR2XNzy1LzWt
   Pz29CH5BAAAAAAALAAAAAAoACgABwj/AB+pkASgoMGDCBMqTBikwqMKoFSFuq
   MADpxQGJ2EgqOxY6iOFzVivJhRwT04GwJVCDIkySZ3kOz42GTPQM2aNnPe1Gn
   AwEwfPuy4y7GpkKogAIZoETBGmy9jxqR04iHlg5SqV61K3ar1KlRfDBiw2ASn
   YKw3jHSQy/QD0IkTP97Glfu2Lty3R1ocAfQjU7p0DHI4MXuBEbkY2VoozpevB
   WPGER47zseMWaYWJoQJa0Erkw7A7gYDiLWDx4JsS5rRasaZVotLrlW/5gw776
   VLJn41G9BiQSZfdsoCIKOFxbDUA5AgabacebPn0Js3AwFiwDtA7wY0M2GilTE
   foQoS/0eXl5byX+jTq4/z61KzXwWsWGkG7hCWVrX+4TuCzs8G8TsYM4welyDx
   Sy0I1lCDNLXUkKA0ENbgAjwaHCGGAys8UIMrriwhhQ/rACgFM8+08F4NSqSoh
   CYoKoFPijW8CA88NXSDxzfeiNGCEs7k82F4wwWYSQTmHYiPJi/WoIkSCqL4Dx
   fwKIHBJ6QkYkk7NxAyxhE/SGGPcKQZQ2ILBkrTZJNMNoHijLxg0A073ozDyRr
   TgLHIAS98cIVoZAiph4m/tOgiiy4qqAQXvNTwyQrfWCLENGdMkQAihoDzgTVo
   FDRHgAOaB4USvMz4D4tKaqKBBkoI80k83lhSBjIJnP9xRheLzJKLnnwGyAyRS
   EChAYczuqAmPlxwocEz3axwyh66EEFHFVGEQUEuw5wghQFAkjaiHuaZoAkv4D
   KpoAYzNvEAGyRQMWcCVVAjixu0OAODj+ABaEwmGJgAHS1HkCiMkxr0MwyrBJS
   Ryhm4RCELIa386sozxvgR4nB8GJNPKTWAsEUkhHzhgQ0zNAHPPxg8QE80e/SA
   DB1TcGDGLj/UAo8rmPjon3gV6wFDDQP4ksU1PbRTjw3P8KLJoiS0w8k0U9DhL
   iwtkPuPM9Aw82NBSt2bBi1FhDCCDB1QUsIKn2AQwSHeFFwMwmfIwbASHGrSRB
   pWb5ItClKccAwTZoz/EAU1HVggRDRisMIKG3uU0UEVCXSBwC6ASMOLK/DIncY
   RUtit6ShSHDPJLVEknMLoDYwTDTfcPGFKCnTQgQsCkdCCIi//rAhBP1bXC8Ac
   o3RyjCGI4DJFCtNwcEYvwHjyTQmmiCA8Lm4fMXmUDiJZdeZAzoH3MVgM4ncKu
   CTAQS8i0CBED+VQIz4CWm7oSqIMIvlH7hNra1kudYTBdBW49HLNK5wohyigFY
   ZIHKEG4DJak6xXNyCRIWfQEIY/6iCLFFCDeOTrRQqmQI1g7IIWkzOampakCQZ
   mbmIPdIQe8pAxNezjFiKIQiqmQMP+LWwM7oOfmVYUoz9gTnPD0YIx/yLQDyjo
   phXLqMQ1ZBCAAFShF2aAxQ+koQQKMSlCSorR9TaBQj/R4kBKMEEj5JGCcwQAG
   bKAxSXgxgt8ZFFBECihJiAwP+yZJUAnyEQrQOACyrUAFgjoxTQW9gO4vW9BLS
   rhiqz3w4kpBR0/YEYrkFCNGRXgHZGgAAUikYFfcIFyGkBQLeRYQhdUQwn9aEV
   /HLgDdJyAV3HQhAs0UQsTgGA7UFDSqUpYDVL2cpaawMARvoNCFHzgNEu4xC+a
   AAFQAcEVz3SGEiAAgRo080X4gMCLVoSPPIhDD76wRbbewIAYxAAV+XgGBkpRC
   kwA4ZlAwAQMSgGNP7DznvRkJzSgAZ0DcZCDAaExCznJQY4FMOOVEdDDM9Kw0G
   c8Qw8RGFImIJrQiEKUGb0h6BgCmhR9CIAB2uABC9ABFWM44qQnNWlJV+qIkrJ
   gpB9gBCME8IbwSGIId9DCG/xADC3oQwt84MMEhkrUoAL1qHxAqlD1kYwL+EEL
   SVCFJFQAClAMYRtzIINWt8rVrnr1q0OYwxCGAAoVCIQgC0mrWhnikIAAADs=
   ";
   return $d;
}