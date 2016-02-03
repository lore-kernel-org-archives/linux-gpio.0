From: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: mediatek: fix direction control issue
Date: Wed, 3 Feb 2016 09:24:45 +0800
Message-ID: <1454462686-770-2-git-send-email-biao.huang@mediatek.com>
References: <1454462686-770-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1454462686-770-1-git-send-email-biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Since input-enable/disable and input-schmitt-enable/disable are
workable when gpio direction is input, so add direction setting
when do input-enable/disable and input-schmitt-enable/disable
properties.

Signed-off-by: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 8cac73d..6eb01c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -352,6 +352,7 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		ret = mtk_pconf_set_pull_select(pctl, pin, true, false, arg);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
+		mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
 		ret = mtk_pconf_set_ies_smt(pctl, pin, arg, param);
 		break;
 	case PIN_CONFIG_OUTPUT:
@@ -359,6 +360,7 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
 		ret = mtk_pmx_gpio_set_direction(pctldev, NULL, pin, false);
 		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
 		ret = mtk_pconf_set_ies_smt(pctl, pin, arg, param);
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
-- 
1.7.9.5
