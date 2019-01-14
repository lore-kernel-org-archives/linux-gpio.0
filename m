From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/1] pinctrl: meson: meson8b: add the eth_rxd2 and
 eth_rxd3 pins
Date: Mon, 14 Jan 2019 09:30:47 +0100
Message-ID: <CACRpkdar33+on8Ve6-+5VD6OtSD=Pa8rdEHYkE6G8_XwXYp1TQ@mail.gmail.com>
References: <20190112125913.22085-1-martin.blumenstingl@googlemail.com>
 <20190112125913.22085-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190112125913.22085-2-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, ingrassia@epigenesys.com
List-Id: linux-gpio@vger.kernel.org

On Sat, Jan 12, 2019 at 1:59 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Gigabit Ethernet requires the Ethernet TXD0..3 and RXD0..3 data lines.
> Add the missing eth_rxd2 and eth_rxd3 definitions so we don't have to
> rely on the bootloader to set them up correctly.
>
> The vendor u-boot sources for Odroid-C1 use the following Ethernet
> pinmux configuration:
>   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_6, 0x3f4f);
>   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_7, 0xf00000);
> This translates to the following pin groups in the mainline kernel:
> - register 6 bit  0: eth_rxd1 (DIF_0_P)
> - register 6 bit  1: eth_rxd0 (DIF_0_N)
> - register 6 bit  2: eth_rx_dv (DIF_1_P)
> - register 6 bit  3: eth_rx_clk (DIF_1_N)
> - register 6 bit  6: eth_tx_en (DIF_3_P)
> - register 6 bit  8: eth_ref_clk (DIF_3_N)
> - register 6 bit  9: eth_mdc (DIF_4_P)
> - register 6 bit 10: eth_mdio_en (DIF_4_N)
> - register 6 bit 11: eth_tx_clk (GPIOH_9)
> - register 6 bit 12: eth_txd2 (GPIOH_8)
> - register 6 bit 13: eth_txd3 (GPIOH_7)
> - register 7 bit 20: eth_txd0_0 (GPIOH_6)
> - register 7 bit 21: eth_txd1_0 (GPIOH_5)
> - register 7 bit 22: eth_rxd3 (DIF_2_P)
> - register 7 bit 23: eth_rxd2 (DIF_2_N)
>
> All functions except eth_rxd2 and eth_rxd3 are already supported by the
> pinctrl-meson8b driver.
>
> Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Tested-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> Reviewed-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

Patch applied.

Yours,
Linus Walleij
