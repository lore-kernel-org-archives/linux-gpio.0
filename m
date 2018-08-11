From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] pinctrl: uniphier: drop meaningless pin from SD1 pin-mux
 of Pro4
Date: Sat, 11 Aug 2018 11:16:13 +0900
Message-ID: <1533953773-29424-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>
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

Changes in v2:
 - rebase onto linux-pinctrl/devel branch

 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
index 89148f8..6fca8d5 100644
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
 static const unsigned spi0_pins[] = {199, 200, 201, 202};
 static const int spi0_muxvals[] = {11, 11, 11, 11};
 static const unsigned spi1_pins[] = {195, 196, 197, 198, 235, 238, 239};
-- 
2.7.4
