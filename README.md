# my-wf: BIOL7210 Nextflow DSL2 Pipeline

## Overview
A simple bacterial‑genomics pipeline demonstrating both sequential and parallel execution:
1. **Trim & QC** with **fastp**  
2. **Assemble** with **SPAdes** (runs after trimming)  
3. **Compute read metrics** with **seqkit** (runs in parallel with SPAdes)

## Workflow 
!(workflow_dag.png)

## Requirements
- **Nextflow** v24.10.5  
- **Conda** (Miniforge/Mambaforge)  
- **Java** JRE 11+ (bundled with Nextflow)  
- **Graphviz** (for DAG image)  

## Installation

### Native Apple Silicon (arm64)
```bash
# 1. Create & activate the Conda env
conda env create -f envs/conda.yaml
conda activate nf-wf
```
Test run
```bash
nextflow run main.nf \
  -profile test,conda \
  --reads test_data/mini.fastq.gz \
  -with-report report.html
```
Full run 
```bash
nextflow run main.nf \
  -profile conda \
  --reads "/path/to/reads/*.fastq.gz" \
  -with-report report.html
```
