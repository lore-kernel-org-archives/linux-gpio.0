From: Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH] Documentation: gpio: remove duplicated lines
Date: Fri, 10 May 2019 11:03:39 +0200
Message-ID: <20190510090339.17211-1-luca@lucaceresoli.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The 'default (active high)' lines are repeated twice. Avoid people stare at
their screens looking for differences.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/driver-api/gpio/consumer.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index 5e4d8aa68913..23d68c321c5c 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -283,8 +283,6 @@ To summarize::
   gpiod_set_value(desc, 1);          default (active high)  high
   gpiod_set_value(desc, 0);          active low             high
   gpiod_set_value(desc, 1);          active low             low
-  gpiod_set_value(desc, 0);          default (active high)  low
-  gpiod_set_value(desc, 1);          default (active high)  high
   gpiod_set_value(desc, 0);          open drain             low
   gpiod_set_value(desc, 1);          open drain             high impedance
   gpiod_set_value(desc, 0);          open source            high impedance
-- 
2.21.0
