From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] pinctrl: use dev_err() to show message in pinctrl_register_one_pin()
Date: Tue, 21 Jul 2015 15:25:26 +0900
Message-ID: <1437459927-5278-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Use dev_err() rather than pr_err() to display the error message.
(Besides, dev_err() is already used 7 lines below in this function.)

Also, drop the redundant information "on %s" because dev_err() shows
which device the message is related to.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 8b8f3a0..69723e0 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -231,8 +231,7 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 
 	pindesc = pin_desc_get(pctldev, number);
 	if (pindesc != NULL) {
-		pr_err("pin %d already registered on %s\n", number,
-		       pctldev->desc->name);
+		dev_err(pctldev->dev, "pin %d already registered\n", number);
 		return -EINVAL;
 	}
 
-- 
1.9.1
