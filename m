From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 30/50] pinctrl: tegra-xusb: Use devm_pinctrl_register() for
 pinctrl registration
Date: Wed, 24 Feb 2016 18:45:55 +0530
Message-ID: <1456319775-3216-31-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration and clean
the error path.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 2f06029..19f16f4 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -914,7 +914,8 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 	padctl->desc.confops = &tegra_xusb_padctl_pinconf_ops;
 	padctl->desc.owner = THIS_MODULE;
 
-	padctl->pinctrl = pinctrl_register(&padctl->desc, &pdev->dev, padctl);
+	padctl->pinctrl = devm_pinctrl_register(&pdev->dev, &padctl->desc,
+						padctl);
 	if (IS_ERR(padctl->pinctrl)) {
 		dev_err(&pdev->dev, "failed to register pincontrol\n");
 		err = PTR_ERR(padctl->pinctrl);
@@ -924,7 +925,7 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 	phy = devm_phy_create(&pdev->dev, NULL, &pcie_phy_ops);
 	if (IS_ERR(phy)) {
 		err = PTR_ERR(phy);
-		goto unregister;
+		goto reset;
 	}
 
 	padctl->phys[TEGRA_XUSB_PADCTL_PCIE] = phy;
@@ -933,7 +934,7 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 	phy = devm_phy_create(&pdev->dev, NULL, &sata_phy_ops);
 	if (IS_ERR(phy)) {
 		err = PTR_ERR(phy);
-		goto unregister;
+		goto reset;
 	}
 
 	padctl->phys[TEGRA_XUSB_PADCTL_SATA] = phy;
@@ -944,13 +945,11 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 	if (IS_ERR(padctl->provider)) {
 		err = PTR_ERR(padctl->provider);
 		dev_err(&pdev->dev, "failed to register PHYs: %d\n", err);
-		goto unregister;
+		goto reset;
 	}
 
 	return 0;
 
-unregister:
-	pinctrl_unregister(padctl->pinctrl);
 reset:
 	reset_control_assert(padctl->rst);
 	return err;
@@ -961,8 +960,6 @@ static int tegra_xusb_padctl_remove(struct platform_device *pdev)
 	struct tegra_xusb_padctl *padctl = platform_get_drvdata(pdev);
 	int err;
 
-	pinctrl_unregister(padctl->pinctrl);
-
 	err = reset_control_assert(padctl->rst);
 	if (err < 0)
 		dev_err(&pdev->dev, "failed to assert reset: %d\n", err);
-- 
2.1.4
