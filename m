From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] pinctrl: sunxi: always look for apb block
Date: Thu,  1 Mar 2018 11:37:01 +0000
Message-ID: <20180301113701.8888-1-andre.przywara@arm.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRB3WL37KAKGQE2IKTUDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

The Allwinner pinctrl device tree binding suggests that a clock named
"apb" would drive the pin controller IP. However (for legacy reasons) we
rely on this clock actually being the first clock defined.
Since named clocks can be in any order, let's explicitly check for a
clock called "apb" first, then revert to using the first (and only!)
clock to keep compatibility with older DTs.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 4b6cb25bc796..897ba13e6a03 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1360,10 +1360,21 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 			goto gpiochip_error;
 	}
 
-	clk = devm_clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get(&pdev->dev, "apb");
 	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto gpiochip_error;
+		/*
+		 * If no "apb" clock can be found, try the first one, which
+		 * must be the only one defined.
+		 */
+		if (PTR_ERR(clk) == -ENOENT &&
+		    of_count_phandle_with_args(node, "clocks",
+					       "#clock-cells") == 1)
+			clk = devm_clk_get(&pdev->dev, NULL);
+
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			goto gpiochip_error;
+		}
 	}
 
 	ret = clk_prepare_enable(clk);
-- 
2.14.1
