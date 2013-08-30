From: Frank Rowand <frank.rowand@sonymobile.com>
Subject: [PATCH] gpio: null pointer dereference in error handling in gpiolib.c
Date: Thu, 29 Aug 2013 22:10:32 -0700
Message-ID: <52202948.7010303@sonymobile.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f65.google.com ([209.85.160.65]:37907 "EHLO
	mail-pb0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752577Ab3H3FKg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2013 01:10:36 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: grant.likely@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@sonymobile.com


Avoid calling desc_to_gpio() if desc->chip is NULL, as this will
cause a kernel panic.

In the code above the calls, there is a test for !chip, which
comes to the 'fail' label if true. In this case, the code
panics, since desc_to_gpio() uses desc->chip to look up the
gpio number.

An RFC patch that explained the cause of one example of panic when
desc->chip is NULL and fixed that example
(http://lkml.indiana.edu/hypermail/linux/kernel/1308.3/01473.html)
was accepted.  This patch fixes the remaining locations which have
the same problem.

Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>

---
  drivers/gpio/gpiolib.c |   33 	24 +	9 -	0 !
  1 file changed, 24 insertions(+), 9 deletions(-)

Index: b/drivers/gpio/gpiolib.c
===================================================================
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1676,9 +1676,14 @@ lose:
  	return status;
  fail:
  	spin_unlock_irqrestore(&gpio_lock, flags);
-	if (status)
-		pr_debug("%s: gpio-%d status %d\n", __func__,
-			 desc_to_gpio(desc), status);
+	if (status) {
+		if (desc->chip) {
+			pr_debug("%s: gpio-%d status %d\n", __func__,
+				 desc_to_gpio(desc), status);
+		} else {
+			pr_debug("%s: gpio-?? status %d\n", __func__, status);
+		}
+	}
  	return status;
  }

@@ -1745,9 +1750,14 @@ lose:
  	return status;
  fail:
  	spin_unlock_irqrestore(&gpio_lock, flags);
-	if (status)
-		pr_debug("%s: gpio-%d status %d\n", __func__,
-			 desc_to_gpio(desc), status);
+	if (status) {
+		if (desc->chip) {
+			pr_debug("%s: gpio-%d status %d\n", __func__,
+				 desc_to_gpio(desc), status);
+		} else {
+			pr_debug("%s: gpio-?? status %d\n", __func__, status);
+		}
+	}
  	return status;
  }

@@ -1795,9 +1805,14 @@ static int gpiod_set_debounce(struct gpi

  fail:
  	spin_unlock_irqrestore(&gpio_lock, flags);
-	if (status)
-		pr_debug("%s: gpio-%d status %d\n", __func__,
-			 desc_to_gpio(desc), status);
+	if (status) {
+		if (desc->chip) {
+			pr_debug("%s: gpio-%d status %d\n", __func__,
+				 desc_to_gpio(desc), status);
+		} else {
+			pr_debug("%s: gpio-?? status %d\n", __func__, status);
+		}
+	}

  	return status;
  }
