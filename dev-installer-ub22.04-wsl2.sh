#!/bin/bash
# 実行済みフラグの初期化

# メニューを表示する関数
show_menu() {
    echo "1. C"
    echo "2. Python"
    echo "3. Go"
    echo "4. Dotnet"
    echo "5. Java"
    echo "6. SpringBoot"
    echo "7. Flutter"
    echo "8. Nodejs"
    echo "9. Ruby"
    echo "10. Rust"
}
update() {
    apt update -q; apt upgrade -yq
    echo "##################"
    echo "updated package!"
    echo "##################"
    
}
set_local() {
    sudo apt -y install language-pack-ja
    sudo apt -y install manpages-ja manpages-ja-dev
    sudo update-locale LANG=ja_JP.UTF8
    echo "##################"
    echo "set locale!"
    echo "##################"
  
}
script1() {
    echo "##################"
    echo "C"
    echo "##################"
    apt install -y gcc gdb make cmake valgrind zip unzip
    echo "##################"
    echo "C Finish!"
    echo "##################"
}
script2() {
    echo "##################"
    echo "Python"
    echo "##################"
    apt install -y python3-pip python3-venv make zip unzip
    echo "##################"
    echo "Python Finish!"
    echo "##################"
}
script3() {
    echo "##################"
    echo "Go"
    echo "##################"
    apt install -y golang make zip unzip
    echo "##################"
    echo "Go Finish!"
    echo "##################"
}
script4() {
    echo "##################"
    echo "Dotnet"
    echo "##################"
    wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt-get update; \
        sudo apt-get install -y apt-transport-https && \
        sudo apt-get update && \
        sudo apt-get install -y dotnet-sdk-5.0
    sudo apt install -y make zip unzip
    echo "##################"
    echo "Dotnet Finish!"
    echo "##################"
}
script5() {
    echo "##################"
    echo "Java"
    echo "##################"
    sudo apt install -y zip unzip make
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install java 11.0.11.hs-adpt
    echo "##################"
    echo "Java Finish!"
    echo "##################"
}
script6() {
    echo "##################"
    echo "SpringBoot"
    echo "##################"
    apt install -y zip unzip make
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install java 11.0.11.hs-adpt
    sdk install springboot
    . ~/.sdkman/candidates/springboot/current/shell-completion/bash/spring
    echo "##################"
    echo "SpringBoot Finish!"
    echo "##################"
}
script7() {
    echo "##################"
    echo "Flutter"
    echo "##################"
    apt install -y zip unzip libglu1-mesa make
    cd /usr/local
    git clone https://github.com/flutter/flutter.git -b stable
    cd bin
    ln -s /usr/local/flutter/bin/dart dart
    ln -s /usr/local/flutter/bin/flutter flutter
    echo "##################"
    echo "Flutter Finish!"
    echo "##################"
}
script8() {
    echo "##################"
    echo "Nodejs"
    echo "##################"
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - &&\
    apt-get install -y nodejs
    echo "##################"
    echo "Nodejs Finish"
    echo "##################"
}
script9() {
    echo "##################"
    echo "Ruby"
    echo "##################"
    
    echo "##################"
    echo "Ruby Finish"
    echo "##################"
}
script10() {
    echo "##################"
    echo "Rust"
    echo "##################"
    
    echo "##################"
    echo "Rust Finish"
    echo "##################"
}
# メイン処理
while true; do
    update
    set_local
    # メニューを表示
    show_menu

    # ユーザーに複数の番号の入力を求める
    echo -n "番号を入力してください（スペースで区切って複数指定可）: "
    read -a choices

    # 選択された番号に基づいて対応する処理を実行
    for choice in "${choices[@]}"; do
        case $choice in
            1)
                script1
                ;;
            2)
                script2
                ;;
            3)
                script3
                ;;

            4)
                script4
                ;;
            5)
                script5
                ;;
            6)
                script6
                ;;
            7)
                script7
                ;;
            8)
                script8
                ;;
            9)
                script9
                ;;
            10)
                script10
                ;;
            *)
                echo "無効な番号です: $choice"
                ;;
        esac
    done
    echo "インストールが完了しました"
    break
done
