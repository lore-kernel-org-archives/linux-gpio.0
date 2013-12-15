From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 1/2] gpio: davinci: get rid of DAVINCI_N_GPIO
Date: Sun, 15 Dec 2013 17:27:11 +0530
Message-ID: <52AD9917.1050901@ti.com>
References: <1385048076-7875-1-git-send-email-grygorii.strashko@ti.com>	<1385048076-7875-2-git-send-email-grygorii.strashko@ti.com> <CACRpkdYpza8A27Ypz7absfhtauB7KXvKNvHVP3UjUJ1_hEpApg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:38486 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753297Ab3LOL6Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 15 Dec 2013 06:58:16 -0500
In-Reply-To: <CACRpkdYpza8A27Ypz7absfhtauB7KXvKNvHVP3UjUJ1_hEpApg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Friday 29 November 2013 02:03 PM, Linus Walleij wrote:
> On Thu, Nov 21, 2013 at 4:34 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
>> Since Davinci GPIO driver is moved to support gpiolib it has to use
>> ARCH_NR_GPIOS (can be configured using CONFIG_ARCH_NR_GPIO Kconfig
>> option) configuration instead of any mach/platform specific options.
>>
>> Hence, replace private DAVINCI_N_GPIO with common ARCH_NR_GPIOS. This is
>> safe because default value for ARCH_NR_GPIOS=256 and maximum number of
>> supported GPIOs for Davinci is DAVINCI_N_GPIO=144.
>>
>> More over, this is one of steps to re-use Davinci GPIO driver by other
>> mach/platform.
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Added to v3.14/gpio of my k.org tree with Prabhakar's, Santosh's and
your acks.

> 
> Now we have a handful of people patching DaVinci GPIOs...
> 
> Sekhar: can you coordinate the different DaVinci patches? If you want me
> to take a complete set of stuff at the end of the day you can give me a
> pull request for inclusion into the GPIO tree.

Will do.

Thanks,
Sekhar
