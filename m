From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: mediatek: mark dummy helpers as 'static inline'
Date: Wed, 26 Sep 2018 21:38:09 +0200
Message-ID: <20180926193818.2481220-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

mtk_eint_set_debounce and mtk_eint_find_irq are defined as stub functions
in a header file, but without marking them as 'static inline', we get
a copy for each file that includes the header:

drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.o: In function `mtk_eint_set_debounce':
pinctrl-mtk-common-v2.c:(.text+0x134): multiple definition of `mtk_eint_set_debounce'
drivers/pinctrl/mediatek/pinctrl-moore.o:pinctrl-moore.c:(.text+0x7d0): first defined here
drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.o: In function `mtk_eint_find_irq':
pinctrl-mtk-common-v2.c:(.text+0x13c): multiple definition of `mtk_eint_find_irq'

Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/mediatek/mtk-eint.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index c286a9b940f2..48468d0fae68 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -92,13 +92,13 @@ static inline int mtk_eint_do_resume(struct mtk_eint *eint)
 	return -EOPNOTSUPP;
 }
 
-int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_n,
+static inline int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_n,
 			  unsigned int debounce)
 {
 	return -EOPNOTSUPP;
 }
 
-int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
+static inline int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.18.0
