#include <iostream>
#include <thread>
#include <sstream>
#include <vector>

// timestamps


void executeComm(std::string comm) {
    std::system(comm.c_str());
    //printf("thread started\n");
}

int main(int argc, char* argv[]) {
    //std::cout << "hello world";
    std::vector<std::thread> threads;
    //std::vector<std::string> commands;

    std::string file(argv[1]);
    file = "\"" + file + "\"";

    for  (int i = 2; i < argc; i++) {
        //std::cout << "------------" << std::endl;
        std::ostringstream comm;
        //std::cout << argv[i] << std::endl;
        std::string args(argv[i]);
        //std::cout << args << std::endl;
        int pos = args.find("-");
        std::string args1 = args.substr(0, pos);
        std::string args2 = args.substr(pos + 1);
        // std::cout << args1 << std::endl;
        // std::cout << args2 << std::endl;

        comm << "ffmpeg -i " << file << " -ss " << args1 << " -to " << args2 <<
        " -c:a copy output" << i-1 << ".mp4"; // has to be mp4 or m4a because input is always m4a
        std::string temp = comm.str();
        threads.emplace_back(executeComm, temp);
    }

    for(auto& t : threads) {
        t.join();
    }

    // convert mp4's to mp3
    // FOR /F "tokens=*" %G IN ('dir /b *.mp4') DO ffmpeg -i "%G" -acodec mp3 "%~nG.mp3"
    // del*mp4
    return 0;
}