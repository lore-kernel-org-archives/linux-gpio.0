From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 1/6] MAINTAINERS: add to pxa files pinctrl
Date: Sat, 21 Nov 2015 19:04:48 +0100
Message-ID: <1448129093-20722-2-git-send-email-robert.jarzmik@free.fr>
References: <1448129093-20722-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1448129093-20722-1-git-send-email-robert.jarzmik@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Add the pinctrl pxa drivers to the pxa maintained files.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9caa4b28828..9bca217c655e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8613,6 +8613,7 @@ S:	Maintained
 F:	arch/arm/mach-pxa/
 F:	drivers/dma/pxa*
 F:	drivers/pcmcia/pxa2xx*
+F:	drivers/pinctrl/pxa/
 F:	drivers/spi/spi-pxa2xx*
 F:	drivers/usb/gadget/udc/pxa2*
 F:	include/sound/pxa2xx-lib.h
-- 
2.1.4
