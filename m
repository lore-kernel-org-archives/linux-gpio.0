From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 4/7] pinctrl: sunxi: remove redundant "depends on
 RESET_CONTROLLER"
Date: Thu,  5 Nov 2015 20:15:25 +0900
Message-ID: <1446722128-11961-5-git-send-email-yamada.masahiro@socionext.com>
References: <1446722128-11961-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1446722128-11961-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans de Goede <hdegoede@redhat.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

ARCH_SUNXI selects RESET_CONTROLLER.
The dependency "depends on RESET_CONTROLLER" is already met.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/sunxi/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index e68fd95..50bd2e3 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -27,7 +27,6 @@ config PINCTRL_SUN6I_A31S
 
 config PINCTRL_SUN6I_A31_R
 	def_bool MACH_SUN6I
-	depends on RESET_CONTROLLER
 	select PINCTRL_SUNXI_COMMON
 
 config PINCTRL_SUN7I_A20
@@ -48,7 +47,6 @@ config PINCTRL_SUN8I_A83T
 
 config PINCTRL_SUN8I_A23_R
 	def_bool MACH_SUN8I
-	depends on RESET_CONTROLLER
 	select PINCTRL_SUNXI_COMMON
 
 config PINCTRL_SUN9I_A80
-- 
1.9.1
