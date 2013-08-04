matches = [ { :leeds, :liverpool }, { :leeds, :man_city }, { :liverpool, :man_city }, { :liverpool, :stoke },
            { :westbrom, :liverpool }, { :westbrom, :leeds } ]

lc { home, _ } inlist matches, { _, away } inlist matches, do: { home, away }

