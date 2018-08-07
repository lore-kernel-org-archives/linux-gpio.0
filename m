From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: uniphier: drop meaningless pin from SD1 pin-mux of
 Pro4
Date: Tue,  7 Aug 2018 11:49:39 +0900
Message-ID: <1533610179-13885-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

The pin 327 was supposed to be used as a voltage control line for the
SD card regulator, but the SD card port1 does not support UHS-I.  It
only supports 3.3V signaling, hence this pin is pointless.

Just a note about the background.  At first, hardware engineers tried
to implement the UHS for this port.  Then, they needed to shrink the
silicon die size, and gave up the UHS, but forgot to remove the pin
assignment.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
index 24788a7..b2c1ffe 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
@@ -1047,9 +1047,8 @@ static const unsigned nand_cs1_pins[] = {131, 132};
 static const int nand_cs1_muxvals[] = {1, 1};
 static const unsigned sd_pins[] = {150, 151, 152, 153, 154, 155, 156, 157, 158};
 static const int sd_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0, 0};
-static const unsigned sd1_pins[] = {319, 320, 321, 322, 323, 324, 325, 326,
-				    327};
-static const int sd1_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0, 0};
+static const unsigned int sd1_pins[] = {319, 320, 321, 322, 323, 324, 325, 326};
+static const int sd1_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0};
 static const unsigned system_bus_pins[] = {25, 26, 27, 28, 29, 30, 31, 32, 33,
 					   34, 35, 36, 37, 38};
 static const int system_bus_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-- 
2.7.4
