From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH] MAINTAINERS: merge at91 pinctrl entries
Date: Thu, 8 Nov 2018 14:14:42 +0100
Message-ID: <20181108131442.27911-1-ludovic.desroches@microchip.com>
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
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: alexandre.belloni@bootlin.com, Ludovic Desroches <ludovic.desroches@microchip.com>, plagnioj@jcrosoft.com, linus.walleij@linaro.org
List-Id: linux-gpio@vger.kernel.org

In order to be aware of all changes related to at91 pinctrl drivers,
merge the two entries. Make use of the opportunity to replace Atmel by
Microchip.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---

I am maintaining both at91 pinctrl drivers but it's not convenient to
not be in copy of the patches concerning pinctrl-at91. For this reason,
I merge the two entries.

 MAINTAINERS | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c78aca287970..a3c14a19885c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11727,18 +11727,12 @@ F:	Documentation/driver-api/pinctl.rst
 F:	drivers/pinctrl/
 F:	include/linux/pinctrl/
 
-PIN CONTROLLER - ATMEL AT91
-M:	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-F:	drivers/pinctrl/pinctrl-at91.*
-
-PIN CONTROLLER - ATMEL AT91 PIO4
+PIN CONTROLLER - MICROCHIP AT91
 M:	Ludovic Desroches <ludovic.desroches@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-gpio@vger.kernel.org
 S:	Supported
-F:	drivers/pinctrl/pinctrl-at91-pio4.*
+F:	drivers/pinctrl/pinctrl-at91*
 
 PIN CONTROLLER - FREESCALE
 M:	Dong Aisheng <aisheng.dong@nxp.com>
-- 
2.19.1
