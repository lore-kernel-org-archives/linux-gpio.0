From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] pinctrl: qcom: ssbi-gpio: constify gpio_chip structure
Date: Tue, 11 Jul 2017 13:39:50 -0500
Message-ID: <20170711183950.GA26899@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
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
  17061    6992       0   24053    5df5 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.o

after:
   text    data     bss     dec     hex filename
  16777    6904       0   23681    5c81 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.o

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index d3f5501d..f53e32a 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -588,7 +588,7 @@ static void pm8xxx_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 #define pm8xxx_gpio_dbg_show NULL
 #endif
 
-static struct gpio_chip pm8xxx_gpio_template = {
+static const struct gpio_chip pm8xxx_gpio_template = {
 	.direction_input = pm8xxx_gpio_direction_input,
 	.direction_output = pm8xxx_gpio_direction_output,
 	.get = pm8xxx_gpio_get,
-- 
2.5.0
