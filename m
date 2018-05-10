From: djw@t-chip.com.cn
Subject: [PATCH v1 1/5] gpio: syscon: allow fetching syscon from parent node
Date: Thu, 10 May 2018 17:16:36 +0800
Message-ID: <1525943800-14095-2-git-send-email-djw@t-chip.com.cn>
References: <1525943800-14095-1-git-send-email-djw@t-chip.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525943800-14095-1-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Wayne Chou <zxf@t-chip.com.cn>, Levin Du <djw@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Heiko Stuebner <heiko@sntech.de>

Syscon nodes can be a simple-mfd and the syscon-users then be declared
as children of this node. That way the parent-child structure can be
better represented for devices that are fully embedded in the syscon.

Therefore allow getting the syscon from the parent if neither
a special compatible nor a gpio,syscon-dev property is defined.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Levin Du <djw@t-chip.com.cn>
---

Changes in v1:
- New

 drivers/gpio/gpio-syscon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 537cec7..7325b86 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -205,6 +205,8 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	} else {
 		priv->syscon =
 			syscon_regmap_lookup_by_phandle(np, "gpio,syscon-dev");
+		if (IS_ERR(priv->syscon) && np->parent)
+			priv->syscon = syscon_node_to_regmap(np->parent);
 		if (IS_ERR(priv->syscon))
 			return PTR_ERR(priv->syscon);
 
-- 
2.7.4
