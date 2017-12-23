From: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: [PATCH 3/3] pinctrl: rockchip: Fix a typo in four comment lines
Date: Sat, 23 Dec 2017 22:42:35 +0100
Message-ID: <989b7476-5e5e-d1ed-0d95-9dbdcec2382c@users.sourceforge.net>
References: <323697d0-e1e8-8d3b-1070-f481cfa30b9a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <323697d0-e1e8-8d3b-1070-f481cfa30b9a-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Date: Sat, 23 Dec 2017 22:22:54 +0100

Adjust words in these descriptions.

Signed-off-by: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 5e76a6d8a1cb..1cd85411e906 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -136,7 +136,7 @@ struct rockchip_drv {
  * @iomux: array describing the 4 iomux sources of the bank
  * @drv: array describing the 4 drive strength sources of the bank
  * @pull_type: array describing the 4 pull type sources of the bank
- * @valid: are all necessary informations present
+ * @valid: is all necessary information present
  * @of_node: dt node of this bank
  * @drvdata: common pinctrl basedata
  * @domain: irqdomain of the gpio bank
@@ -1988,7 +1988,7 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 		info->functions[selector].name, info->groups[group].name);
 
 	/*
-	 * for each pin in the pin group selected, program the correspoding pin
+	 * for each pin in the pin group selected, program the corresponding
 	 * pin function number in the config register.
 	 */
 	for (cnt = 0; cnt < info->groups[group].npins; cnt++) {
@@ -2527,7 +2527,7 @@ static int rockchip_gpio_get(struct gpio_chip *gc, unsigned offset)
 
 /*
  * gpiolib gpio_direction_input callback function. The setting of the pin
- * mux function as 'gpio input' will be handled by the pinctrl susbsystem
+ * mux function as 'gpio input' will be handled by the pinctrl subsystem
  * interface.
  */
 static int rockchip_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
@@ -2537,7 +2537,7 @@ static int rockchip_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 
 /*
  * gpiolib gpio_direction_output callback function. The setting of the pin
- * mux function as 'gpio output' will be handled by the pinctrl susbsystem
+ * mux function as 'gpio output' will be handled by the pinctrl subsystem
  * interface.
  */
 static int rockchip_gpio_direction_output(struct gpio_chip *gc,
-- 
2.15.1
