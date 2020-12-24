class: CommandLineTool
cwlVersion: v1.1
label: filter_rsq
doc: A tool that generates a RData file containing a list of variants that pass a minimum Rsq threshold, given a list of info.gz files returned by the Michigan Imputation server, for use in the GENESIS association test pipeline
$namespaces:
  sbg: https://sevenbridges.com

requirements:
- class: ShellCommandRequirement
- class: ResourceRequirement
  ramMin: 4000
- class: DockerRequirement
  dockerPull: quay.io/mdaya/filter_rsq:1.0

inputs:
- id: info_gz_file
  label: info_gz_file
  doc: |-
    info.gz file returned by the Michigan imputation server, which contains information about imputation accuracy
  type: File
  inputBinding:
    position: 1
    shellQuote: false
- id: min_rsq
  label: min_rsq
  doc: The minimum Rsq value that a SNP should have to be considered "valid"
  type: float
  inputBinding:
    position: 2
    shellQuote: false

outputs:
- id: valid_snp_file
  label: valid_snp_file
  doc: |-
    A RData file containing a data frame with SNP IDs of all SNPs with Rsq greater than the specified threshold
  type: File
  outputBinding:
    glob: '*_valid_snp_IDs.RData'
  sbg:fileTypes: .RData

baseCommand:
- bash /home/analyst/run_get_valid_snp_ids.sh
id: |-
  https://api.sb.biodatacatalyst.nhlbi.nih.gov/v2/apps/midaya/cag/filter-rsq/0/raw/
sbg:appVersion:
- v1.1
sbg:content_hash: a0ea44256b1852ab6a4b33feecf49461de0ef9dc953e29a4a1cada3f7559d8205
sbg:contributors:
- midaya
sbg:copyOf: midaya/gasp/filter-rsq/3
sbg:createdBy: midaya
sbg:createdOn: 1606189900
sbg:id: midaya/cag/filter-rsq/0
sbg:image_url:
sbg:latestRevision: 0
sbg:modifiedBy: midaya
sbg:modifiedOn: 1606189900
sbg:project: midaya/cag
sbg:projectName: CAG
sbg:publisher: sbg
sbg:revision: 0
sbg:revisionNotes: Copy of midaya/gasp/filter-rsq/3
sbg:revisionsInfo:
- sbg:modifiedBy: midaya
  sbg:modifiedOn: 1606189900
  sbg:revision: 0
  sbg:revisionNotes: Copy of midaya/gasp/filter-rsq/3
sbg:sbgMaintained: false
sbg:validationErrors: []
