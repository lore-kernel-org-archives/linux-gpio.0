From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/3] pinctrl: rockchip: Improve a size determination in
 rockchip_pinctrl_probe()
Date: Sat, 23 Dec 2017 22:40:00 +0100
Message-ID: <e0bceb4a-bd46-5032-2ac9-d51aa46440a5@users.sourceforge.net>
References: <323697d0-e1e8-8d3b-1070-f481cfa30b9a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <323697d0-e1e8-8d3b-1070-f481cfa30b9a@users.sourceforge.net>
Content-Language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Dec 2017 22:07:30 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 285169170eb2..5e76a6d8a1cb 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3158,7 +3158,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info = devm_kzalloc(dev, sizeof(struct rockchip_pinctrl), GFP_KERNEL);
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-- 
2.15.1

