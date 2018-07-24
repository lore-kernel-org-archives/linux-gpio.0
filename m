From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: mediatek: include chained_irq.h header
Date: Tue, 24 Jul 2018 13:57:10 +0200
Message-ID: <20180724115722.1274065-1-arnd@arndb.de>
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
To: Sean Wang <sean.wang@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Some randconfig builds fail in the mtk-eint driver:

drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_irq_handler':
drivers/pinctrl/mediatek/mtk-eint.c:324:2: error: implicit declaration of function 'chained_irq_enter'; did you mean 'rcu_irq_enter'? [-Werror=implicit-function-declaration]
  chained_irq_enter(chip, desc);
  ^~~~~~~~~~~~~~~~~
  rcu_irq_enter
drivers/pinctrl/mediatek/mtk-eint.c:367:2: error: implicit declaration of function 'chained_irq_exit'; did you mean 'rcu_irq_exit'? [-Werror=implicit-function-declaration]

The functions are declared in linux/irqchip/chained_irq.h, and including
that header makes it build in all configurations.

Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 30f3316747e2..a613e546717a 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/gpio.h>
 #include <linux/io.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
-- 
2.18.0
