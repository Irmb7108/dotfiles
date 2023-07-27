function backup_files
    set backup_count 0
    set all_files_mode 0

    if test (count $argv) -gt 0; and test $argv[1] = '-a'
        set all_files_mode 1
        set argv (ls)
    end

    if test (count $argv) -gt 5; or test $all_files_mode -eq 1
        # Create a folder for the backups
        set backup_folder "backup_"(date "+%Y%m%d_%H%M%S")
        mkdir -p $backup_folder

        # Create a markdown file to log the backups
        set log_file $backup_folder"/backup_log.md"
        echo "# Backup Log" > $log_file
        echo "## Date: "(date "+%Y-%m-%d %H:%M:%S") >> $log_file
        echo "## Author: "(whoami) >> $log_file
        echo "## Files:" >> $log_file
    end

    for file in $argv
        if test -e $file
            set counter 1
            set base_filename (basename $file)
            switch $base_filename
                case '*.bak'
                    set base_filename (string trim -r -c '.bak' $base_filename)
                    set backup_filename $base_filename.bak
                    if test -e $backup_filename
                        while test -e $base_filename$counter.bak
                            set counter (math $counter+1)
                        end
                        set backup_filename $base_filename$counter.bak
                    end
                case '*'
                    set backup_filename $base_filename.bak
                    if test -e $backup_filename
                        while test -e $base_filename$counter.bak
                            set counter (math $counter+1)
                        end
                        set backup_filename $base_filename$counter.bak
                    end
            end

            # If there are more than 5 files, or we are in 'all files mode', put the backups in the new folder
            if test (count $argv) -gt 5; or test $all_files_mode -eq 1
                set backup_filename $backup_folder"/"$backup_filename
            end

            cp -R $file $backup_filename >/dev/null 2>&1
            if test $status -eq 0
                echo "Backup successful for $file" | lolcat
                if test (count $argv) -gt 5; or test $all_files_mode -eq 1
                    echo "- [x] $file" >> $log_file
                    set backup_count (math $backup_count+1)
                end
            else
                echo "Backup failed for $file" | lolcat
                if test (count $argv) -gt 5; or test $all_files_mode -eq 1
                    echo "- [ ] $file" >> $log_file
                end
            end
        else
            echo "File or directory $file does not exist" | lolcat
        end
    end

    if test (count $argv) -gt 5; or test $all_files_mode -eq 1
        echo "## Total files backed up: "$backup_count >> $log_file
    end
end
