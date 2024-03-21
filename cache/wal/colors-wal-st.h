const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#10181e", /* black   */
  [1] = "#3B6A85", /* red     */
  [2] = "#48758D", /* green   */
  [3] = "#677B8B", /* yellow  */
  [4] = "#5F8EA6", /* blue    */
  [5] = "#7DA8C1", /* magenta */
  [6] = "#92B3C7", /* cyan    */
  [7] = "#d0dce4", /* white   */

  /* 8 bright colors */
  [8]  = "#919a9f",  /* black   */
  [9]  = "#3B6A85",  /* red     */
  [10] = "#48758D", /* green   */
  [11] = "#677B8B", /* yellow  */
  [12] = "#5F8EA6", /* blue    */
  [13] = "#7DA8C1", /* magenta */
  [14] = "#92B3C7", /* cyan    */
  [15] = "#d0dce4", /* white   */

  /* special colors */
  [256] = "#10181e", /* background */
  [257] = "#d0dce4", /* foreground */
  [258] = "#d0dce4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
