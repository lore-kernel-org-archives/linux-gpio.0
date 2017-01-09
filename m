From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Mon, 09 Jan 2017 21:51:26 +0200
Message-ID: <11976735.hueksWqZOA@avalon>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: magnus.damm@gmail.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Monday 09 Jan 2017 20:31:55 Jacopo Mondi wrote:
> Hello,
>    these patches are the result of a squash and forward porting of Magnus'
> PFC and GPIO driver from
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tree
> genmai-gpio-and-pfc branch to kernel v4.10
> 
> The PFC and GPIO driver have been forward ported to v4.10-rc1 with minor
> fixes and applied on top of renesas-driver master branch.
> 
> As I cannot locally verify most of the peripherals functionalities enabled
> by the creation of PFC and GPIO driver for RZ SoC series, testing performed
> by patches original authors has to be trusted.
> 
> Some possible fixes and functional expansion for the PFC driver will follow
> in an RFC series to be applied on top of this one.

Pin control on the Renesas RZ chips is performed per pin instead of per 
function (but unfortunately with the various bits of configuration split 
across a bunch of registers, otherwise we could have used pinctrl-single). 
This gives us an opportunity to move away from the sh-pfc awful (but more or 
less needed for the R-Car family) architecture and implement something much, 
much cleaner without all those obscure data tables and macros, with per-pin 
configuration. Shouldn't we rejoice and embrace that opportunity ?

> Magnus Damm (3):
>   pinctrl: sh-pfc: Add r7s72100 PFC driver
>   gpio: gpio-rz: GPIO driver for Renesas RZ series
>   arm: dts: r7s72100: Add peripherals nodes
> 
>  .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
>  arch/arm/boot/dts/r7s72100-genmai.dts              |  51 ++
>  arch/arm/boot/dts/r7s72100.dtsi                    | 151 ++++++
>  drivers/gpio/Kconfig                               |   6 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-rz.c                             | 212 +++++++++
>  drivers/pinctrl/sh-pfc/Kconfig                     |   5 +
>  drivers/pinctrl/sh-pfc/Makefile                    |   1 +
>  drivers/pinctrl/sh-pfc/core.c                      |   9 +
>  drivers/pinctrl/sh-pfc/pfc-r7s72100.c              | 529 ++++++++++++++++++
>  drivers/pinctrl/sh-pfc/sh_pfc.h                    |   9 +-
>  11 files changed, 972 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpio/gpio-rz.c
>  create mode 100644 drivers/pinctrl/sh-pfc/pfc-r7s72100.c

-- 
Regards,

Laurent Pinchart
