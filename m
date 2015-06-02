From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [PATCH] fix documentation after renaming gpiod_set_array to gpiod_set_array_value
Date: Tue, 02 Jun 2015 11:38:06 +0200
Message-ID: <3735613.aCR2lpskqX@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:57715 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756456AbbFBJiJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 05:38:09 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

Patch "gpiolib: rename gpiod_set_array to gpiod_set_array_value" omitted
to also change the function names in the documentation. Let's fix that.

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
 Documentation/gpio/consumer.txt |   28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index c21c131..bbc8b58 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -241,18 +241,18 @@ Set multiple GPIO outputs with a single function call
 -----------------------------------------------------
 The following functions set the output values of an array of GPIOs:
 
-	void gpiod_set_array(unsigned int array_size,
-			     struct gpio_desc **desc_array,
-			     int *value_array)
-	void gpiod_set_raw_array(unsigned int array_size,
-				 struct gpio_desc **desc_array,
-				 int *value_array)
-	void gpiod_set_array_cansleep(unsigned int array_size,
-				      struct gpio_desc **desc_array,
-				      int *value_array)
-	void gpiod_set_raw_array_cansleep(unsigned int array_size,
-					  struct gpio_desc **desc_array,
-					  int *value_array)
+	void gpiod_set_array_value(unsigned int array_size,
+				   struct gpio_desc **desc_array,
+				   int *value_array)
+	void gpiod_set_raw_array_value(unsigned int array_size,
+				       struct gpio_desc **desc_array,
+				       int *value_array)
+	void gpiod_set_array_value_cansleep(unsigned int array_size,
+					    struct gpio_desc **desc_array,
+					    int *value_array)
+	void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
+						struct gpio_desc **desc_array,
+						int *value_array)
 
 The array can be an arbitrary set of GPIOs. The functions will try to set
 GPIOs belonging to the same bank or chip simultaneously if supported by the
@@ -271,8 +271,8 @@ matches the desired group of GPIOs, those GPIOs can be set by simply using
 the struct gpio_descs returned by gpiod_get_array():
 
 	struct gpio_descs *my_gpio_descs = gpiod_get_array(...);
-	gpiod_set_array(my_gpio_descs->ndescs, my_gpio_descs->desc,
-			my_gpio_values);
+	gpiod_set_array_value(my_gpio_descs->ndescs, my_gpio_descs->desc,
+			      my_gpio_values);
 
 It is also possible to set a completely arbitrary array of descriptors. The
 descriptors may be obtained using any combination of gpiod_get() and

--
2.3.6

