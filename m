From: Liu Gang <Gang.Liu@nxp.com>
Subject: [PATCH 1/2 V3] gpio/qoriq: Add qoriq platforms support
Date: Tue, 12 Jan 2016 20:10:09 +0800
Message-ID: <1452600610-17400-1-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: scottwood@nxp.com, Liu Gang <Gang.Liu@nxp.com>, robh+dt@kernel.org, bhupesh.sharma@nxp.com, LeoLi@nxp.com
List-Id: linux-gpio@vger.kernel.org

The gpio-mpc8xxx.c should can support qoriq and
Layerscape platforms.

Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
---
-V3: No changes

 drivers/gpio/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5e4e9f5..e315cf4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -281,12 +281,14 @@ config GPIO_MPC5200
 	depends on PPC_MPC52xx
 
 config GPIO_MPC8XXX
-	bool "MPC512x/MPC8xxx GPIO support"
+	bool "MPC512x/MPC8xxx/QorIQ GPIO support"
 	depends on PPC_MPC512x || PPC_MPC831x || PPC_MPC834x || PPC_MPC837x || \
-		   FSL_SOC_BOOKE || PPC_86xx
+		   FSL_SOC_BOOKE || PPC_86xx || ARCH_LAYERSCAPE || ARM || \
+		   COMPILE_TEST
+	select GPIO_GENERIC
 	help
 	  Say Y here if you're going to use hardware that connects to the
-	  MPC512x/831x/834x/837x/8572/8610 GPIOs.
+	  MPC512x/831x/834x/837x/8572/8610/QorIQ GPIOs.
 
 config GPIO_MVEBU
 	def_bool y
-- 
2.1.0.27.g96db324
