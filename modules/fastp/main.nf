process fastp {
  tag "${sample_id}"
  input:
    path reads

  output:
    path 'trimmed.fastq.gz' 

  script:
  """
  fastp -i ${reads} -o trimmed.fastq.gz
  """
}

