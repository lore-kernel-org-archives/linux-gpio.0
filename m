From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] pinctrl: rza1: constify gpio_chip structure
Date: Tue, 11 Jul 2017 13:22:37 -0500
Message-ID: <20170711182237.GA21702@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
List-Id: linux-gpio@vger.kernel.org

This structure is only used to copy into other structure, so declare
it as const.

This issue was detected using Coccinelle and the following semantic patch:

@r disable optional_qualifier@
identifier i;
position p;
@@
static struct gpio_chip i@p = { ... };

@ok@
identifier r.i;
expression e;
position p;
@@
e = i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct gpio_chip e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct gpio_chip i = { ... };

In the following log you can see a significant difference in the code size
and data segment, hence in the dec segment. This log is the output
of the size command, before and after the code change:

before:
   text    data     bss     dec     hex filename
  11866    3520     128   15514    3c9a drivers/pinctrl/pinctrl-rza1.o

after:
   text    data     bss     dec     hex filename
  11539    3464     128   15131    3b1b drivers/pinctrl/pinctrl-rza1.o

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index dc164da..7e30134 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -723,7 +723,7 @@ static void rza1_gpio_set(struct gpio_chip *chip, unsigned int gpio,
 	rza1_pin_set(port, gpio, value);
 }
 
-static struct gpio_chip rza1_gpiochip_template = {
+static const struct gpio_chip rza1_gpiochip_template = {
 	.request		= rza1_gpio_request,
 	.free			= rza1_gpio_free,
 	.get_direction		= rza1_gpio_get_direction,
-- 
2.5.0
