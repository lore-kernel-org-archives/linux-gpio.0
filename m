From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 1/2] pinctrl: meson: meson8b: add the eth_rxd2 and
 eth_rxd3 pins
Date: Fri, 11 Jan 2019 14:42:37 -0800
Message-ID: <7hmuo6n7du.fsf@baylibre.com>
References: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
 <20181229143556.27339-2-martin.blumenstingl@googlemail.com>
 <7hzhs8ovag.fsf@baylibre.com>
 <CAFBinCB41iRf-5AdUir9Z9AYPGP4-yfD4B3Yn9+v+dxSFJoELA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCB41iRf-5AdUir9Z9AYPGP4-yfD4B3Yn9+v+dxSFJoELA@mail.gmail.com>
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
Cc: linus.luessing@c0d3.blue, jianxin.pan@amlogic.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, ingrassia@epigenesys.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Kevin,
>
> On Fri, Jan 11, 2019 at 2:08 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>
>> > Gigabit Ethernet requires the Ethernet TXD0..3 and RXD0..3 data lines.
>> > Add the missing eth_rxd2 and eth_rxd3 definitions so we don't have to
>> > rely on the bootloader to set them up correctly.
>> >
>> > The vendor u-boot sources for Odroid-C1 use the following Ethernet
>> > pinmux configuration:
>> >   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_6, 0x3f4f);
>> >   SET_CBUS_REG_MASK(PERIPHS_PIN_MUX_7, 0xf00000);
>> > This translates to the following pin groups in the mainline kernel:
>> > - register 6 bit  0: eth_rxd1 (DIF_0_P)
>> > - register 6 bit  1: eth_rxd0 (DIF_0_N)
>> > - register 6 bit  2: eth_rx_dv (DIF_1_P)
>> > - register 6 bit  3: eth_rx_clk (DIF_1_N)
>> > - register 6 bit  6: eth_tx_en (DIF_3_P)
>> > - register 6 bit  8: eth_ref_clk (DIF_3_N)
>> > - register 6 bit  9: eth_mdc (DIF_4_P)
>> > - register 6 bit 10: eth_mdio_en (DIF_4_N)
>> > - register 6 bit 11: eth_tx_clk (GPIOH_9)
>> > - register 6 bit 12: eth_txd2 (GPIOH_8)
>> > - register 6 bit 13: eth_txd3 (GPIOH_7)
>> > - register 7 bit 20: eth_txd0_0 (GPIOH_6)
>> > - register 7 bit 21: eth_txd1_0 (GPIOH_5)
>> > - register 7 bit 22: eth_rxd3 (DIF_2_P)
>> > - register 7 bit 23: eth_rxd2 (DIF_2_N)
>> >
>> > All functions except eth_rxd2 and eth_rxd3 are already supported by the
>> > pinctrl-meson8b driver.
>> >
>> > Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> thank you for reviewing this!
>
> I just realized that I forgot to CC the linux-gpio mailing list as
> well as Linus Walleij on this patch (fixing that with this mail) -
> sorry for that.
> right now this patch is applied to linux-amlogic.git's v5.1/dt branch.

That was a mistake I rectified earlier today. I meant to only apply the
DT patch not the driver also.

> please let me know whether you would like to keep it in your tree or
> if you would like me to re-send it (including Linus and the linux-gpio
> list this time...)

Please resend including Linus, linux-gpio and my review tag.

Thanks,

Kevin
