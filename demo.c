#include "FreeRTOS.h"
#include "task.h"
#include <assert.h>
#include <stdio.h>

static void Task(void *arg) {
  for (;;) {
    printf("%s\n", arg);
    vTaskDelay(pdMS_TO_TICKS(1000));
  }
}
void vApplicationMallocFailedHook(void) { puts("Malloc failed\n"); }
void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName) {
  printf("StackOverflow: task %s %p\n", pcTaskName, xTask);
}
int main(void) {
  BaseType_t status =
      xTaskCreate(Task, "task", 4096, "Hello", tskIDLE_PRIORITY + 1, NULL);
  assert(status == pdPASS);
  vTaskStartScheduler();
  assert(0);
}
