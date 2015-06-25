From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] gpio/xilinx: Use correct address when setting initial
 values.
Date: Thu, 25 Jun 2015 10:50:19 +0200
Message-ID: <558BC0CB.4000908@xilinx.com>
References: <1435130385.30543.3.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435130385.30543.3.camel@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFwaGHDq2wgVGV5c3NleXJl?= <rteysseyre@gmail.com>, linus.walleij@linaro.org, gnurou@gmail.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 06/24/2015 09:19 AM, Rapha=C3=ABl Teysseyre wrote:
> xgpio_save_regs() is used in this driver to setup the initial
> values of the registers in the hardware.
>=20
> The relevant registers at that time are:
> 0x0 -> channel 0 data (32 bits, one for each GPIO on this channel).
> 0x4 -> channel 0 tri, controls in/out status for each GPIO of this ch=
annel.
> 0x8 -> channel 1 data
> 0xC -> channel 1 tri
>=20
> gpio-xilinx.c defines these:
> XGPIO_DATA_OFFSET   (0x0)
> XGPIO_TRI_OFFSET    (0x4)
> XGPIO_CHANNEL_OFFSET	0x8
>=20
> Before this patch, the "data" register value of channel 1 was written
> at 0x4 intead of 0x8 (overwriting the channel 0 "tri" register),
> and the "tri" register value for channel 1 was written at 0x8 instead=
 of 0xC.
>=20
> Signed-off-by: Rapha=C3=ABl Teysseyre <rteysseyre@gmail.com>
> ---
>  drivers/gpio/gpio-xilinx.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 61243d1..e544b7a 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -220,9 +220,9 @@ static void xgpio_save_regs(struct of_mm_gpio_chi=
p *mm_gc)
>  	if (!chip->gpio_width[1])
>  		return;
> =20
> -	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_TRI_OFFSET,
> +	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OFFS=
ET,
>  		       chip->gpio_state[1]);
> -	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_TRI_OFFSET,
> +	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFFSE=
T,
>  		       chip->gpio_dir[1]);
>  }


Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
