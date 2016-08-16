From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH] pinctrl: palmas: fix a possible NULL dereference
Date: Tue, 16 Aug 2016 10:36:53 +0200
Message-ID: <1471336613-25040-1-git-send-email-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, LABBE Corentin <clabbe.montjoie@gmail.com>
List-Id: linux-gpio@vger.kernel.org

of_match_device could return NULL, and so cause a NULL pointer
dereference later at line 1009:
pinctrl_data = match->data;

For fixing this problem, we use of_device_get_match_data(), this will
simplify the code a little by using a standard function for
getting the match data.

Reported-by: coverity (CID 1324136)
Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/pinctrl/pinctrl-palmas.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index 8edb3f8c..a30146d 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -1004,9 +1004,7 @@ static int palmas_pinctrl_probe(struct platform_device *pdev)
 	bool enable_dvfs2 = false;
 
 	if (pdev->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_device(palmas_pinctrl_of_match, &pdev->dev);
-		pinctrl_data = match->data;
+		pinctrl_data = of_device_get_match_data(&pdev->dev);
 		enable_dvfs1 = of_property_read_bool(pdev->dev.of_node,
 					"ti,palmas-enable-dvfs1");
 		enable_dvfs2 = of_property_read_bool(pdev->dev.of_node,
-- 
2.7.3
