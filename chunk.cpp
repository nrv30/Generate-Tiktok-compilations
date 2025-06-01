// chunk a input video into pieces
// takes first filepath to file to be chunked 
// then takes time stamp ranges delimited -
// example: 00:00:01-00:00:05

#include <iostream>
#include <thread>
#include <sstream>
#include <vector>

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
        " -c:a copy output" << i-1 << ".mp4"; // TODO: make file extension match input file
        std::string temp = comm.str();
        threads.emplace_back(executeComm, temp);
    }

    for(auto& t : threads) {
        t.join();
    }

    return 0;
}
