process spades {
  tag "${reads}"
  input:
    path trimmed_ch

  output:
    path 'contigs.fasta' 

  script:
  """
  spades.py -s ${trimmed_ch} -o spades_out
  cp spades_out/contigs.fasta .
  """
}

