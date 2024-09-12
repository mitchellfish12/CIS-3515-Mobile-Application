#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <dirent.h>
#include <sys/stat.h>
#include <limits.h>

void copy_file(char *source, const char *destination) {
    FILE *source_rd, *destination_rd;
    char *buffer[1024];

    source_rd = fopen(source, "r");
    destination_rd = fopen(destination, "w");

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
        if (bytes_read == 0) {
            break;
        }
        fwrite(buffer, 1, bytes_read, destination_rd);
    }
    fclose(source_rd);
    fclose(destination_rd);

}

void copy_directory(char *source[], int num_sources, const char * destination) {
    DIR *dir = opendir(destination);
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

    if (stat("source_file", &stat_buffer_source) == -1) {
    // Handle error
    perror("stat");
    exit(EXIT_FAILURE);
}

if (stat("destination_file", &stat_buffer_destination) == -1) {
    // Handle error
    perror("stat");
    exit(EXIT_FAILURE);
}

    if (argc < 3) {
        exit(1);
    }

    if (S_ISDIR(stat_buffer_source.st_mode) && S_ISDIR(stat_buffer_destination.st_mode)) {
        fprintf(stderr, "Error: Both source and destination are directories\n");
        exit(1);
    }

    if (S_ISDIR(stat_buffer_destination.st_mode)) {
        copy_directory(argv + 1, argc - 2, argv[argc - 1]);
    } else{
        copy_file(argv[1], argv[2]);
    }
    return 0;
}
