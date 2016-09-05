From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] sh-pfc: return pinconf with arguments in packed format
Date: Mon,  5 Sep 2016 16:19:57 +0200
Message-ID: <20160905141957.25982-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:39854 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934322AbcIEOUq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 10:20:46 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

The pinconf-generic code expects configurations with arguments to be
returned in a packed format in order to be displayed properly by
pinconf_generic_dump_one().

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index e208ee0..c577258 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -596,6 +596,7 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 	struct sh_pfc *pfc = pmx->pfc;
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	unsigned long flags;
+	unsigned int arg;
 
 	if (!sh_pfc_pinconf_validate(pfc, _pin, param))
 		return -ENOTSUPP;
@@ -616,7 +617,7 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 		if (bias != param)
 			return -EINVAL;
 
-		*config = 0;
+		arg = 0;
 		break;
 	}
 
@@ -627,7 +628,7 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 		if (ret < 0)
 			return ret;
 
-		*config = ret;
+		arg = ret;
 		break;
 	}
 
@@ -646,7 +647,7 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 		val = sh_pfc_read_reg(pfc, pocctrl, 32);
 		spin_unlock_irqrestore(&pfc->lock, flags);
 
-		*config = (val & BIT(bit)) ? 3300 : 1800;
+		arg = (val & BIT(bit)) ? 3300 : 1800;
 		break;
 	}
 
@@ -654,6 +655,7 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 		return -ENOTSUPP;
 	}
 
+	*config = pinconf_to_config_packed(param, arg);
 	return 0;
 }
 
-- 
2.9.3

