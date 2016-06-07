From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 01/10] pinctrl: walk into bcm subdir unconditionally
Date: Tue,  7 Jun 2016 13:05:39 +0200
Message-ID: <1465297548-17182-2-git-send-email-kraxel@redhat.com>
References: <1465297548-17182-1-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1465297548-17182-1-git-send-email-kraxel@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

There is no ARCH_BCM on arm64, and we need pinctrl-bcm2835 for the rpi3.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e4bc115..88586c0 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -35,7 +35,7 @@ obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
-obj-$(CONFIG_ARCH_BCM)		+= bcm/
+obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
-- 
1.8.3.1
