From: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: rockchip: enable sdmmc for rk1108-evb
Date: Sun, 13 Nov 2016 16:13:19 +0800
Message-ID: <1479024799-29198-2-git-send-email-jacob-chen@iotwrt.com>
References: <1479024799-29198-1-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1479024799-29198-1-git-send-email-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

From: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

This patch add sdmmc support for rk1108-evb, now I can load the rootfs
from sdmmc.

Signed-off-by: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 arch/arm/boot/dts/rk1108-evb.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/rk1108-evb.dts b/arch/arm/boot/dts/rk1108-evb.dts
index 3956cff..cea26e5 100644
--- a/arch/arm/boot/dts/rk1108-evb.dts
+++ b/arch/arm/boot/dts/rk1108-evb.dts
@@ -56,6 +56,18 @@
 	};
 };
 
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	card-detect-delay = <200>;
+	disable-wp;
+	num-slots = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_clk>, <&sdmmc_cmd>, <&sdmmc_cd>, <&sdmmc_bus4>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -67,3 +79,12 @@
 &uart2 {
 	status = "okay";
 };
+
+&pinctrl {
+
+	sdmmc {
+		sdmmc_pwr: sdmmc-pwr {
+			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_up_drv_4ma>;
+		};
+	};
+};
-- 
2.7.4
