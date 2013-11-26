From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [RFC v1 3/9] gpio: davinci: use chained_irq_enter/chained_irq_exit API
Date: Tue, 26 Nov 2013 21:40:09 +0200
Message-ID: <1385494815-15740-4-git-send-email-grygorii.strashko@ti.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1385494815-15740-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

It's unsafe to call IRQ chip callbacks (.irq_mask/irq_unmask/irq_ack)
from chained IRQ handler directly. Because, Davinci GPIO block is used
by different SoCs, which, in turn, have different Main IRQ controllers
(Davinci - aintc, cp-intc; Keystone - arm-gic) which may introduce
diffrent set of IRQ chip callbacks. As result, call of
gpio_irq_handler() on Keysone will simply cause crash the system,
because ARM-GIC implements .irq_eoi() instead of .irq_ack().

Hence, fix it by using Kernel chained_irq_enter/chained_irq_exit APIs as
they are intended to handle exact such cases.

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 drivers/gpio/gpio-davinci.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 70b5f2f..ee7a2df 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -22,6 +22,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/gpio-davinci.h>
+#include <linux/irqchip/chained_irq.h>
 
 struct davinci_gpio_regs {
 	u32	dir;
@@ -321,8 +322,7 @@ gpio_irq_handler(unsigned irq, struct irq_desc *desc)
 		mask <<= 16;
 
 	/* temporarily mask (level sensitive) parent IRQ */
-	desc->irq_data.chip->irq_mask(&desc->irq_data);
-	desc->irq_data.chip->irq_ack(&desc->irq_data);
+	chained_irq_enter(irq_desc_get_chip(desc), desc);
 	while (1) {
 		u32		status;
 		int		bit;
@@ -343,7 +343,7 @@ gpio_irq_handler(unsigned irq, struct irq_desc *desc)
 						 d->chip.base + bit));
 		}
 	}
-	desc->irq_data.chip->irq_unmask(&desc->irq_data);
+	chained_irq_exit(irq_desc_get_chip(desc), desc);
 	/* now it may re-trigger */
 }
 
-- 
1.7.9.5
