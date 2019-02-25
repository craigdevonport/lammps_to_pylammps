BEGIN {
    # import pylammps and generate object
    printf"from lammps import PyLammps\n\n\nL = PyLammps()\n\n"
}

{
    if ($1 ~ /^#/  || $0 ~ /^[ \t\r\n]*$/ ) {
        # just print comments and whitespace
        print
    } else {
        # convert lammps line to pylammps line
        printf "L."
        printf "%s", $1
        printf "(\""

        # print everything after $1
        for (f=2; f<=NF; ++f) {
            # add whitespcae if not first item
            if (f!=2) {
                printf "%s",OFS 
            }
            printf "%s", $f
        }

        printf "\")\n"
    }
    
}