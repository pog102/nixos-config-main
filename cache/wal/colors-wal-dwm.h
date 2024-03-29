static const char norm_fg[] = "#d0dce4";
static const char norm_bg[] = "#10181e";
static const char norm_border[] = "#919a9f";

static const char sel_fg[] = "#d0dce4";
static const char sel_bg[] = "#48758D";
static const char sel_border[] = "#d0dce4";

static const char urg_fg[] = "#d0dce4";
static const char urg_bg[] = "#3B6A85";
static const char urg_border[] = "#3B6A85";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
