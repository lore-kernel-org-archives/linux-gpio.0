From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: pinctrl: imx7d: undefined Kconfig option SOC_IMX7D
Date: Thu, 7 May 2015 18:36:31 +0800
Message-ID: <20150507103628.GA5909@dragon>
References: <CAD3Xx4+VeF5WUj+WdyXackbA0xuTZ-YY4hm_yMoCwFsiUf0eaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD3Xx4+VeF5WUj+WdyXackbA0xuTZ-YY4hm_yMoCwFsiUf0eaw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: Frank.Li@freescale.com, linus.walleij@linaro.org, b20788@freescale.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>
List-Id: linux-gpio@vger.kernel.org

Hi Valentin,

On Thu, May 07, 2015 at 09:17:40AM +0200, Valentin Rothberg wrote:
> Hi Frank,
> 
> your commit c30024a64490 ("pinctrl: add imx7d support") is in today's
> linux-next tree (i.e., next-20150507) adding driver support for IMX7D
> pinctrl.  However, the driver cannot be compiled at its current state
> since the required Kconfig option PINCTRL_IMX7D depends on SOC_IMX7D,
> which is not defined in Kconfig, see:
> 
> +config PINCTRL_IMX7D
> +       bool "IMX7D pinctrl driver"
> +       depends on SOC_IMX7D
> 
> Is there a patch queued somewhere to add this option?

Yes, there is a patch series adding i.MX7D SoC support which contains
this option under review, and we plan to merge the series for v4.2.

Shawn
