for file in `ls`
        do
        if [[ "$file" =~ _L001_R1_001.fastq.fasta$ ]]; then
        cat $file ${file%*_L001_R1_001.fastq.fasta}_L002_R1_001.fastq.fasta >${file%*_L001_R1_001.fastq.fasta}.fasta
          echo "${file%*_L001_R1_001.fastq.fasta}"

        fi
        done
