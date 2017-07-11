From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] pinctrl: qcom: msm: constify gpio_chip structure
Date: Tue, 11 Jul 2017 13:34:14 -0500
Message-ID: <20170711183414.GA24866@embeddedgus>
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
  13129    2808     192   16129    3f01 drivers/pinctrl/qcom/pinctrl-msm.o

after:
   text    data     bss     dec     hex filename
  12839    2720     192   15751    3d87 drivers/pinctrl/qcom/pinctrl-msm.o

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 273badd..245ccfd 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -521,7 +521,7 @@ static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 #define msm_gpio_dbg_show NULL
 #endif
 
-static struct gpio_chip msm_gpio_template = {
+static const struct gpio_chip msm_gpio_template = {
 	.direction_input  = msm_gpio_direction_input,
 	.direction_output = msm_gpio_direction_output,
 	.get_direction    = msm_gpio_get_direction,
-- 
2.5.0
