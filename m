From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 25 (gpio-ingenic.c)
Date: Thu, 25 May 2017 10:27:18 -0700
Message-ID: <dc5f3758-fbab-b5bc-0b26-0681c0a89999@infradead.org>
References: <20170525124301.0ea98001@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33078 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936582AbdEYR1U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 13:27:20 -0400
In-Reply-To: <20170525124301.0ea98001@canb.auug.org.au>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On 05/24/17 19:43, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20170524:
> 

on x86_64, with:

# CONFIG_OF is not set
CONFIG_GPIOLIB=y
CONFIG_GPIO_INGENIC=y
CONFIG_COMPILE_TEST=y

../drivers/gpio/gpio-ingenic.c: In function 'ingenic_gpio_probe':
../drivers/gpio/gpio-ingenic.c:324:10: error: 'struct gpio_chip' has no member named 'of_node'
  jzgc->gc.of_node = dev->of_node;
          ^


config GPIO_INGENIC
	tristate "Ingenic JZ47xx SoCs GPIO support"
	depends on MACH_INGENIC || COMPILE_TEST
	select GPIOLIB_IRQCHIP

There should be some dependency on OF there I think.


-- 
~Randy
