From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Use lookup function for
 bias data
Date: Mon, 7 Nov 2016 13:23:24 +0100
Message-ID: <20161107122324.GA26304@bigcity.dyn.berto.se>
References: <20161103153421.15527-1-niklas.soderlund+renesas@ragnatech.se>
 <20161103153421.15527-3-niklas.soderlund+renesas@ragnatech.se>
 <2675389.IrWB4HU6aN@avalon>
 <CAMuHMdUhR8Kh-8XLSwPXDYf7S+UVQiGSE4esmQtAfs0Qo-paog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUhR8Kh-8XLSwPXDYf7S+UVQiGSE4esmQtAfs0Qo-paog@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 2016-11-07 11:57:36 +0100, Geert Uytterhoeven wrote:
> On Thu, Nov 3, 2016 at 6:10 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Thursday 03 Nov 2016 16:34:21 Niklas Söderlund wrote:
> >> There is a bug in the r8a7795 bias code where a WARN() is trigged
> >> anytime a pin from PUEN0/PUD0is accessed.
> >>
> >>  # cat /sys/kernel/debug/pinctrl/e6060000.pfc/pinconf-pins
> >>
> >>  WARNING: CPU: 2 PID: 2391 at drivers/pinctrl/sh-pfc/pfc-r8a7795.c:5364
> >> r8a7795_pinmux_get_bias+0xbc/0xc8 [..]
> >>  Call trace:
> >>  [<ffff0000083c442c>] r8a7795_pinmux_get_bias+0xbc/0xc8
> >>  [<ffff0000083c37f4>] sh_pfc_pinconf_get+0x194/0x270
> >>  [<ffff0000083b0768>] pin_config_get_for_pin+0x20/0x30
> >>  [<ffff0000083b11e8>] pinconf_generic_dump_one+0x168/0x188
> >>  [<ffff0000083b144c>] pinconf_generic_dump_pins+0x5c/0x98
> >>  [<ffff0000083b0628>] pinconf_pins_show+0xc8/0x128
> >>  [<ffff0000081fe3bc>] seq_read+0x16c/0x420
> >>  [<ffff00000831a110>] full_proxy_read+0x58/0x88
> >>  [<ffff0000081d7ad4>] __vfs_read+0x1c/0xf8
> >>  [<ffff0000081d8874>] vfs_read+0x84/0x148
> >>  [<ffff0000081d9d64>] SyS_read+0x44/0xa0
> >>  [<ffff000008082f4c>] __sys_trace_return+0x0/0x4
> >>
> >> This is due to the WARN() check if the reg field of the pullups struct
> >> is zero, and this should be 0 for pins controlled by the PUEN0/PUD0
> >> registers. Change the layout of the pullups struct to embed the pin
> >> number inside the struct and loop over it to fetch the correct
> >> information or WARN() if no pin is found.
> >
> > This lowers the memory consumption at the cost of increased CPU usage. Given
> > that the get/set bias functions are not part of a critical path I'm fine with
> > that. We could possibly optimize the implementation by using a dichotomic
> > search, but I don't think that's needed at the moment.
> 
> Alternatively, we could steal one bit from the "reg" bitifield to
> add a "present" bit, without increasing the table size:
> 
>         static const struct {
>                 u16 present : 1;
>                 u16 reg : 10;
>                 u16 bit : 5;
>          } pullups[] = {
> 
> While 10 bits is not sufficient in general (the PFC register block size
> is 0x50c), it's good enough to address the PUx registers. And if needed,
> we can switch from register byte offsets to register indices, indexing the
> 32-bit register file.

I think this is a solution to consider. Before we decide on how to move 
forward I would like to also consider what you and I talked about on IRC 
about how this table will look if bias support are added for non GPIO 
pins.

If we keep using the H3SiP physical pin layout as the method to generate 
unique pin numbers for pins without GPIO, this is done on the series 
which adds drive-strength support to the r8a7795 SoC. Then the largest 
pin number which will be used as an index in this array would be 2085 
instead of 227 as it is today.

Snippet from /sys/kernel/debug/pinctrl/e6060000.pfc/pins with the 
drive-strength patch applied:

<snip>
pin 223 (GP_6_31) sh-pfc
pin 224 (GP_7_0) sh-pfc
pin 225 (GP_7_1) sh-pfc
pin 226 (GP_7_2) sh-pfc
pin 227 (GP_7_3) sh-pfc
pin 308 (PIN_AVB_TX_CTL) sh-pfc
pin 309 (PIN_AVB_MDIO) sh-pfc
pin 312 (PIN_AVB_TXCREFCLK) sh-pfc
pin 313 (PIN_AVB_RD0) sh-pfc
pin 314 (PIN_AVB_RD2) sh-pfc
pin 316 (PIN_AVB_RX_CTL) sh-pfc
pin 317 (PIN_AVB_TD2) sh-pfc
pin 318 (PIN_AVB_TD0) sh-pfc
pin 319 (PIN_AVB_TXC) sh-pfc
pin 352 (PIN_AVB_RD1) sh-pfc
pin 353 (PIN_AVB_RD3) sh-pfc
pin 356 (PIN_AVB_TD3) sh-pfc
pin 357 (PIN_AVB_TD1) sh-pfc
pin 358 (PIN_AVB_RXC) sh-pfc
pin 379 (PIN_PRESETOUT#) sh-pfc
pin 496 (PIN_CLKOUT) sh-pfc
pin 610 (PIN_MLB_REF) sh-pfc
pin 1122 (PIN_QSPI1_SPCLK) sh-pfc
pin 1124 (PIN_QSPI1_SSL) sh-pfc
pin 1125 (PIN_RPC_WP#) sh-pfc
pin 1126 (PIN_RPC_RESET#) sh-pfc
pin 1161 (PIN_QSPI0_SPCLK) sh-pfc
pin 1239 (PIN_QSPI0_SSL) sh-pfc
pin 1242 (PIN_QSPI0_IO2) sh-pfc
pin 1243 (PIN_RPC_INT#) sh-pfc
pin 1357 (PIN_QSPI0_MISO_IO1) sh-pfc
pin 1359 (PIN_QSPI0_IO3) sh-pfc
pin 1395 (PIN_QSPI1_IO3) sh-pfc
pin 1397 (PIN_QSPI0_MOSI_IO0) sh-pfc
pin 1399 (PIN_QSPI1_MOSI_IO0) sh-pfc
pin 1469 (PIN_FSCLKST#) sh-pfc
pin 1474 (PIN_QSPI1_IO2) sh-pfc
pin 1475 (PIN_QSPI1_MISO_IO1) sh-pfc
pin 1906 (PIN_DU_DOTCLKIN0) sh-pfc
pin 1907 (PIN_DU_DOTCLKIN1) sh-pfc
pin 1984 (PIN_DU_DOTCLKIN2) sh-pfc
pin 1985 (PIN_DU_DOTCLKIN3) sh-pfc
pin 2007 (PIN_TMS) sh-pfc
pin 2083 (PIN_TDO) sh-pfc
pin 2085 (PIN_ASEBRK) sh-pfc

Pins with a number lower then 300 are GPIO pins and above are pins which 
do not have a GPIO function. So if we where to go with the solution to 
use a 'present' bit that would grow the lookup table quiet a lot when 
bias for non GPIO pins are added, also the array would mostly be entries 
where the 'present' bit is not set.

I'm fine with either solution, Laurent what do you think? I will hold 
off a few days with posting a v2 so we can agree on the best solution 
for this.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
