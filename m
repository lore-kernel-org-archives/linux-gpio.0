From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] gpio: add gpio_add_lookup_tables() to add several tables at
 once
Date: Tue, 25 Jul 2017 13:58:00 -0700
Message-ID: <20170725205800.GA25245@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

When converting legacy board to use gpiod API() there migt be several
lookup tables in board file, let's provide a way to register them all at
once.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c       | 18 ++++++++++++++++++
 include/linux/gpio/machine.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a42a1eea5714..f8f4f8b61db8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3010,6 +3010,24 @@ void gpiod_add_lookup_table(struct gpiod_lookup_table *table)
 	mutex_unlock(&gpio_lookup_lock);
 }
 
+/**
+ * gpiod_add_lookup_tables() - register GPIO device consumers
+ * @tables: list of table of consumers to register
+ * @n: number of tables in the list
+ */
+void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables,
+			     unsigned int n)
+{
+	unsigned int i;
+
+	mutex_lock(&gpio_lookup_lock);
+
+	for (i = 0; i < n; i++)
+		list_add_tail(&tables[i]->list, &gpio_lookup_list);
+
+	mutex_unlock(&gpio_lookup_lock);
+}
+
 /**
  * gpiod_remove_lookup_table() - unregister GPIO device consumers
  * @table: table of consumers to unregister
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index f738d50cc17d..6f7ddce88fb8 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -58,6 +58,8 @@ struct gpiod_lookup_table {
 
 #ifdef CONFIG_GPIOLIB
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
+void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables,
+			     unsigned int n);
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
 #else
 static inline
-- 
2.14.0.rc0.400.g1c36432dff-goog


-- 
Dmitry
