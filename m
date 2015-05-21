From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] gpiolib: Grammar s/an negative/a negative/
Date: Thu, 21 May 2015 14:07:50 +0200
Message-ID: <1432210070-21798-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <trivial@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/gpio/consumer.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index c21c1313f09e55be..15ec6d69102cf4ff 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -290,7 +290,7 @@ corresponding to a given GPIO using the following call:
 
 	int gpiod_to_irq(const struct gpio_desc *desc)
 
-It will return an IRQ number, or an negative errno code if the mapping can't be
+It will return an IRQ number, or a negative errno code if the mapping can't be
 done (most likely because that particular GPIO cannot be used as IRQ). It is an
 unchecked error to use a GPIO that wasn't set up as an input using
 gpiod_direction_input(), or to use an IRQ number that didn't originally come
-- 
1.9.1

