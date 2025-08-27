#define CMDLENGTH 45
#define DELIMITER "  "

const Block blocks[] = {
  /* script, refresh, signal */

	BLOCK("~/scripts/blocks/net-rate.sh",   5,         23),
	BLOCK("~/scripts/blocks/ram-free.sh",   5,         22),
	BLOCK("~/scripts/blocks/cpu-use.sh",    5,         21),
	BLOCK("~/scripts/blocks/cpu-temp.sh",   5,         20),

  // TODO: Update volume in a hook rather than querying it every 2 seconds
	BLOCK("~/scripts/blocks/volume.sh",     2,         19),
  BLOCK("~/scripts/blocks/battery.sh",  5,         17),
	BLOCK("~/scripts/blocks/datetime.sh",   15,        18),
};
