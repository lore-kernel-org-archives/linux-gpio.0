From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] pinctrl: imx: do not implicitly set pin regs to -1
Date: Fri, 6 Feb 2015 20:21:21 +0100
Message-ID: <20150206192121.GD10842@pengutronix.de>
References: <1423240256-27210-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423240256-27210-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Hallo Stefan,

On Fri, Feb 06, 2015 at 05:30:56PM +0100, Stefan Agner wrote:
> -	memset(info->pin_regs, 0xff, sizeof(*info->pin_regs) * info->npins)=
;
> +
> +	for (i =3D 0; i < info->npins; i++) {
> +		info->pin_regs[i].mux_reg =3D -1;
> +		info->pin_regs[i].conf_reg =3D -1;
> +	}
looks definitely better. Just out of interest, did you check if it
changes the generated code?

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
