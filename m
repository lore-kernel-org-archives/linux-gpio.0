From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] Documentation: gpio: Fix return type of gpiod_set_raw_array_value*()
Date: Wed,  5 Sep 2018 11:05:53 +0200
Message-ID: <20180905090555.9888-2-geert+renesas@glider.be>
References: <20180905090555.9888-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905090555.9888-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laura Abbott <labbott@redhat.com>, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

The return type of gpiod_set_raw_array_value() and
gpiod_set_raw_array_value_cansleep() was changed from void to int, but
the doc update was forgotten.

Fixes: 3027743f83f867d8 ("gpio: Remove VLA from gpiolib")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/driver-api/gpio/consumer.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index aa03f389d41d6a79..a4e340c1859439ad 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -337,15 +337,15 @@ The following functions get or set the values of an array of GPIOs::
 	void gpiod_set_array_value(unsigned int array_size,
 				   struct gpio_desc **desc_array,
 				   int *value_array)
-	void gpiod_set_raw_array_value(unsigned int array_size,
-				       struct gpio_desc **desc_array,
-				       int *value_array)
+	int gpiod_set_raw_array_value(unsigned int array_size,
+				      struct gpio_desc **desc_array,
+				      int *value_array)
 	void gpiod_set_array_value_cansleep(unsigned int array_size,
 					    struct gpio_desc **desc_array,
 					    int *value_array)
-	void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
-						struct gpio_desc **desc_array,
-						int *value_array)
+	int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
+					       struct gpio_desc **desc_array,
+					       int *value_array)
 
 The array can be an arbitrary set of GPIOs. The functions will try to access
 GPIOs belonging to the same bank or chip simultaneously if supported by the
-- 
2.17.1
