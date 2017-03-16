From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH] pinctrl: qcom: ipq4019: add missing pingroups for pins > 70
Date: Thu, 16 Mar 2017 21:36:07 +0100
Message-ID: <20170316203607.12714-1-chunkeey@googlemail.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>
List-Id: linux-gpio@vger.kernel.org

This patch adds the missing PINGROUP for GPIO70-99.
This fixes a crash that happens in pinctrl-msm, if any
of the GPIO70-99 are accessed.

Fixes: 5303f7827fcd41d ("pinctrl: qcom: ipq4019: set ngpios to correct value")
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/pinctrl/qcom/pinctrl-ipq4019.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index b68ae424cee2..743d1f458205 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -405,6 +405,36 @@ static const struct msm_pingroup ipq4019_groups[] = {
 	PINGROUP(67, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(68, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(69, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(70, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(71, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(72, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(73, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(74, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(75, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(76, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(77, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(78, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(79, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(80, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(81, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(82, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(83, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(84, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(85, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(86, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(87, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(88, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(89, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(90, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(91, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(92, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(93, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(94, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(95, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(96, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(97, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(98, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(99, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 };
 
 static const struct msm_pinctrl_soc_data ipq4019_pinctrl = {
-- 
2.11.0
