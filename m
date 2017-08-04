From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] pinctrl: armada-37xx: add static to local data
Date: Fri,  4 Aug 2017 13:47:00 +0900
Message-ID: <1501822020-22511-1-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Detected by sparse.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index f024e25787fc..0b263b90a9a8 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -179,14 +179,14 @@ static struct armada_37xx_pin_group armada_37xx_sb_groups[] = {
 	PIN_GRP("mii_col", 23, 1, BIT(8), "mii", "mii_err"),
 };
 
-const struct armada_37xx_pin_data armada_37xx_pin_nb = {
+static const struct armada_37xx_pin_data armada_37xx_pin_nb = {
 	.nr_pins = 36,
 	.name = "GPIO1",
 	.groups = armada_37xx_nb_groups,
 	.ngroups = ARRAY_SIZE(armada_37xx_nb_groups),
 };
 
-const struct armada_37xx_pin_data armada_37xx_pin_sb = {
+static const struct armada_37xx_pin_data armada_37xx_pin_sb = {
 	.nr_pins = 29,
 	.name = "GPIO2",
 	.groups = armada_37xx_sb_groups,
-- 
2.7.4
