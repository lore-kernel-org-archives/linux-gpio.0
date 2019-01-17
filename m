From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] Documentation: gpio: driver: fix wire name for I2C
Date: Thu, 17 Jan 2019 11:13:21 +0100
Message-ID: <20190117101321.2164-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Typo: the data line is called "SDA" not "SCA".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/driver-api/gpio/driver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index a92d8837b62b..3043167fc557 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -135,7 +135,7 @@ This configuration is normally used as a way to achieve one of two things:
 - inverse wire-OR on an I/O line, for example a GPIO line, making it possible
   for any driving stage on the line to drive it low even if any other output
   to the same line is simultaneously driving it high. A special case of this
-  is driving the SCL and SCA lines of an I2C bus, which is by definition a
+  is driving the SCL and SDA lines of an I2C bus, which is by definition a
   wire-OR bus.
 
 Both usecases require that the line be equipped with a pull-up resistor. This
-- 
2.11.0
