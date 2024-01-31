#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include "utils.h"

#define IDMA_BASE 		 0xfef00000
#define TCDM_BASE      0xfff00000
#define L2_BASE        0x1C001000
#define L3_BASE        0x80000000

#define IDMA_SRC_ADDR_OFFSET         0x00
#define IDMA_DST_ADDR_OFFSET         0x04
#define IDMA_LENGTH_OFFSET           0x08
#define IDMA_NEXT_ID_OFFSET          0x20
#define IDMA_REPS_2_OFFSET           0x18
int main() {

  int baud_rate = 115200;
  int test_freq = 100000000;
  uart_set_cfg(0,(test_freq/baud_rate)>>4);

  int volatile  * ptr;
  int buff,b;
  int err = 0;
  for(int i = 0; i<100; i++){
    ptr = (int *) TCDM_BASE + i*4;
    *ptr = i;
  }
  ptr = (int *) (IDMA_BASE + IDMA_SRC_ADDR_OFFSET);
  *ptr = TCDM_BASE;
  ptr = (int *) (IDMA_BASE + IDMA_DST_ADDR_OFFSET);
  *ptr = L2_BASE;
  ptr = (int *) (IDMA_BASE + IDMA_LENGTH_OFFSET);
  *ptr = 0x00000190;
  ptr = (int *) (IDMA_BASE + IDMA_NEXT_ID_OFFSET);
  buff = *ptr;
  for(int i = 0; i<100; i++){
    ptr = (int *) L2_BASE + i;
    b = *ptr;
    if(b=!i)
      err++;
  }
  printf("Num errors: %d out of 100!\r\n",err);
  uart_wait_tx_done();
  return 0;
}
