From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: [PATCH] extend documentation for gpiod_set_array() functions
Date: Thu, 05 Mar 2015 14:36:36 +0100
Message-ID: <1462335.iZUEobXSUA@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:55630 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932447AbbCENgj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Mar 2015 08:36:39 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>

Extend the documentation for the gpiod_set_array() functions and elaborate
a bit on possible use cases.

Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
---
 Documentation/gpio/consumer.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index d29a972..c21c131 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -259,6 +259,26 @@ GPIOs belonging to the same bank or chip simultaneously if supported by the
 corresponding chip driver. In that case a significantly improved performance
 can be expected. If simultaneous setting is not possible the GPIOs will be set
 sequentially.
+
+The gpiod_set_array() functions take three arguments:
+	* array_size	- the number of array elements
+	* desc_array	- an array of GPIO descriptors
+	* value_array	- an array of values to assign to the GPIOs
+
+The descriptor array can be obtained using the gpiod_get_array() function
+or one of its variants. If the group of descriptors returned by that function
+matches the desired group of GPIOs, those GPIOs can be set by simply using
+the struct gpio_descs returned by gpiod_get_array():
+
+	struct gpio_descs *my_gpio_descs = gpiod_get_array(...);
+	gpiod_set_array(my_gpio_descs->ndescs, my_gpio_descs->desc,
+			my_gpio_values);
+
+It is also possible to set a completely arbitrary array of descriptors. The
+descriptors may be obtained using any combination of gpiod_get() and
+gpiod_get_array(). Afterwards the array of descriptors has to be setup
+manually before it can be used with gpiod_set_array().
+
 Note that for optimal performance GPIOs belonging to the same chip should be
 contiguous within the array of descriptors.
 
-- 
2.0.5


