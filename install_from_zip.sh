# 指定URLからzipファイルをDLし、アプリケーションフォルダに配置するシェルスクリプト

if [ $# -ne 1 ]; then
  echo "usage : install_from_zip.sh [zipファイルのurl]"
  exit 1
fi

download_url=$1
zip_file=${download_url##*/}

echo "zipファイルのダウンロードを開始します '$download_url'"
curl -LO $download_url
echo "'$zip_file'を解凍しています…"
sudo unzip -o $zip_file -d /temp
echo "/Applications/ に配置しています…"
find /temp -name *.app | xargs -I@ sudo mv -f @ /Applications
echo "'$zip_file'を削除しています…"
rm $zip_file
sudo rm -rf /temp
echo "インストールが完了しました！"