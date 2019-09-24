# 指定URLからdmgファイルをDLし、アプリケーションフォルダに配置するシェルスクリプト

if [ $# -ne 2 ]; then
  echo "usage : sh install_from_dmg.sh [dmgファイルのurl] [app名]"
  exit 1
fi

download_url=$1
dmg_file=${download_url##*/}

echo "dmgファイルのダウンロードを開始します… '$1'"
curl -LO $download_url
echo "dmgファイルをマウントしています…"
mount_dir=`hdiutil attach $dmg_file | awk -F '\t' 'END{print $NF}'`
echo "$2.appを /Applications/ に配置しています…"
sudo /usr/bin/ditto "$mount_dir/$2.app" "/Applications/$2.app"
echo "dmgファイルを取り出しています…"
hdiutil detach "$mount_dir"
echo "dmgファイルを削除しています…"
rm $dmg_file
echo "$2のインストールが完了しました！"