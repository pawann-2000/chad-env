#define CMDLENGTH 45
#define DELIMITER "  "

const Block blocks[] = {
  /* script, refresh, signal */

	BLOCK("~/chad-env/dwmblocks-async/scripts/net-rate.sh",   5,         23),
	BLOCK("~/chad-env/dwmblocks-async/scripts/ram-free.sh",   5,         22),
	BLOCK("~/chad-env/dwmblocks-async/scripts/cpu-use.sh",    5,         21),
	BLOCK("~/chad-env/dwmblocks-async/scripts/cpu-temp.sh",   5,         20),
	BLOCK("~/chad-env/dwmblocks-async/scripts/volume.sh",     2,         19),
  BLOCK("~/chad-env/dwmblocks-async/scripts/battery.sh",    5,         17),
  BLOCK("~/chad-env/dwmblocks-async/scripts/datetime.sh",   15,        18),
};
