From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: [PATCH 1/2] pinctrl: qcom: Clear all function selection bits
Date: Sat, 25 Jun 2016 22:21:31 -0700
Message-ID: <20160626052132.7178-2-stephen.boyd@linaro.org>
References: <20160626052132.7178-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160626052132.7178-1-stephen.boyd@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The function selection bitfield is not always 3 bits wide.
Sometimes it is 4 bits wide. Let's use the npins struct member to
determine how many bits wide the function selection bitfield is
so we clear the correct amount of bits in the register while
remuxing the pins.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 1a44e1d03390..51c42d746883 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -29,6 +29,7 @@
 #include <linux/spinlock.h>
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/log2.h>
 
 #include "../core.h"
 #include "../pinconf.h"
@@ -138,10 +139,11 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct msm_pingroup *g;
 	unsigned long flags;
-	u32 val;
+	u32 val, mask;
 	int i;
 
 	g = &pctrl->soc->groups[group];
+	mask = GENMASK(g->mux_bit + order_base_2(g->nfuncs) - 1, g->mux_bit);
 
 	for (i = 0; i < g->nfuncs; i++) {
 		if (g->funcs[i] == function)
@@ -154,7 +156,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	spin_lock_irqsave(&pctrl->lock, flags);
 
 	val = readl(pctrl->regs + g->ctl_reg);
-	val &= ~(0x7 << g->mux_bit);
+	val &= mask;
 	val |= i << g->mux_bit;
 	writel(val, pctrl->regs + g->ctl_reg);
 
-- 
2.9.0.rc2.8.ga28705d
