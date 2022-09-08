/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#7daea3",     /* after initialization */
	[INPUT] =  "#e3a84e",   /* during input */
	[FAILED] = "#ea6962",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
