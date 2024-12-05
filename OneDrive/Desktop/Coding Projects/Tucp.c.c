#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <dirent.h>
#include <sys/stat.h>
#include <limits.h>

void copy_file(char *source, const char *destination) {    //function to copy one file into another
    FILE *source_rd, *destination_rd;
    char *buffer[1024];

    source_rd = fopen(source, "r");  //opens source file
    destination_rd = fopen(destination, "w");    //opens file to copy onto

    if (source_rd == NULL) {            
        printf("Error opening source file");
        exit(1);
    }

    if (destination_rd == NULL) {
        printf("Error opening destination file");
        exit(1);
    }

    while (1) {
        int bytes_read = fread(buffer, 1, 1024, source_rd);
        if (bytes_read == 0) {      //copies until it reaches end
            break;
        }
        fwrite(buffer, 1, bytes_read, destination_rd);  //code to write file to copy
    }
    fclose(source_rd);       //closes both files
    fclose(destination_rd);

}

void copy_directory(char *source[], int num_sources, const char * destination) {  //function to copy # of source files to directory
    DIR *dir = opendir(destination);     //opens directory file
    if (dir == NULL) {
        printf("Error opening destination directory");
        exit(1);
    }

    for (int i = 0; i < num_sources; i++) {
        char destination_file[PATH_MAX];
        snprintf(destination_file, PATH_MAX, "%s/%s", destination, source[i]);
        copy_file(source[i], destination_file);
    }
}

int main(int argc, char *argv[]) {
    struct stat stat_buffer_source;
    struct stat stat_buffer_destination;

    if (argc < 3) {
        exit(1);
    }

    if (S_ISDIR(stat_buffer_source.st_mode) && S_ISDIR(stat_buffer_destination.st_mode)) {
        fprintf(stderr, "Error: Both source and destination are directories\n");  //exits if both given files are directories
        exit(1);
    }

    if (S_ISDIR(stat_buffer_destination.st_mode)) {
        copy_directory(argv + 1, argc - 2, argv[argc - 1]);  //chooses function to use depending on if it detects a directory
    } else{
        copy_file(argv[1], argv[2]);
    }
    return 0;
}
