#ifndef FLUTTER_my_APPLICATION_H_
#define FLUTTER_my_APPLICATION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(myApplication, my_application, my, APPLICATION,
                     GtkApplication)

/**
 * my_application_new:
 *
 * Creates a new Flutter-based application.
 *
 * Returns: a new #myApplication.
 */
myApplication* my_application_new();

#endif  // FLUTTER_my_APPLICATION_H_
