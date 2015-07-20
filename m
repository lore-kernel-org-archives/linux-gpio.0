From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/4] pinctrl: sunxi: Implement proper irq DT parsing
Date: Mon, 20 Jul 2015 17:38:48 +0200
Message-ID: <55AD1608.7000302@redhat.com>
References: <1437396074-15791-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46892 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752940AbbGTPiv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 20 Jul 2015 11:38:51 -0400
In-Reply-To: <1437396074-15791-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

Hi,

On 20-07-15 14:41, Maxime Ripard wrote:
> Hi,
>
> So far the GPIO and pinctrl driver had a limited support for
> interrupts, and no documentation about the DT bindings. A few DT ended
> up using these external interrupts, relying on the default DT parsing
> logic.
>
> However, this doesn't really work, since there's still no
> documentation describing the expected behaviour, and we ended up with
> bindings different if you want to use a GPIO as interrupt (using the
> gpios property), or an interrupt over a GPIO (using the interrupts
> property) that doesn't really make sense and only brings confusion.
>
> Moreover, the "new" SoCs from Allwinner have multiple interrupt banks,
> while the previous generation had only one, which means that we cannot
> really express those interrupts with the default bindings anymore
> either.
>
> The point of this serie is to fix the current situation by introducing
> some custom DT parsing code to have a consistant binding with the GPIO
> one, which will also fix the multiple banks issues, and document it.
>
> Let me know what you think,
> Maxime

Series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


>
> Maxime Ripard (4):
>    pinctrl: sunxi: Use common functions to change irq_chip and handler
>    pinctrl: sunxi: Add irq_chip name
>    pinctrl: sunxi: Add custom irq_domain_ops
>    ARM: sunxi: dt: Convert users to the PIO interrupts binding
>
>   .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   | 37 ++++++++++++++-
>   arch/arm/boot/dts/sun4i-a10.dtsi                   |  3 +-
>   arch/arm/boot/dts/sun5i-a13-utoo-p66.dts           |  2 +-
>   arch/arm/boot/dts/sun5i.dtsi                       |  3 +-
>   arch/arm/boot/dts/sun6i-a31.dtsi                   |  3 +-
>   arch/arm/boot/dts/sun7i-a20-cubietruck.dts         |  2 +-
>   arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts          |  2 +-
>   arch/arm/boot/dts/sun7i-a20.dtsi                   |  3 +-
>   arch/arm/boot/dts/sun8i-a23-a33.dtsi               |  3 +-
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c              | 55 +++++++++++++++++-----
>   10 files changed, 88 insertions(+), 25 deletions(-)
>
