From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6sx-sdb: Fix enet phy regulator
Date: Tue, 2 Oct 2018 23:25:22 -0300
Message-ID: <CAOMZO5BcVXZx5YKoKxCTK5uJMX8q=5uRiZsyX6sL=QcYjKkhNw@mail.gmail.com>
References: <1147be600733a1bcde194f7df61866019f34a531.1538504729.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1147be600733a1bcde194f7df61866019f34a531.1538504729.git.leonard.crestez@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Fugang Duan <fugang.duan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

Hi Leonard,

On Tue, Oct 2, 2018 at 3:42 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

> @@ -371,10 +372,12 @@
>                                 MX6SX_PAD_RGMII1_RD1__ENET1_RX_DATA_1   0x3081
>                                 MX6SX_PAD_RGMII1_RD2__ENET1_RX_DATA_2   0x3081
>                                 MX6SX_PAD_RGMII1_RD3__ENET1_RX_DATA_3   0x3081
>                                 MX6SX_PAD_RGMII1_RX_CTL__ENET1_RX_EN    0x3081
>                                 MX6SX_PAD_ENET2_RX_CLK__ENET2_REF_CLK_25M       0x91
> +                               /* phy reset */
> +                               MX6SX_PAD_ENET2_CRS__GPIO2_IO_7         0x80000000

We should avoid using 0x80000000 as this relies on the bootloader
setting the IOMUX.

Please do like this insted:

MX6SX_PAD_ENET2_CRS__GPIO2_IO_7         0x10b0

Then you can add:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
