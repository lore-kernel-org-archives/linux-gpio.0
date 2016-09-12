From: John Crispin <john@phrozen.org>
Subject: [PATCH] pinctrl: qcom: fix masking of pinmux functions
Date: Mon, 12 Sep 2016 11:36:55 +0200
Message-ID: <1473673015-33124-1-git-send-email-john@phrozen.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, John Crispin <john@phrozen.org>
List-Id: linux-gpio@vger.kernel.org

The following commit introduced a regression by not properly masking the
calculated value.

commit 47a01ee9a6c39fe1 ("pinctrl: qcom: Clear all function selection bits")

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 51c42d7..775c883 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -156,7 +156,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	spin_lock_irqsave(&pctrl->lock, flags);
 
 	val = readl(pctrl->regs + g->ctl_reg);
-	val &= mask;
+	val &= ~mask;
 	val |= i << g->mux_bit;
 	writel(val, pctrl->regs + g->ctl_reg);
 
-- 
1.7.10.4
