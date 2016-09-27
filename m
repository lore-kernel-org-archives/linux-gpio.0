From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Tue, 27 Sep 2016 15:12:03 +0300
Message-ID: <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
References: <20160927002650.4316-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:57568 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932916AbcI0MMM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2016 08:12:12 -0400
In-Reply-To: <20160927002650.4316-1-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, linus.walleij@linaro.org
Cc: shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stefan,

On 09/27/2016 03:26 AM, Stefan Agner wrote:
> If a GPIO gets freed after selecting a new pinctrl configuration
> the driver should not change pinctrl anymore. Otherwise this will
> likely lead to a unusable pin configuration for > the newly selected
> pinctrl.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> This turned out to be problematic when using the I2C GPIO bus recovery
>functionality. After muxing back to I2C, the GPIO is being freed, which
> cased I2C to stop working completely.

IMHO this recent "i.MX I2C GPIO bus recovery" feature is kind of a hack,
for example I believe it breaks I2C bus driver initialization on i.MX31
boards, where today there is no pinctrl driver at all.

IMHO something like I've partially described in the recent "Requesting as
a GPIO a pin already used through pinctrl" topic should be done here.
Could you consider to add another pinctrl-1 group with alternative GPIO
line mux/config settings to an i2c controller device node and apply it,
when you need a bus recovery? You may find references how this kind of
dynamic pinctrl management is done within mmc/sd subsystem.

By the way did I miss a patch, which falls back to mux settings on
.gpio_disable_free call for non-Vybrid platforms?

--
With best wishes,
Vladimir
