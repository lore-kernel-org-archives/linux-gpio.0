From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 1/2] pinctrl: nand: meson-gxbb: fix missing data pins
Date: Wed, 9 May 2018 22:08:26 +0000
Message-ID: <20180509220827.22286-2-yixun.lan@amlogic.com>
References: <20180509220827.22286-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509220827.22286-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The data pin 0-7 of the NAND controller are actually missing from
the nand pinctrl group, so we fix it here.

Fixes: cd1e3b01c7d3 ("pinctrl: amlogic: gxbb: add nand pins")
Reported-by: Liang Yang <liang.yang@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 9079020259c5..2c97a2e07a5f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -627,8 +627,8 @@ static const char * const sdio_groups[] = {
 };
 
 static const char * const nand_groups[] = {
-	"nand_ce0", "nand_ce1", "nand_rb0", "nand_ale", "nand_cle",
-	"nand_wen_clk", "nand_ren_wr", "nand_dqs",
+	"emmc_nand_d07", "nand_ce0", "nand_ce1", "nand_rb0", "nand_ale",
+	"nand_cle", "nand_wen_clk", "nand_ren_wr", "nand_dqs",
 };
 
 static const char * const uart_a_groups[] = {
-- 
2.17.0
