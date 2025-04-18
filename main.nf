#!/usr/bin/env nextflow
nextflow.enable.dsl=2

// === use `include` for local modules ===
include { fastp }  from './modules/fastp/main.nf'
include { spades } from './modules/spades/main.nf'
include { seqkit } from './modules/seqkit/main.nf'

workflow {
  // 1) read your FASTQ(s)
  reads_ch = Channel.fromPath(params.reads)

  // 2) run fastp (Module 1)
  trimmed_ch = fastp(reads_ch)

  // 3a) run SPAdes (Module 2) in parallel
  asm_ch     = spades(trimmed_ch)

  // 3b) run seqkit stats (Module 3) in parallel
  stats_ch   = seqkit(trimmed_ch)

  // 4) just dump to console for now
  trimmed_ch.view()
  asm_ch.view()
  stats_ch.view()
}

