(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='WolframEngine 10.3' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1066,         20]
NotebookDataLength[     35008,       1034]
NotebookOptionsPosition[     31469,        895]
NotebookOutlinePosition[     31805,        910]
CellTagsIndexPosition[     31762,        907]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Sequence Alignment Algorithms", "Title",
 CellChangeTimes->{{3.6956397801872587`*^9, 3.695639787685811*^9}}],

Cell[CellGroupData[{

Cell["Introduction", "Section",
 CellChangeTimes->{{3.695641605338653*^9, 3.695641607227396*^9}}],

Cell[CellGroupData[{

Cell["\<\
Sequence alignment is the identification of residue-residue correspondences. \
It is the basic tool of bioinformatics.\
\>", "Item",
 CellChangeTimes->{{3.6956416760097857`*^9, 3.695641681125413*^9}}],

Cell[TextData[{
 "Any assignment of correpondences that ",
 StyleBox["preserves the order",
  FontSlant->"Italic"],
 " of the residues within the sequences is an alignment. Gaps may be \
introduced."
}], "Item",
 CellChangeTimes->{{3.6956416760097857`*^9, 3.695641728893334*^9}}],

Cell["\<\
Can you give at least two different alignments for strings \
\[OpenCurlyDoubleQuote]ABCDE\[CloseCurlyDoubleQuote] and \
\[OpenCurlyDoubleQuote]ACDEF\[CloseCurlyDoubleQuote]?\
\>", "Item",
 CellChangeTimes->{{3.6956416760097857`*^9, 3.695641728879545*^9}, {
  3.695642000347287*^9, 3.695642061134286*^9}, {3.695642277224621*^9, 
  3.69564227723379*^9}, {3.695642328966199*^9, 3.695642328979311*^9}}],

Cell[TextData[{
 "To find the best alignment we need to ",
 StyleBox["check all possibilities",
  FontSlant->"Italic"],
 "."
}], "Item",
 CellChangeTimes->{{3.6956416760097857`*^9, 3.695641728879545*^9}, {
  3.695642000347287*^9, 3.695642061134286*^9}, {3.695642277224621*^9, 
  3.69564227723379*^9}, {3.695642328966199*^9, 3.695642352194912*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"SequenceAlignment", "[", 
  RowBox[{"\"\<gctgctataatc\>\"", ",", "\"\<ctataatc\>\""}], "]"}]], "Input",
 CellChangeTimes->{{3.695642084914085*^9, 3.695642108595248*^9}, {
  3.69564221568183*^9, 3.695642230755224*^9}}],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"\<\"gctg\"\>", ",", "\<\"\"\>"}], "}"}], 
   ",", "\<\"ctataatc\"\>"}], "}"}]], "Output",
 CellChangeTimes->{
  3.695642109081339*^9, {3.695642221302198*^9, 3.695642232877296*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Pairwise sequence alignment", "Item",
 CellChangeTimes->{{3.695642386751302*^9, 3.695642390919127*^9}, {
  3.695642464768113*^9, 3.695642483218515*^9}}],

Cell["Multiple sequence alignment", "Item",
 CellChangeTimes->{{3.695642386751302*^9, 3.695642390919127*^9}, {
  3.695642464768113*^9, 3.6956424785574417`*^9}}]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["The dotplot", "Section",
 CellChangeTimes->{{3.69564249668827*^9, 3.695642500272641*^9}}],

Cell[CellGroupData[{

Cell["Rows: Residues of one sequence", "Item",
 CellChangeTimes->{{3.695642544859283*^9, 3.69564255255998*^9}}],

Cell["Columns: Residues of second sequence", "Item",
 CellChangeTimes->{{3.695642544859283*^9, 3.695642578468307*^9}}],

Cell["\<\
Positions in the dotplot are filled if they match and blank when they are \
different\
\>", "Item",
 CellChangeTimes->{{3.695642544859283*^9, 3.69564263434827*^9}}],

Cell["\<\
Stretches of similar residues show up as diagonals in the upper left-lower \
right\
\>", "Item",
 CellChangeTimes->{{3.695642544859283*^9, 3.695642665039585*^9}, {
  3.695643058831205*^9, 3.695643058849029*^9}}],

Cell["\<\
Can you write down the alignment of the sequences \
\[OpenCurlyDoubleQuote]DOROTHYHODGKIN\[CloseCurlyDoubleQuote] (rows) and \
\[OpenCurlyDoubleQuote]DOROTHYCROWFOOTHODGKIN\[CloseCurlyDoubleQuote] \
(columns) from below dotplot?\
\>", "Item",
 CellChangeTimes->{{3.695642544859283*^9, 3.695642665039585*^9}, {
  3.695643058831205*^9, 3.695643143031746*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"MatrixPlot", "[", 
  RowBox[{
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Boole", "[", 
       RowBox[{"SameQ", "[", 
        RowBox[{"#1", ",", "#2"}], "]"}], "]"}], "&"}], ",", 
     RowBox[{"Characters", "[", "\"\<DOROTHYHODGKIN\>\"", "]"}], ",", 
     RowBox[{"Characters", "[", "\"\<DOROTHYCROWFOOTHODGKIN\>\"", "]"}]}], 
    "]"}], ",", " ", 
   RowBox[{"PlotLegends", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{"\"\<Mismatch\>\"", ",", "\"\<Match\>\""}], "}"}]}], ",", " ", 
   RowBox[{"Mesh", "\[Rule]", "True"}]}], "]"}]], "Input",
 CellChangeTimes->{{3.6956403091654654`*^9, 3.6956407050760117`*^9}, {
  3.695640906914569*^9, 3.695640946495644*^9}, {3.6956410429673157`*^9, 
  3.695641092168447*^9}}],

Cell[BoxData[
 GraphicsBox[{RasterBox[CompressedData["
1:eJxTTMoPSmVmYGDgA2IxIAaxIeCD/Sg9MumHVSLr3B/egvJhYODdNUrTlh6N
95FJj8b7yKRpHe+j6Wpw0oMtXkh1z1B3P6nm0Nr8kUaPtHAYaf6lFj0abiOT
HmnxPtL8i4seaeEwXP072p7Eb85oe3Jwun+wuWe40qPlA35zhmv5MNjcM0pD
aHrHCwArT420
    "], {{0, 0}, {22, 14}}, {0, 1}], {
    {GrayLevel[
      NCache[-1 + GoldenRatio, 0.6180339887498949]], 
     StyleBox[
      LineBox[{{{0, 14}, {22, 14}}, {{0, 13}, {22, 13}}, {{0, 12}, {22, 
       12}}, {{0, 11}, {22, 11}}, {{0, 10}, {22, 10}}, {{0, 9}, {22, 9}}, {{0,
        8}, {22, 8}}, {{0, 7}, {22, 7}}, {{0, 6}, {22, 6}}, {{0, 5}, {22, 
       5}}, {{0, 4}, {22, 4}}, {{0, 3}, {22, 3}}, {{0, 2}, {22, 2}}, {{0, 
       1}, {22, 1}}, {{0, 0}, {22, 0}}}],
      Antialiasing->False]}, 
    {GrayLevel[
      NCache[-1 + GoldenRatio, 0.6180339887498949]], 
     StyleBox[
      LineBox[{{{0, 0}, {0, 14}}, {{1, 0}, {1, 14}}, {{2, 0}, {2, 14}}, {{3, 
       0}, {3, 14}}, {{4, 0}, {4, 14}}, {{5, 0}, {5, 14}}, {{6, 0}, {6, 
       14}}, {{7, 0}, {7, 14}}, {{8, 0}, {8, 14}}, {{9, 0}, {9, 14}}, {{10, 
       0}, {10, 14}}, {{11, 0}, {11, 14}}, {{12, 0}, {12, 14}}, {{13, 0}, {13,
        14}}, {{14, 0}, {14, 14}}, {{15, 0}, {15, 14}}, {{16, 0}, {16, 
       14}}, {{17, 0}, {17, 14}}, {{18, 0}, {18, 14}}, {{19, 0}, {19, 14}}, {{
       20, 0}, {20, 14}}, {{21, 0}, {21, 14}}, {{22, 0}, {22, 14}}}],
      Antialiasing->False]}}},
  Frame->True,
  FrameLabel->{None, None},
  FrameTicks->{{{{13.5, 
       FormBox["1", TraditionalForm]}, {9.5, 
       FormBox["5", TraditionalForm]}, {4.5, 
       FormBox["10", TraditionalForm]}, {0.5, 
       FormBox["14", TraditionalForm]}}, {{13.5, 
       FormBox["1", TraditionalForm]}, {9.5, 
       FormBox["5", TraditionalForm]}, {4.5, 
       FormBox["10", TraditionalForm]}, {0.5, 
       FormBox["14", TraditionalForm]}}}, {{{0.5, 
       FormBox["1", TraditionalForm]}, {4.5, 
       FormBox["5", TraditionalForm]}, {9.5, 
       FormBox["10", TraditionalForm]}, {14.5, 
       FormBox["15", TraditionalForm]}, {21.5, 
       FormBox["22", TraditionalForm]}}, {{0.5, 
       FormBox["1", TraditionalForm]}, {4.5, 
       FormBox["5", TraditionalForm]}, {9.5, 
       FormBox["10", TraditionalForm]}, {14.5, 
       FormBox["15", TraditionalForm]}, {21.5, 
       FormBox["22", TraditionalForm]}}}},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{
   "AxisPadding" -> Scaled[0.02], "DefaultBoundaryStyle" -> Automatic, 
    "DefaultPlotStyle" -> Automatic, "DomainPadding" -> Scaled[0.02], 
    "RangePadding" -> Scaled[0.05]}]], "Output",
 CellChangeTimes->{
  3.695640560257807*^9, 3.695640598529757*^9, 3.695640636876392*^9, {
   3.6956406827065363`*^9, 3.695640705985729*^9}, {3.695640922998053*^9, 
   3.695640947866066*^9}, {3.695641046604107*^9, 
   3.695641093238781*^9}},ImageCache->GraphicsData["CompressedBitmap", "\<\
eJztnV2P00YUhp1NUtpCxR2fQuJHAOKmK1gEe4F6D1puoghp96JqRfk5qP+z
V25m7PUmmxNnnJxjn0meSEzssV/P6/OcjGMP2flj9v3y65+z71fz2fPzb7O/
L6/m/zz/8Ne3RdV4VBSjy6Io/ntehOVysVgX8XUVinpFWH4W38bl/Ou8rF/F
y1DGqndxfbK8tdn2tmXbRViahqXFocMr7FStLcpHm5t+Ecvp7YNG7ZnQ4GJ5
LBzmNH3XT0KdtN+TzaZfC3VvuppdrZsIdZ9DeRKqJs1Si6v+Q3mRGMqHW0xP
NqVepwBep2FxRwpBEwrpgA8qg0/DW9zyStjprNl6EtflSJ/e2mv1GF/2M7jx
wxvPXoJctn94b6I2boIdlx5XDcadtvQoXZfvN6f8MRT3l2pvndpdoU4i8z6x
bpbYxm9YOjhLsTy310yq9x///vg9FD/toF7ULZRrJ7qt7p5zrXd/O2mvivAv
1C3K1f2kSzroXfrrEb10dU+tI0Uy03ZMkdQ8GMWSVMrUXyapNG3uPMmdvLUK
uTO9uaOtt6/dqUv3u3Q9vvz1lz5J6bHS+7Q/FZmGhenygdzFSUHr3Z92/kSg
EW3SQ7Givr2eV0+XVx+NTus26Wsy1m7ta+THmzdZUCcK343z9OfwuzEPa3z5
6/FhDeh9+QO9mda7P9Cbab3784CeEb0M/W3VtiSJpKXPyMYf6M203v2B3kzr
3R/ozbTe/YHeTOvdH+jNtN79gd5M690f6M203v2B3kzr3R/ozbTe/YHeTOvd
H+jNtN79eUDP4E+G/lbq6iS5l5gk9BmDtwF6l1rv/kBvpvXuD/RmWu/+QG+m
9e4P9GZa7/5Ab6b17g/0Zlrv/kBvpvXuD/RmWu/+QG+m9e4P9GZa7/5Ab6b1
7s8Desb9cvLXMhC8T7v0Gf79gR70oDfSuvUHetCD3kjr1h/oQQ96I61bf6AH
PeiNtG79gR70oDfSuvUHetAPj15n8Kfjr9PcgvHkr8eY7tNngF5f6wO9NMNF
Wf8l+q2zEJAW+tqB06ItH1bmI0ia3VaaKIUMOr4Muk6PUVgaVUsluTR4G+QS
uUQuKeTS+mxeZJC+tseYLs3mlZgy6/N5ndwcqVx+LdbFDKUHOpz8aZvhqy0v
WualLLktG86fw4tXuXpbxkOc40sLnt8N5w/0oAd9j1oX/pyjt/uZV+pw5lBJ
t89wq6Td53d6Cr/x8/S/A0Cf7g/0oAe90SmCHvSgBz3oS9CDHvSgj2ugTz83
0IMe9KBP9wd60IPe6BRBD3rQ740+nz/v2GNwTQeMjX7e6anP0LYJejPPoFcJ
I+j1bYLezDPoVcIIen2boDfzDHqVMIJe3ybozTyDXiWMoNe3CXozz6BXCSPo
9W2C3swz6FXCeCzo8xn8kbRGI45DAcwpcYY+RdCraEGv7y8TLej1/WWiBb2+
v0y0oNf3l4kW9Pr+MtGCXt9fJlrQ6/vLRAt6fX+ZaEGv7y8TLej1/WWiBb2+
v0y0oNf3l4n2sMf9GDA28+y9zwC9mWfQq4QR9Po2QW/mGfQqYQS9vk3Qm3kG
vUoYQa9vE/RmnkGvEkbQ69sEvZln0KuEEfT6NkFv5hn0KmE8FvQ+B38GDq73
UU0PiQP6Q0d/J7zFLVunitY2TBKYnVtqEsQZxGPVz3G9qK4PO05Dr30yJIjZ
uW1OEJn9uN5/mX3VYRS/CptOhDpS5dBSRUoHMUXoVY49VTr3KjFlJs33kqi/
7lVIi/zTIgKN/CdrXz9WE0Kqo4M4nExo6yCq/aublJgnXC2OIRmEL5ORfswD
Hlfs3EbGScCTqv3aAD3oQZ9qE/Rm56aF3m5Mi+nP0v1lOP0Z6EGfGJ6OCEAP
etCDHvQWcQF9ehugBz3oU8PTEQHoQQ960IPeIi6gT28D9KAHfWp4OiIAPehB
7w59v79lGypAHdsdauA2pwFj0B+EFvQqYcxRC3qVMOaoBb1KGHPUgl4ljDlq
Qa8Sxhy1oFcJY45a0KuEMUct6FXCmKMW9CphzFELepUw5qgFvUoYc9T6Gvxh
1DDdX4ajhqAHfWJ4OiIAPehBD3rQW8QF9OltgB70oE8NT0cEoAc96EEPeou4
gD69DdCDHvSp4emIAPR+0esM/gwF30jrwl+PMd2nzwC9vhb0oB8U/S/CJmle
EdLhsNNBYl7PF0CKOPFHigyOwLs/UmRwBN79ZZgi69OXkRj62h5jGoFKMx7W
mdBhWl0yQV/bexcxWeYbXhF41R9w5fDiz++VgwcYx5cOPLsazh/oQQ/6HrUu
/DlHv/MAZyzPu2nuCnWvhLr3iXWzxDawdACW4uzMH0NROawy8Gq35WdCYy9D
GavexXX5/upty7aLsBRv04vxteN6bVE+2tz0i1jK81GfCQ3O63nMbx3mNH3X
T0KdtN+TzaZfC3VvupqVr0bLdZ9DeRKqJs1Si6v+Q3mRGMqHW0xPNqVepwBe
p+HiLk8IQRMK6YAPKoNPw1vcIn3Ez5qt1bNFOdKnt/ZaPcaX/Qxu/PDGs5cg
l+0f3puojZtgx6XHVYNxpx17mmL0PwPDGgI=\
\>"]]
}, {2}]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Scoring Schemes", "Section",
 CellChangeTimes->{{3.695643283052698*^9, 3.6956432864356537`*^9}}],

Cell[CellGroupData[{

Cell["Scores as measures of sequence similarity", "Item",
 CellChangeTimes->{{3.695643329595031*^9, 3.695643339289525*^9}}],

Cell["\<\
Similar sequences give high scores and dissimilar sequences give low scores\
\>", "Item",
 CellChangeTimes->{{3.695643329595031*^9, 3.695643362886304*^9}}],

Cell["Optimization algorithms try to maximize the scoring function", "Item",
 CellChangeTimes->{{3.695643329595031*^9, 3.695643417832655*^9}}],

Cell["Nucleic acid sequences", "Item",
 CellChangeTimes->{{3.695643329595031*^9, 3.695643433664297*^9}}],

Cell[CellGroupData[{

Cell[TextData[{
 StyleBox["SIMPLE SCHEME:",
  FontWeight->"Bold"],
 " +1 for match and -1 for a mismatch"
}], "Subitem",
 CellChangeTimes->{{3.695643329595031*^9, 3.695643441774969*^9}, {
  3.695643494357655*^9, 3.695643506865411*^9}}],

Cell[TextData[{
 StyleBox["COMPLEX SCHEME:",
  FontFamily->"Nimbus Sans L",
  FontSize->14,
  FontWeight->"Bold"],
 " Accounts for higher frequency of ",
 StyleBox["transition mutations (purine \[LeftRightArrow]purine, pyrimidine\
\[LeftRightArrow]pyrimidine)",
  FontSlant->"Italic"],
 " than ",
 StyleBox["transversion mutations (purine\[LeftRightArrow]pyrimidine)",
  FontSlant->"Italic"]
}], "Subitem",
 CellChangeTimes->{{3.695643329595031*^9, 3.695643441774969*^9}, {
  3.695643494357655*^9, 3.695643546438459*^9}, {3.695643802433395*^9, 
  3.695643852847617*^9}}]
}, Open  ]]
}, Open  ]],

Cell[BoxData[
 RowBox[{"(", GridBox[{
    {"\[Placeholder]", "A", "G", "T", "C"},
    {"A", "20", "10", "5", "5"},
    {"G", "10", "20", "5", "5"},
    {"T", "5", "5", "20", "10"},
    {"C", "5", "5", "10", "20"}
   }], ")"}]], "Input",
 CellChangeTimes->{{3.695643650509693*^9, 3.695643725179316*^9}}],

Cell[CellGroupData[{

Cell["Protein sequences", "Item",
 CellChangeTimes->{{3.6956439055558577`*^9, 3.69564391098633*^9}}],

Cell[CellGroupData[{

Cell["Based on physicochemical type", "Subitem",
 CellChangeTimes->{{3.6956439055558577`*^9, 3.695643947366341*^9}}],

Cell["Let the proteins guide us build the scoring matrix", "Subitem",
 CellChangeTimes->{{3.6956439055558577`*^9, 3.695644021308976*^9}}],

Cell[CellGroupData[{

Cell[TextData[{
 StyleBox["Percent Accepted Mutation Matrix:",
  FontWeight->"Bold"],
 " First attempt by M.O Dayhoff who collected statistics on substitution \
frequencies in protein sequences then known"
}], "Subsubitem",
 CellChangeTimes->{{3.6956439055558577`*^9, 3.695644058279647*^9}, {
  3.695644176155574*^9, 3.695644194509058*^9}}],

Cell[TextData[{
 StyleBox["Blocks Substitution Matrices:",
  FontWeight->"Bold"],
 " Modification by Jorja Henikoff and Steven Henikoff"
}], "Subsubitem",
 CellChangeTimes->{{3.6956439055558577`*^9, 3.695644089672803*^9}, {
  3.695644125120058*^9, 3.695644148961035*^9}, {3.695644197776514*^9, 
  3.695644219596842*^9}}]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["PAM (Point Accepted Mutation Matrix)", "Section",
 CellChangeTimes->{{3.6956453509184523`*^9, 3.695645371099011*^9}, 
   3.6956848077148857`*^9}],

Cell[CellGroupData[{

Cell["Developed by Margaret Dayhoff (1978)", "Item",
 CellChangeTimes->{{3.6956842620462227`*^9, 3.695684271849843*^9}, {
  3.695685085921577*^9, 3.6956850878985777`*^9}}],

Cell["\<\
Derived from global alignments of sequences that are at least 85% identical\
\>", "Item",
 CellChangeTimes->{{3.6956842620462227`*^9, 3.6956842853740396`*^9}, {
  3.695684388167856*^9, 3.69568440401252*^9}}],

Cell["\<\
Is based on the observed rate of mutation during the predicted evolutionary \
changes in a smaller number of protein families.\
\>", "Item",
 CellChangeTimes->{{3.6956842620462227`*^9, 3.6956842853740396`*^9}, {
  3.695684388167856*^9, 3.695684433407065*^9}}],

Cell["\<\
Uses a rough measure of how many generations of evolution it would take to \
mutate one sequences into another\
\>", "Item",
 CellChangeTimes->{{3.6956842620462227`*^9, 3.6956842853740396`*^9}, {
   3.695684388167856*^9, 3.695684454672697*^9}, {3.695684539752055*^9, 
   3.695684554259245*^9}, 3.695685024879434*^9}],

Cell["\<\
PAM matrices are identified by numbers and the general notation is PAM(N). \
The number \[OpenCurlyQuote]N\[CloseCurlyQuote] provides a measure of \
evolutionary distance between the proteins being compared. A bigger number \
indicates greater evolutionary (mutational) distance. For example, the PAM1 \
matrix is calculated from comparisons of sequences that have diverged only 1 \
percent from each other.\
\>", "Item",
 CellChangeTimes->{{3.6956842620462227`*^9, 3.6956842853740396`*^9}, {
  3.695684388167856*^9, 3.695684454672697*^9}, {3.695684539752055*^9, 
  3.695684598527993*^9}, {3.695684690657179*^9, 3.69568473948272*^9}}],

Cell["\<\
Matrices such as PAM40, PAM100, PAM250 etc indicate greater evolutionary \
distances and are derived by extrapolation from those for lesser ones.\
\>", "Item",
 CellChangeTimes->{{3.6956842620462227`*^9, 3.6956842853740396`*^9}, {
  3.695684388167856*^9, 3.695684454672697*^9}, {3.695684539752055*^9, 
  3.695684598527993*^9}, {3.695684690657179*^9, 3.6956847781646833`*^9}}],

Cell["\<\
PAM matrices are most sensitive for alignments of sequences with evolutionary \
related homologs.\
\>", "Item",
 CellChangeTimes->{{3.6956842620462227`*^9, 3.6956842853740396`*^9}, {
  3.695684388167856*^9, 3.695684454672697*^9}, {3.695684539752055*^9, 
  3.695684598527993*^9}, {3.695684690657179*^9, 3.695684796534111*^9}}]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["BLOSUM (BLOck SUbstitution Matrix)", "Section",
 CellChangeTimes->{{3.695645358053852*^9, 3.695645407686975*^9}}],

Cell[CellGroupData[{

Cell["Developed by Jorjya Henikoff and Steven Henikoff (1992)", "Item",
 CellChangeTimes->{{3.695685061810546*^9, 3.695685090405117*^9}}],

Cell["\<\
They are derived from local, ungapped alignments of distantly related \
sequences\
\>", "Item",
 CellChangeTimes->{{3.695685061810546*^9, 3.6956851089926853`*^9}}],

Cell["\<\
All BLOSUM matrices are based on observed alignments; they are not \
extrapolated from comparisons of closely related proteins.\
\>", "Item",
 CellChangeTimes->{{3.695685061810546*^9, 3.695685139907832*^9}}],

Cell["\<\
They are based on the concept of \
\[OpenCurlyQuote]blocks\[CloseCurlyQuote]-amino acid patterns derived from \
ungapped multiple alignments corresponding to the most conserved regions of a \
protein. These highly conserved sequences serve as protein signatures \
uniquely identifying them as distinct protein family.\
\>", "Item",
 CellChangeTimes->{{3.695685061810546*^9, 3.6956851751095543`*^9}, {
  3.69568523170818*^9, 3.695685261813733*^9}}],

Cell["\<\
They are derived from the observed amino acid substitutions in a large set of \
approximately 2000 such conserved patterns representing over 500 groups of \
related proteins.\
\>", "Item",
 CellChangeTimes->{{3.695685061810546*^9, 3.6956851751095543`*^9}, {
  3.69568523170818*^9, 3.695685300093054*^9}}],

Cell["\<\
As the with PAM matrices, BLOSUM matrices are also identified by numbers. The \
number after the matrix (e.g. BLOSUM62) refes to the minimum per cent \
identity of the blocks used to construct the matrix; greater the numbers mean \
lesser the distances.\
\>", "Item",
 CellChangeTimes->{{3.695685061810546*^9, 3.6956851751095543`*^9}, {
  3.69568523170818*^9, 3.695685363799748*^9}}],

Cell["\<\
BLOSUM62 is a matrix calculated from comparisons of sequences with no less \
than 62 per cent divergence.\
\>", "Item",
 CellChangeTimes->{{3.695685061810546*^9, 3.6956851751095543`*^9}, {
  3.69568523170818*^9, 3.69568538726893*^9}}]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Relation between PAM and BLOSUM", "Section",
 CellChangeTimes->{{3.695685459244754*^9, 3.6956854658509293`*^9}}],

Cell[CellGroupData[{

Cell[TextData[{
 StyleBox["Evolutionary distance:",
  FontWeight->"Bold"],
 " BLOSUM matrices are derived from alignments of distantly related \
sequences, the PAM matrices are derived from alignments of sequences that are \
closely related."
}], "Item",
 CellChangeTimes->{{3.695685496457095*^9, 3.695685557913887*^9}}],

Cell[TextData[{
 StyleBox["LOCAL vs. GLOBAL:",
  FontWeight->"Bold"],
 " BLOSUM matrices perform better than PAM matrices for local similarity \
searches. Compared to PAM60 matrix, the BLOSUM62 matrix was found to detect \
more distant relationships in a BLAST search"
}], "Item",
 CellChangeTimes->{{3.695685496457095*^9, 3.695685557814414*^9}, {
  3.695685627261957*^9, 3.6956857158176203`*^9}}],

Cell[TextData[{
 StyleBox["Short Queries:",
  FontWeight->"Bold"],
 " BLOSUM matrices does not perform well for short queries, so the older PAM \
matrices may be used for such searches."
}], "Item",
 CellChangeTimes->{{3.695685496457095*^9, 3.695685557814414*^9}, {
  3.695685627261957*^9, 3.6956857765491*^9}}]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Computing the alignment of two sequences", "Section",
 CellChangeTimes->{{3.6958997025151377`*^9, 3.69589970617916*^9}, {
  3.6958997455589237`*^9, 3.695899748561944*^9}}],

Cell[TextData[{
 "Alignment techniques based on ",
 StyleBox["dynamic programming",
  FontSlant->"Italic"],
 "."
}], "Text",
 CellChangeTimes->{{3.695899810891172*^9, 3.695899820208804*^9}}],

Cell[CellGroupData[{

Cell["\<\
Optimal global alignment given choice of parameters - substitution matrix and \
gap penalty\
\>", "Item",
 CellChangeTimes->{{3.695899952987805*^9, 3.6958999953323727`*^9}}],

Cell["\<\
Many alignments may give optimal score and none of these maybe biologically \
meaningful.\
\>", "Item",
 CellChangeTimes->{{3.695899952987805*^9, 3.695900036687886*^9}}],

Cell["\<\
Not very good large database search due to computational difficulties (BLAST \
uses an approximation method).\
\>", "Item",
 CellChangeTimes->{{3.695899952987805*^9, 3.6959001200323887`*^9}, {
  3.695900197165753*^9, 3.695900211284213*^9}}],

Cell["\<\
Global alignment algorithm first applied to biological sequences by S.B \
Needleman and C.D Wunsch.\
\>", "Item",
 CellChangeTimes->{{3.695899952987805*^9, 3.6959001547917433`*^9}}],

Cell["\<\
T. Smith and M. Waterman modified it to identify local matches.\
\>", "Item",
 CellChangeTimes->{{3.695899952987805*^9, 3.695900175541728*^9}, {
  3.6959033983169394`*^9, 3.695903398331328*^9}}],

Cell["There are three possible variations of alignment", "Item",
 CellChangeTimes->{{3.695899952987805*^9, 3.695900175541728*^9}, {
  3.6959033983169394`*^9, 3.6959034092425327`*^9}}],

Cell[CellGroupData[{

Cell["Entire sequence 1 against entire sequence 2", "Subitem",
 CellChangeTimes->{{3.695899952987805*^9, 3.695900175541728*^9}, {
  3.6959033983169394`*^9, 3.695903424702435*^9}}],

Cell["Region of sequence 1 against entire sequence 2", "Subitem",
 CellChangeTimes->{{3.695899952987805*^9, 3.695900175541728*^9}, {
  3.6959033983169394`*^9, 3.6959034352135*^9}}],

Cell["Region of sequence 1 against region of sequence 2", "Subitem",
 CellChangeTimes->{{3.695899952987805*^9, 3.695900175541728*^9}, {
  3.6959033983169394`*^9, 3.6959034457854958`*^9}}]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Dynamic Programming", "Subsection",
 CellChangeTimes->{{3.69590033666635*^9, 3.695900342727363*^9}}],

Cell["Principle of Optimality", "Subsubsection",
 CellChangeTimes->{{3.695900307920207*^9, 3.695900313003948*^9}, {
  3.6959003483214684`*^9, 3.69590035125163*^9}, {3.695900724153554*^9, 
  3.695900725858378*^9}}],

Cell["Memoization", "Subsubsection",
 CellChangeTimes->{{3.695900393249851*^9, 3.69590039746966*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Optimal alignment problem", "Subsection",
 CellChangeTimes->{{3.695900582066844*^9, 3.695900586145339*^9}, {
  3.69590197494809*^9, 3.695901975822802*^9}}],

Cell[TextData[{
 "Given two character strings, possibly of unequal length - ",
 Cell[BoxData[
  FormBox[
   RowBox[{"A", "=", 
    RowBox[{
     RowBox[{
      RowBox[{
       SubscriptBox["a", "1"], 
       SubscriptBox["a", "2"]}], "..."}], 
     SubscriptBox["a", "n"]}]}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " and ",
 Cell[BoxData[
  FormBox[
   RowBox[{"B", "=", 
    RowBox[{
     RowBox[{
      RowBox[{
       SubscriptBox["b", "1"], 
       SubscriptBox["b", "2"]}], "..."}], 
     SubscriptBox["b", "m"]}]}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " - where each ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["a", "i"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " and ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["b", "i"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " is a member of an alphabet set \[ScriptCapitalA], consider sequences of \
edit operations that convert A and B to a common sequence. Individual edit \
opreations include:"
}], "Text",
 CellChangeTimes->{{3.695900595923623*^9, 3.695900684767606*^9}, {
  3.695900728336772*^9, 3.695900760686928*^9}, {3.695900791325914*^9, 
  3.695900807497839*^9}}],

Cell[CellGroupData[{

Cell[TextData[{
 "Substitution of ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["b", "j"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " for ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["a", "i"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " is represented by ",
 Cell[BoxData[
  FormBox[
   RowBox[{"(", 
    RowBox[{
     SubscriptBox["a", "i"], ",", 
     SubscriptBox["b", "j"]}]}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 ")"
}], "ItemNumbered",
 CellChangeTimes->{{3.695900823342567*^9, 3.6959008604697866`*^9}}],

Cell[TextData[{
 "Deletion of ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["a", "i"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " from sequence A is represented by ",
 Cell[BoxData[
  FormBox[
   RowBox[{"(", 
    SubscriptBox["a", "i"]}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 ",\[Phi])"
}], "ItemNumbered",
 CellChangeTimes->{{3.695900823342567*^9, 3.695900879964464*^9}, {
  3.69590091146103*^9, 3.6959009188815823`*^9}}],

Cell[TextData[{
 "Deletion of ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["b", "j"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " from sequence B is represented by ",
 Cell[BoxData[
  FormBox[
   RowBox[{"(", 
    RowBox[{"\[Phi]", ",", 
     SubscriptBox["b", "j"]}]}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 ")"
}], "ItemNumbered",
 CellChangeTimes->{{3.695900823342567*^9, 3.695900879964464*^9}, {
  3.69590091146103*^9, 3.695900946130475*^9}}]
}, Open  ]],

Cell[TextData[{
 "Cost function \[ScriptD] is defined on edit operations:\n",
 Cell[BoxData[
  FormBox[
   RowBox[{"\[ScriptD]", "(", 
    RowBox[{
     SubscriptBox["a", "i"], ",", 
     SubscriptBox["b", "j"]}], ")"}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 "=cost of a mutation in an alignment in which position \[ScriptI] of \
sequence A corresponds to position \[ScriptJ] of sequence B and the mutation \
substitutions ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["a", "i"], "\[UndirectedEdge]", " ", 
    SubscriptBox["b", "j"]}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 "\n",
 Cell[BoxData[
  FormBox[
   RowBox[{"\[ScriptD]", "(", 
    RowBox[{
     SubscriptBox["a", "i"], ",", "\[Phi]"}], ")"}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " or ",
 Cell[BoxData[
  FormBox[
   RowBox[{"\[ScriptD]", "(", 
    RowBox[{"\[Phi]", ",", 
     SubscriptBox["b", "j"]}], ")"}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 "= cost of a deletion or insertion"
}], "Text",
 CellChangeTimes->{{3.6959011116418543`*^9, 3.6959012782567673`*^9}}],

Cell[TextData[{
 "Define the minimum weighted distance between sequences A and B as:\nD(A,B)=",
 Cell[BoxData[
  FormBox[GridBox[{
     {"min"},
     {
      RowBox[{"A", "\[Rule]", "B"}]}
    }], TraditionalForm]],
  FormatType->"TraditionalForm"],
 Cell[BoxData[
  FormBox[
   RowBox[{"\[Sum]", 
    RowBox[{"d", "(", 
     RowBox[{"x", ",", "y"}], ")"}]}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 "\nwhere \[ScriptX], \[ScriptY] \[Element] ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["\[ScriptCapitalA]", "+"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " and minimum is taken over all sequences of edit operations that convert A \
and B into a common sequence.\nThe problem is to find D(A,B)"
}], "Text",
 CellChangeTimes->{{3.695901283400125*^9, 3.695901343417862*^9}, {
  3.695901787680437*^9, 3.695901986306332*^9}}],

Cell["\<\
The dynamic programming algorithm computes the \[ScriptCapitalD](\[ScriptI],\
\[ScriptJ]) matrix by recursion where 0\[LessEqual] \[ScriptI] \[LessEqual]n \
and 0\[LessEqual] \[ScriptJ] \[LessEqual] \[ScriptM]. \
\>", "Text",
 CellChangeTimes->{{3.695902024642967*^9, 3.695902123654055*^9}}]
}, Open  ]],

Cell[CellGroupData[{

Cell["Evolutionary actions and \[ScriptCapitalD](\[ScriptI], \[ScriptJ])", \
"Subsection",
 CellChangeTimes->{{3.695902487941299*^9, 3.695902521930944*^9}}],

Cell["\<\
There are three possible actions that evolution can perform and this is \
reflected in the matrix as three kinds of movements from top left to bottom \
right. Let A=xy and B=xz.\
\>", "Text",
 CellChangeTimes->{{3.69590252991444*^9, 3.6959025697583103`*^9}, {
  3.695903097488628*^9, 3.695903141422059*^9}}],

Cell[CellGroupData[{

Cell[TextData[{
 "(\[ScriptI]-1, \[ScriptJ]-1) \[RightArrow] (\[ScriptI], \[ScriptJ]): \
Corresponds to the substitution ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["a", "i"], "\[RightArrow]"}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["\[ScriptB]", "j"], TraditionalForm]],
  FormatType->"TraditionalForm"]
}], "ItemNumbered",
 CellChangeTimes->{{3.6959025897233257`*^9, 3.695902691812257*^9}}],

Cell[TextData[{
 "(\[ScriptI]-1, \[ScriptJ])\[RightArrow] (\[ScriptI], \[ScriptJ]): \
Corresponds to the deletion of ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["a", "i"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " from A. (A=xy and B=x_z implying evolution deleted y from A in producing B)"
}], "ItemNumbered",
 CellChangeTimes->{{3.6959025897233257`*^9, 3.6959027412687397`*^9}, {
  3.695903118811749*^9, 3.6959031823684464`*^9}}],

Cell[TextData[{
 "(\[ScriptI], \[ScriptJ]-1) \[RightArrow](\[ScriptI], \[ScriptJ]): \
Correponds to the insertion of ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["b", "j"], TraditionalForm]],
  FormatType->"TraditionalForm"],
 "into A at position \[ScriptI] (A=x_y and B=xz implying evolution inserted z \
into the position between x and y in A to form B)"
}], "ItemNumbered",
 CellChangeTimes->{{3.6959025897233257`*^9, 3.6959027898773823`*^9}, {
  3.6959031916376534`*^9, 3.695903262120541*^9}}]
}, Open  ]],

Cell[TextData[{
 "Sequence of edit operations correpond to stepwise paths through the matrix:\
\n",
 Cell[BoxData[
  FormBox[
   RowBox[{"(", 
    RowBox[{
     SubscriptBox["i", "0"], ",", 
     SubscriptBox["\[ScriptJ]", "0"]}], ")"}], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " = (0, ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{
     RowBox[{"0", ")"}], " ", "\[RightArrow]", " ", 
     RowBox[{"(", 
      RowBox[{
       SubscriptBox["i", "1"], ",", 
       SubscriptBox["j", "1"]}], ")"}]}], "\[Rule]", " ", 
    RowBox[{"...", 
     RowBox[{"(", 
      RowBox[{"n", ",", "m"}], ")"}]}]}], TraditionalForm]],
  FormatType->"TraditionalForm"]
}], "Text",
 CellChangeTimes->{{3.6959028193117647`*^9, 3.695902926671247*^9}}],

Cell[CellGroupData[{

Cell["\<\
What happens when A=xyz and B=x? Describe the path in the matrix for such a \
case.\
\>", "Item",
 CellChangeTimes->{{3.6959033069203453`*^9, 3.695903369916552*^9}}],

Cell["\<\
What happens when A=x and B=xyz? Describe the path in the matrix for such a \
case.\
\>", "Item",
 CellChangeTimes->{{3.6959033069203453`*^9, 3.695903342843403*^9}, {
  3.695903374960383*^9, 3.695903375271699*^9}}]
}, Open  ]]
}, Open  ]],

Cell["Needleman-Wunsch Algorithm", "Subsection",
 CellChangeTimes->{{3.695903524266972*^9, 3.695903543685206*^9}}]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1280, 739},
WindowMargins->{{0, Automatic}, {Automatic, 0}},
FrontEndVersion->"10.3 for Linux ARM (32-bit) (January 18, 2016)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1488, 35, 114, 1, 94, "Title"],
Cell[CellGroupData[{
Cell[1627, 40, 97, 1, 65, "Section"],
Cell[CellGroupData[{
Cell[1749, 45, 210, 4, 30, "Item"],
Cell[1962, 51, 279, 7, 31, "Item"],
Cell[2244, 60, 408, 7, 30, "Item"],
Cell[2655, 69, 347, 8, 31, "Item"]
}, Open  ]],
Cell[CellGroupData[{
Cell[3039, 82, 241, 4, 30, "Input"],
Cell[3283, 88, 250, 7, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[3570, 100, 158, 2, 30, "Item"],
Cell[3731, 104, 160, 2, 30, "Item"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[3940, 112, 95, 1, 65, "Section"],
Cell[CellGroupData[{
Cell[4060, 117, 111, 1, 30, "Item"],
Cell[4174, 120, 118, 1, 30, "Item"],
Cell[4295, 123, 174, 4, 30, "Item"],
Cell[4472, 129, 221, 5, 30, "Item"],
Cell[4696, 136, 367, 7, 30, "Item"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5100, 148, 758, 18, 50, "Input"],
Cell[5861, 168, 5464, 102, 264, 2568, 53, "CachedBoxData", "BoxData", "Output"]
}, {2}]]
}, Open  ]],
Cell[CellGroupData[{
Cell[11371, 276, 102, 1, 65, "Section"],
Cell[CellGroupData[{
Cell[11498, 281, 123, 1, 30, "Item"],
Cell[11624, 284, 165, 3, 30, "Item"],
Cell[11792, 289, 142, 1, 30, "Item"],
Cell[11937, 292, 104, 1, 30, "Item"],
Cell[CellGroupData[{
Cell[12066, 297, 235, 6, 26, "Subitem"],
Cell[12304, 305, 570, 15, 27, "Subitem"]
}, Open  ]]
}, Open  ]],
Cell[12901, 324, 302, 8, 87, "Input"],
Cell[CellGroupData[{
Cell[13228, 336, 100, 1, 30, "Item"],
Cell[CellGroupData[{
Cell[13353, 341, 116, 1, 26, "Subitem"],
Cell[13472, 344, 137, 1, 26, "Subitem"],
Cell[CellGroupData[{
Cell[13634, 349, 340, 7, 26, "Subsubitem"],
Cell[13977, 358, 320, 7, 26, "Subsubitem"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[14370, 373, 151, 2, 65, "Section"],
Cell[CellGroupData[{
Cell[14546, 379, 171, 2, 30, "Item"],
Cell[14720, 383, 217, 4, 30, "Item"],
Cell[14940, 389, 269, 5, 30, "Item"],
Cell[15212, 396, 326, 6, 30, "Item"],
Cell[15541, 404, 644, 10, 68, "Item"],
Cell[16188, 416, 385, 6, 30, "Item"],
Cell[16576, 424, 335, 6, 30, "Item"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[16960, 436, 119, 1, 65, "Section"],
Cell[CellGroupData[{
Cell[17104, 441, 137, 1, 30, "Item"],
Cell[17244, 444, 173, 4, 30, "Item"],
Cell[17420, 450, 217, 4, 30, "Item"],
Cell[17640, 456, 457, 8, 49, "Item"],
Cell[18100, 466, 314, 6, 30, "Item"],
Cell[18417, 474, 393, 7, 49, "Item"],
Cell[18813, 483, 244, 5, 30, "Item"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[19106, 494, 118, 1, 65, "Section"],
Cell[CellGroupData[{
Cell[19249, 499, 320, 7, 50, "Item"],
Cell[19572, 508, 397, 8, 50, "Item"],
Cell[19972, 518, 311, 7, 31, "Item"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[20332, 531, 177, 2, 65, "Section"],
Cell[20512, 535, 190, 6, 33, "Text"],
Cell[CellGroupData[{
Cell[20727, 545, 183, 4, 30, "Item"],
Cell[20913, 551, 179, 4, 30, "Item"],
Cell[21095, 557, 250, 5, 30, "Item"],
Cell[21348, 564, 191, 4, 30, "Item"],
Cell[21542, 570, 204, 4, 30, "Item"],
Cell[21749, 576, 183, 2, 30, "Item"],
Cell[CellGroupData[{
Cell[21957, 582, 179, 2, 26, "Subitem"],
Cell[22139, 586, 180, 2, 26, "Subitem"],
Cell[22322, 590, 187, 2, 26, "Subitem"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[22558, 598, 106, 1, 45, "Subsection"],
Cell[22667, 601, 213, 3, 36, "Subsubsection"],
Cell[22883, 606, 101, 1, 30, "Subsubsection"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23021, 612, 161, 2, 45, "Subsection"],
Cell[23185, 616, 1182, 39, 53, "Text"],
Cell[CellGroupData[{
Cell[24392, 659, 552, 21, 34, "ItemNumbered"],
Cell[24947, 682, 452, 15, 31, "ItemNumbered"],
Cell[25402, 699, 474, 16, 34, "ItemNumbered"]
}, Open  ]],
Cell[25891, 718, 1104, 34, 78, "Text"],
Cell[26998, 754, 851, 24, 113, "Text"],
Cell[27852, 780, 301, 5, 32, "Text"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28190, 790, 156, 2, 46, "Subsection"],
Cell[28349, 794, 317, 6, 32, "Text"],
Cell[CellGroupData[{
Cell[28691, 804, 469, 14, 34, "ItemNumbered"],
Cell[29163, 820, 446, 10, 31, "ItemNumbered"],
Cell[29612, 832, 497, 11, 34, "ItemNumbered"]
}, Open  ]],
Cell[30124, 846, 749, 25, 53, "Text"],
Cell[CellGroupData[{
Cell[30898, 875, 175, 4, 30, "Item"],
Cell[31076, 881, 224, 5, 30, "Item"]
}, Open  ]]
}, Open  ]],
Cell[31327, 890, 114, 1, 45, "Subsection"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature #w0FUvfFkmzt4BKvsT6vKNTK *)
