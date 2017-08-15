From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] gpio: add gpio_add_lookup_tables() to add several tables
 at once
Date: Mon, 14 Aug 2017 21:59:55 -0700
Message-ID: <20170815045955.GA40297@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33839 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751147AbdHOE77 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2017 00:59:59 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When converting legacy board to use gpiod API() there might be several
lookup tables in board file, let's provide a way to register them all at
once.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

V2:
- added the !CONFIG_GPIOLIB stub (Andy)
- changed size from unsigned int to size_t at Mika's suggestion
- added Reviewed-bys.

 drivers/gpio/gpiolib.c       | 17 +++++++++++++++++
 include/linux/gpio/machine.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a42a1eea5714..667289ca4913 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3010,6 +3010,23 @@ void gpiod_add_lookup_table(struct gpiod_lookup_table *table)
 	mutex_unlock(&gpio_lookup_lock);
 }
 
+/**
+ * gpiod_add_lookup_tables() - register GPIO device consumers
+ * @tables: list of tables of consumers to register
+ * @n: number of tables in the list
+ */
+void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n)
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
index f738d50cc17d..ec80fa7c0c7d 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -58,11 +58,14 @@ struct gpiod_lookup_table {
 
 #ifdef CONFIG_GPIOLIB
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table);
+void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n);
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table);
 #else
 static inline
 void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
 static inline
+void gpiod_add_lookup_tables(struct gpiod_lookup_table **tables, size_t n) {}
+static inline
 void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
 #endif
 
-- 
2.14.0.434.g98096fd7a8-goog


-- 
Dmitry
