From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 067/102] pinctrl: sunxi: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:11 +0200
Message-ID: <20170719152646.25903-68-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:49081 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933096AbdGSP3g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Jul 2017 11:29:36 -0400
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c
index a22bd88a1f03e..92c0ddc652959 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31-r.c
@@ -113,7 +113,7 @@ static int sun6i_a31_r_pinctrl_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int ret;
 
-	rstc = devm_reset_control_get(&pdev->dev, NULL);
+	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc)) {
 		dev_err(&pdev->dev, "Reset controller missing\n");
 		return PTR_ERR(rstc);
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c
index 2292e05a397b4..2e113ca78f959 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c
@@ -100,7 +100,7 @@ static int sun8i_a23_r_pinctrl_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int ret;
 
-	rstc = devm_reset_control_get(&pdev->dev, NULL);
+	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc)) {
 		dev_err(&pdev->dev, "Reset controller missing\n");
 		return PTR_ERR(rstc);
-- 
2.11.0

