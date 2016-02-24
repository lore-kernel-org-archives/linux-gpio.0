From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 14/50] pinctrl: meson: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:45:39 +0530
Message-ID: <1456319775-3216-15-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>, Carlo Caione <carlo@endlessm.com>, Beniamino Galvani <b.galvani@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Carlo Caione <carlo@endlessm.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 50cab27..9e1247f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -732,7 +732,7 @@ static int meson_pinctrl_probe(struct platform_device *pdev)
 	pc->desc.pins		= pc->data->pins;
 	pc->desc.npins		= pc->data->num_pins;
 
-	pc->pcdev = pinctrl_register(&pc->desc, pc->dev, pc);
+	pc->pcdev = devm_pinctrl_register(pc->dev, &pc->desc, pc);
 	if (IS_ERR(pc->pcdev)) {
 		dev_err(pc->dev, "can't register pinctrl device");
 		return PTR_ERR(pc->pcdev);
-- 
2.1.4
