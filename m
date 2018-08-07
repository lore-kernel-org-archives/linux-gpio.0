From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 2/3] pinctrl: madera: Return ENOTSUPP for unsupported pin attributes
Date: Tue, 7 Aug 2018 10:32:25 +0100
Message-ID: <20180807093226.5624-2-rf@opensource.cirrus.com>
References: <20180807093226.5624-1-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807093226.5624-1-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-gpio@vger.kernel.org

The pin_config_[get|set] functions should return ENOTSUPP if
the requested attribute isn't supported.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index 4f9b7e3b7cf2..4ba56ca5a9be 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -801,7 +801,7 @@ static int madera_pin_conf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			result = 1;
 		break;
 	default:
-		break;
+		return -ENOTSUPP;
 	}
 
 	*config = pinconf_to_config_packed(param, result);
@@ -905,7 +905,7 @@ static int madera_pin_conf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			conf[1] &= ~MADERA_GP1_DIR;
 			break;
 		default:
-			break;
+			return -ENOTSUPP;
 		}
 
 		++configs;
-- 
2.11.0
