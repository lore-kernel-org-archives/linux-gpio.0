From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/6] pinctrl: tz1090-pdc: Remove unneded semicolons
Date: Wed, 16 Sep 2015 10:28:27 +0200
Message-ID: <1442392111-8448-3-git-send-email-javier@osg.samsung.com>
References: <1442392111-8448-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442392111-8448-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

They aren't needed and are just creating null statements so remove it.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/pinctrl/pinctrl-tz1090-pdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tz1090-pdc.c b/drivers/pinctrl/pinctrl-tz1090-pdc.c
index c349911708ef..b89ad3c0c731 100644
--- a/drivers/pinctrl/pinctrl-tz1090-pdc.c
+++ b/drivers/pinctrl/pinctrl-tz1090-pdc.c
@@ -668,7 +668,7 @@ static int tz1090_pdc_pinconf_reg(struct pinctrl_dev *pctldev,
 		break;
 	default:
 		return -ENOTSUPP;
-	};
+	}
 
 	/* Only input bias parameters supported */
 	*reg = REG_GPIO_CONTROL2;
@@ -801,7 +801,7 @@ static int tz1090_pdc_pinconf_group_reg(struct pinctrl_dev *pctldev,
 		break;
 	default:
 		return -ENOTSUPP;
-	};
+	}
 
 	/* Calculate field information */
 	*mask = (BIT(*width) - 1) << *shift;
-- 
2.4.3
