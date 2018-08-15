From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] pinctrl: lpc18xx: mark expected switch fall-throughs
Date: Wed, 15 Aug 2018 12:10:35 -0500
Message-ID: <20180815171035.GA17360@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Joachim Eastwood <manabian@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-gpio@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 1292308 ("Missing break in switch")
Addresses-Coverity-ID: 1292309 ("Missing break in switch")
Addresses-Coverity-ID: 1309546 ("Missing break in switch")
Addresses-Coverity-ID: 1357369 ("Missing break in switch")
Addresses-Coverity-ID: 1357389 ("Missing break in switch")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/pinctrl/pinctrl-lpc18xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index 190f17e..a14bc5e 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -844,8 +844,11 @@ static int lpc18xx_pconf_get_pin(struct pinctrl_dev *pctldev, unsigned param,
 		*arg = (reg & LPC18XX_SCU_PIN_EHD_MASK) >> LPC18XX_SCU_PIN_EHD_POS;
 		switch (*arg) {
 		case 3: *arg += 5;
+			/* fall through */
 		case 2: *arg += 5;
+			/* fall through */
 		case 1: *arg += 3;
+			/* fall through */
 		case 0: *arg += 4;
 		}
 		break;
@@ -1060,8 +1063,11 @@ static int lpc18xx_pconf_set_pin(struct pinctrl_dev *pctldev, unsigned param,
 
 		switch (param_val) {
 		case 20: param_val -= 5;
+			 /* fall through */
 		case 14: param_val -= 5;
+			 /* fall through */
 		case  8: param_val -= 3;
+			 /* fall through */
 		case  4: param_val -= 4;
 			 break;
 		default:
-- 
2.7.4
