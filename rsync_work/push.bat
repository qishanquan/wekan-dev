set projectDir=/cygdrive/e/Wekan_work/wekan-dev_qisq
set rsyncDir=%projectDir%/rsync_work

::rsync -avz --progress /cygdrive/e/Wekan_work/wekan-dev_qisq/src admin@192.168.101.130::wekan_ftp

rsync -avz --delete --progress --password-file=%rsyncDir%/rsyncd.secrets --exclude-from=%rsyncDir%/exclude_list.txt %projectDir%/src/ admin@10.10.6.56::wekan_ftp