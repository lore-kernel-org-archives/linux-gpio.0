From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: aspeed: fix compile testing warning
Date: Mon,  9 Jul 2018 16:56:03 +0200
Message-ID: <20180709145612.4166409-1-arnd@arndb.de>
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
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Gcc cannot always see that BUG_ON(1) is guaranteed to not
return, so we get a warning message in some configurations:

drivers/gpio/gpio-aspeed.c: In function 'bank_reg':
drivers/gpio/gpio-aspeed.c:244:1: error: control reaches end of non-void function [-Werror=return-type]

Using a plain BUG() is easier here and avoids the problem.

Fixes: 44ddf559d579 ("gpio: aspeed: Rework register type accessors")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 1e00f4045f9d..2342e154029b 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -240,7 +240,7 @@ static inline void __iomem *bank_reg(struct aspeed_gpio *gpio,
 	case reg_cmdsrc1:
 		return gpio->base + bank->cmdsrc_regs + GPIO_CMDSRC_1;
 	}
-	BUG_ON(1);
+	BUG();
 }
 
 #define GPIO_BANK(x)	((x) >> 5)
-- 
2.9.0
