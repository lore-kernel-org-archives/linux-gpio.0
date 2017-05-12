From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: zynq: remove unneeded (void *) casts in of_match_table
Date: Sat, 13 May 2017 01:18:45 +0900
Message-ID: <1494605925-6487-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

of_device_id::data is an opaque pointer.  No explicit cast is needed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpio-zynq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 6b4d10d..ed87c9a 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -651,9 +651,8 @@ static const struct zynq_platform_data zynq_gpio_def = {
 };
 
 static const struct of_device_id zynq_gpio_of_match[] = {
-	{ .compatible = "xlnx,zynq-gpio-1.0", .data = (void *)&zynq_gpio_def },
-	{ .compatible = "xlnx,zynqmp-gpio-1.0",
-					.data = (void *)&zynqmp_gpio_def },
+	{ .compatible = "xlnx,zynq-gpio-1.0", .data = &zynq_gpio_def },
+	{ .compatible = "xlnx,zynqmp-gpio-1.0", .data = &zynqmp_gpio_def },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
-- 
2.7.4
