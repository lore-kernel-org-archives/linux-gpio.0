From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio/xilinx: Use correct address when setting initial values.
Date: Thu, 16 Jul 2015 13:28:18 +0200
Message-ID: <CACRpkdZUQ+-q28dPiEMy7PXgY6vUBHHrGfq+gANx62B9aJd20Q@mail.gmail.com>
References: <1435130385.30543.3.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435130385.30543.3.camel@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Rapha=C3=ABl_Teysseyre?= <rteysseyre@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2015 at 9:19 AM, Rapha=C3=ABl Teysseyre <rteysseyre@gma=
il.com> wrote:

> xgpio_save_regs() is used in this driver to setup the initial
> values of the registers in the hardware.
>
> The relevant registers at that time are:
> 0x0 -> channel 0 data (32 bits, one for each GPIO on this channel).
> 0x4 -> channel 0 tri, controls in/out status for each GPIO of this ch=
annel.
> 0x8 -> channel 1 data
> 0xC -> channel 1 tri
>
> gpio-xilinx.c defines these:
> XGPIO_DATA_OFFSET   (0x0)
> XGPIO_TRI_OFFSET    (0x4)
> XGPIO_CHANNEL_OFFSET    0x8
>
> Before this patch, the "data" register value of channel 1 was written
> at 0x4 intead of 0x8 (overwriting the channel 0 "tri" register),
> and the "tri" register value for channel 1 was written at 0x8 instead=
 of 0xC.
>
> Signed-off-by: Rapha=C3=ABl Teysseyre <rteysseyre@gmail.com>

Patch applied with review tags.

Yours,
Linus Walleij
