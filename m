From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791/r8a7793: Correct SCIFB1_B SCK
 MOD_SEL value
Date: Fri, 25 Sep 2015 10:18:04 -0700
Message-ID: <CACRpkdb5DkxC8_BP425bZ70tPcf1yMjew39vrM8YXUjrT0p13g@mail.gmail.com>
References: <1441887423-18743-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1441887423-18743-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 10, 2015 at 5:17 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> When using serial port SCIFB1_B, transmit works, but nothing is
> received.
>
> Receive fails because the SCIFB1_SCK_B settings configure the wrong
> value for the sel_scifb1 field in the Module Select Register (MOD_SEL),
> due to an ambiguity in the R-Car M2-W and M2-N datasheets.
>
> Tested on r8a7791/koelsch using pins 53 (TXD) and 72 (RXD) on EXIO
> Connector A.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against next-20150910.
>
> s/PINMUX_IPSR_MODSEL_DATA/PINMUX_IPSR_MSEL/ to apply on
> renesas-drivers-2015-09-08-v4.2.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
