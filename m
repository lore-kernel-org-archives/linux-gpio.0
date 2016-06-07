From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 7/9] pinctrl: zynq: make it explicitly non-modular
Date: Mon, 6 Jun 2016 22:43:06 -0400
Message-ID: <1465267388-17884-8-git-send-email-paul.gortmaker@windriver.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

config PINCTRL_ZYNQ
        bool "Pinctrl driver for Xilinx Zynq"

=2E..meaning that it currently is not being built as a module by anyone=
=2E

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: "S=C3=B6ren Brinkmann" <soren.brinkmann@xilinx.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/pinctrl-zynq.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-z=
ynq.c
index 8fdc60c5aeaf..7afdbede6823 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -20,7 +20,7 @@
  */
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -1210,7 +1210,6 @@ static const struct of_device_id zynq_pinctrl_of_=
match[] =3D {
 	{ .compatible =3D "xlnx,pinctrl-zynq" },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, zynq_pinctrl_of_match);
=20
 static struct platform_driver zynq_pinctrl_driver =3D {
 	.driver =3D {
@@ -1225,13 +1224,3 @@ static int __init zynq_pinctrl_init(void)
 	return platform_driver_register(&zynq_pinctrl_driver);
 }
 arch_initcall(zynq_pinctrl_init);
-
-static void __exit zynq_pinctrl_exit(void)
-{
-	platform_driver_unregister(&zynq_pinctrl_driver);
-}
-module_exit(zynq_pinctrl_exit);
-
-MODULE_AUTHOR("S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>");
-MODULE_DESCRIPTION("Xilinx Zynq pinctrl driver");
-MODULE_LICENSE("GPL");
--=20
2.8.0
