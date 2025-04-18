process seqkit {
  tag "${reads}"
  input:
    path trimmed_ch

  output:
    path 'stats.txt'

  script:
  """
  seqkit stats ${trimmed_ch} > stats.txt
  """
}

