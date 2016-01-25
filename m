From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] mfd: lpc_ich: use a correct mask for the GPIO base
 address
Date: Mon, 25 Jan 2016 12:44:44 +0000
Message-ID: <20160125124444.GJ3368@x1>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
 <1453566729-30220-3-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453566729-30220-3-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: ptyser@xes-inc.com, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, 23 Jan 2016, Antoine Tenart wrote:

> The GPIO base address is read from the GPIOBASE register. The first
> bit must be cleared as it can be hardwired to 1 to represent the i/o
> space. Other bits are either containing the base address of are
> reserved. They should not be cleared as all the chipsets do not have
> the same reserved bits.
>=20
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  drivers/mfd/lpc_ich.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index b514f3cf140d..f13a5ded3958 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -921,7 +921,10 @@ static int lpc_ich_init_gpio(struct pci_dev *dev=
)
>  gpe0_done:
>  	/* Setup GPIO base register */
>  	pci_read_config_dword(dev, priv->gbase, &base_addr_cfg);
> -	base_addr =3D base_addr_cfg & 0x0000ff80;
> +
> +	/* Clear the i/o flag */
> +	base_addr =3D base_addr_cfg & ~BIT(0);
> +
>  	if (!base_addr) {
>  		dev_notice(&dev->dev, "I/O space for GPIO uninitialized\n");
>  		ret =3D -ENODEV;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
