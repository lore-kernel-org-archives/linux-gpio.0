From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] Documentation: gpio: Fix return type of gpiod_set_raw_array_value*()
Date: Thu, 27 Sep 2018 13:38:08 +0200
Message-ID: <20180927113810.30721-2-geert+renesas@glider.be>
References: <20180927113810.30721-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927113810.30721-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laura Abbott <labbott@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

The return type of gpiod_set_raw_array_value() and
gpiod_set_raw_array_value_cansleep() was changed from void to int, but
the doc update was forgotten.

Fixes: 3027743f83f867d8 ("gpio: Remove VLA from gpiolib")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebase on top of gpio array rework.
---
 Documentation/driver-api/gpio/consumer.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index cf992e5ab976e62a..ba4973829faef238 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -344,18 +344,18 @@ The following functions get or set the values of an array of GPIOs::
 				   struct gpio_desc **desc_array,
 				   struct gpio_array *array_info,
 				   unsigned long *value_bitmap)
-	void gpiod_set_raw_array_value(unsigned int array_size,
-				       struct gpio_desc **desc_array,
-				       struct gpio_array *array_info,
-				       unsigned long *value_bitmap)
+	int gpiod_set_raw_array_value(unsigned int array_size,
+				      struct gpio_desc **desc_array,
+				      struct gpio_array *array_info,
+				      unsigned long *value_bitmap)
 	void gpiod_set_array_value_cansleep(unsigned int array_size,
 					    struct gpio_desc **desc_array,
 					    struct gpio_array *array_info,
 					    unsigned long *value_bitmap)
-	void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
-						struct gpio_desc **desc_array,
-						struct gpio_array *array_info,
-						unsigned long *value_bitmap)
+	int gpiod_set_raw_array_value_cansleep(unsigned int array_size,
+					       struct gpio_desc **desc_array,
+					       struct gpio_array *array_info,
+					       unsigned long *value_bitmap)
 
 The array can be an arbitrary set of GPIOs. The functions will try to access
 GPIOs belonging to the same bank or chip simultaneously if supported by the
-- 
2.17.1
