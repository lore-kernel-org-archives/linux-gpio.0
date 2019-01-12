From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 1/1] pinctrl: meson: meson8b: add the eth_rxd2 and eth_rxd3
 pins
Date: Sat, 12 Jan 2019 13:59:13 +0100
Message-ID: <20190112125913.22085-2-martin.blumenstingl@googlemail.com>
References: <20190112125913.22085-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190112125913.22085-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com, ingrassia@epigenesys.com, linux-arm-kernel@lists.infradead.org, Jianxin Pan <jianxin.pan@amlogic.com>
List-Id: linux-gpio@vger.kernel.org

Gigabit Ethernet requires the Ethernet TXD0..3 and RXD0..3 data lines.
Add the missing eth_rxd2 and eth_rxd3 definitions so we don't have to
rely on the bootloader to set them up correctly.

The vendor u-boot sources for Odroid-C1 use the following Ethernet
pinmux configuration:
  SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_6, 0x3f4f);
  SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_7, 0xf00000);
This translates to the following pin groups in the mainline kernel:
- register 6 bit  0: eth_rxd1 (DIF_0_P)
- register 6 bit  1: eth_rxd0 (DIF_0_N)
- register 6 bit  2: eth_rx_dv (DIF_1_P)
- register 6 bit  3: eth_rx_clk (DIF_1_N)
- register 6 bit  6: eth_tx_en (DIF_3_P)
- register 6 bit  8: eth_ref_clk (DIF_3_N)
- register 6 bit  9: eth_mdc (DIF_4_P)
- register 6 bit 10: eth_mdio_en (DIF_4_N)
- register 6 bit 11: eth_tx_clk (GPIOH_9)
- register 6 bit 12: eth_txd2 (GPIOH_8)
- register 6 bit 13: eth_txd3 (GPIOH_7)
- register 7 bit 20: eth_txd0_0 (GPIOH_6)
- register 7 bit 21: eth_txd1_0 (GPIOH_5)
- register 7 bit 22: eth_rxd3 (DIF_2_P)
- register 7 bit 23: eth_rxd2 (DIF_2_N)

All functions except eth_rxd2 and eth_rxd3 are already supported by the
pinctrl-meson8b driver.

Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
Reviewed-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index c69ca95b1ad5..84938bd73ac2 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -346,6 +346,8 @@ static const unsigned int eth_rx_dv_pins[]	= { DIF_1_P };
 static const unsigned int eth_rx_clk_pins[]	= { DIF_1_N };
 static const unsigned int eth_txd0_1_pins[]	= { DIF_2_P };
 static const unsigned int eth_txd1_1_pins[]	= { DIF_2_N };
+static const unsigned int eth_rxd3_pins[]	= { DIF_2_P };
+static const unsigned int eth_rxd2_pins[]	= { DIF_2_N };
 static const unsigned int eth_tx_en_pins[]	= { DIF_3_P };
 static const unsigned int eth_ref_clk_pins[]	= { DIF_3_N };
 static const unsigned int eth_mdc_pins[]	= { DIF_4_P };
@@ -599,6 +601,8 @@ static struct meson_pmx_group meson8b_cbus_groups[] = {
 	GROUP(eth_ref_clk,	6,	8),
 	GROUP(eth_mdc,		6,	9),
 	GROUP(eth_mdio_en,	6,	10),
+	GROUP(eth_rxd3,		7,	22),
+	GROUP(eth_rxd2,		7,	23),
 };
 
 static struct meson_pmx_group meson8b_aobus_groups[] = {
@@ -748,7 +752,7 @@ static const char * const ethernet_groups[] = {
 	"eth_tx_clk", "eth_tx_en", "eth_txd1_0", "eth_txd1_1",
 	"eth_txd0_0", "eth_txd0_1", "eth_rx_clk", "eth_rx_dv",
 	"eth_rxd1", "eth_rxd0", "eth_mdio_en", "eth_mdc", "eth_ref_clk",
-	"eth_txd2", "eth_txd3"
+	"eth_txd2", "eth_txd3", "eth_rxd3", "eth_rxd2"
 };
 
 static const char * const i2c_a_groups[] = {
-- 
2.20.1
