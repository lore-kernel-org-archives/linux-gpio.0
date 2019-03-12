From: Aditya Pakki <pakki001@umn.edu>
Subject: [PATCH] pinctrl: axp209: Fix NULL pointer dereference after allocation
Date: Tue, 12 Mar 2019 10:19:10 -0500
Message-ID: <20190312151911.2207-1-pakki001@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pakki001@umn.edu
Cc: kjlu@umn.edu, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

axp20x_build_funcs_groups allocates groups via devm_kcalloc and tries to
dereference without checking for NULL. This patch avoids such a
scenario.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/pinctrl/pinctrl-axp209.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index afd0b533c40a..4fcf7262bed9 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -366,6 +366,8 @@ static int axp20x_build_funcs_groups(struct platform_device *pdev)
 		pctl->funcs[i].groups = devm_kcalloc(&pdev->dev,
 						     npins, sizeof(char *),
 						     GFP_KERNEL);
+		if (!pctl->funcs[i].groups)
+			return -ENOMEM;
 		for (pin = 0; pin < npins; pin++)
 			pctl->funcs[i].groups[pin] = pctl->desc->pins[pin].name;
 	}
-- 
2.17.1
