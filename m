From: <sean.wang@mediatek.com>
Subject: [PATCH 2/4] pinctrl: mediatek: add no eint function for pin define
Date: Fri, 21 Sep 2018 12:07:36 +0800
Message-ID: <554196e837f622eea62d11602b7c88721d6a776d.1537502494.git.sean.wang@mediatek.com>
References: <ab85fbee4d8286cbedbcc7317f89dc0d2dd83965.1537502494.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ab85fbee4d8286cbedbcc7317f89dc0d2dd83965.1537502494.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mars Cheng <mars.cheng@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

From: Mars Cheng <mars.cheng@mediatek.com>

Add NO_EINT_SUPPORT back to pinctrl-mtk-common-v2.h as the alias of
EINT_NA to indicate that some pin not capable of being controlled as eint
and that is required by pinctrl-paris based driver as old
pinctrl-mtk-common.h already had.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index b618042..991c1c5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -19,6 +19,7 @@
 #define MTK_PULLUP     1
 
 #define EINT_NA	U16_MAX
+#define NO_EINT_SUPPORT	EINT_NA
 
 #define PIN_FIELD_CALC(_s_pin, _e_pin, _i_base, _s_addr, _x_addrs,      \
 		       _s_bit, _x_bits, _sz_reg, _fixed) {		\
-- 
2.7.4
