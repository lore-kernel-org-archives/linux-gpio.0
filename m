From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] gpio: fix kernel-doc notation warning for 'request_key'
Date: Mon, 3 Sep 2018 12:55:30 -0700
Message-ID: <e80a35c7-a9f4-46bf-7036-11375f368ba5@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix kernel-doc warning for missing struct member 'request_key':

../include/linux/gpio/driver.h:142: warning: Function parameter or member 'request_key' not described in 'gpio_irq_chip'

Fixes: 39c3fd58952d ("kernel/irq: Extend lockdep class for request mutex")

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 include/linux/gpio/driver.h |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- lnx-419-rc2.orig/include/linux/gpio/driver.h
+++ lnx-419-rc2/include/linux/gpio/driver.h
@@ -66,9 +66,15 @@ struct gpio_irq_chip {
 	/**
 	 * @lock_key:
 	 *
-	 * Per GPIO IRQ chip lockdep classes.
+	 * Per GPIO IRQ chip lockdep class for IRQ lock.
 	 */
 	struct lock_class_key *lock_key;
+
+	/**
+	 * @request_key:
+	 *
+	 * Per GPIO IRQ chip lockdep class for IRQ request.
+	 */
 	struct lock_class_key *request_key;
 
 	/**
