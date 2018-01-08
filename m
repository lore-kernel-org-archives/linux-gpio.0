From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 2/2] pinctrl: meson-axg: correct the pin expansion of UART_AO_B
Date: Mon, 8 Jan 2018 15:33:28 +0800
Message-ID: <20180108073328.205769-3-yixun.lan@amlogic.com>
References: <20180108073328.205769-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180108073328.205769-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The 'uart_ao_b_groups' for the UART_AO_B pins is already defined which is
living inside the AO domain, for these pins which are routed out from EE domain,
we need to correct them with the 'FUNCTION_EX' macro, otherwise there is
a conflict in the code level.

Also slightly adjust the name to make it short and more consistent.

Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson-axg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index 1fda9d6c7ea3..308e5433bd04 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -716,7 +716,7 @@ static const char * const uart_b_groups[] = {
 	"uart_tx_b_x", "uart_rx_b_x", "uart_cts_b_x", "uart_rts_b_x",
 };
 
-static const char * const uart_ao_b_gpioz_groups[] = {
+static const char * const uart_ao_b_z_groups[] = {
 	"uart_ao_tx_b_z", "uart_ao_rx_b_z",
 	"uart_ao_cts_b_z", "uart_ao_rts_b_z",
 };
@@ -855,7 +855,7 @@ static struct meson_pmx_func meson_axg_periphs_functions[] = {
 	FUNCTION(nand),
 	FUNCTION(uart_a),
 	FUNCTION(uart_b),
-	FUNCTION(uart_ao_b_gpioz),
+	FUNCTION_EX(uart_ao_b, _z),
 	FUNCTION(i2c0),
 	FUNCTION(i2c1),
 	FUNCTION(i2c2),
-- 
2.15.1
