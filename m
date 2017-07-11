From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] gpio: altera-a10sr: constify gpio_chip structure
Date: Tue, 11 Jul 2017 17:15:38 -0500
Message-ID: <20170711221538.GA8001@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Thor Thayer <thor.thayer@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
List-Id: linux-gpio@vger.kernel.org

This structure is only used to copy into another structure, so declare
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
   1954     600       0    2554     9fa drivers/gpio/gpio-altera-a10sr.o

after:
   text    data     bss     dec     hex filename
   1655     512       0    2167     877 drivers/gpio/gpio-altera-a10sr.o

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/gpio/gpio-altera-a10sr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
index 16a8951..6b11f13 100644
--- a/drivers/gpio/gpio-altera-a10sr.c
+++ b/drivers/gpio/gpio-altera-a10sr.c
@@ -71,7 +71,7 @@ static int altr_a10sr_gpio_direction_output(struct gpio_chip *gc,
 	return -EINVAL;
 }
 
-static struct gpio_chip altr_a10sr_gc = {
+static const struct gpio_chip altr_a10sr_gc = {
 	.label = "altr_a10sr_gpio",
 	.owner = THIS_MODULE,
 	.get = altr_a10sr_gpio_get,
-- 
2.5.0
