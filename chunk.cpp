#include <iostream>
#include <thread>
#include <sstream>
#include <vector>

// chunk a big video or audio into smaller pieces
// first argument is the filepath to the media the subsequent timestamps are timestamp ranges seperated by `-`
// example extracting audio from 1-4 seconds-  ./chunk C:/user/bob/music/fav_song 00:00:01-00:00:04 

void executeComm(std::string comm) {
    std::system(comm.c_str());
}

int main(int argc, char* argv[]) {
    std::vector<std::thread> threads;

    std::string file(argv[1]);
    file = "\"" + file + "\"";

    for  (int i = 2; i < argc; i++) {
        std::ostringstream comm;
        std::string args(argv[i]);
        int pos = args.find("-");
        std::string args1 = args.substr(0, pos);
        std::string args2 = args.substr(pos + 1);

        comm << "ffmpeg -i " << file << " -ss " << args1 << " -to " << args2 <<
        " -c:a copy output" << i-1 << ".mp4"; // has to be mp4 or m4a because input is always m4a
        std::string temp = comm.str();
        threads.emplace_back(executeComm, temp);
    }

    for(auto& t : threads) {
        t.join();
    }

    return 0;
}
