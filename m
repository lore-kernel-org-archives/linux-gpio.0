From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [gpio:devel 12/12] drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27: error: 'struct gpio_chip' has no member named 'irq_base'; did you mean 'base'?
Date: Thu, 19 Oct 2017 13:16:40 +0200
Message-ID: <87zi8n5qw7.fsf@free-electrons.com>
References: <201710150916.Se4u1t6V%fengguang.wu@intel.com>
        <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
        <20171016080502.GB17369@ulmo> <20171016080821.GC17369@ulmo>
        <CACRpkdYuJeKQA+yyU1B0fvU2WoaFRNBHn3XVrGs1jgWXUOOmqg@mail.gmail.com>
        <20171016124656.GA6539@ulmo> <87po9n6t5e.fsf@free-electrons.com>
        <CACRpkdYyq0vw=9H2xRg1W4LVvdyc_m1-Mayo=ZvtB+_BQTrhjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46587 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752002AbdJSLQm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2017 07:16:42 -0400
In-Reply-To: <CACRpkdYyq0vw=9H2xRg1W4LVvdyc_m1-Mayo=ZvtB+_BQTrhjQ@mail.gmail.com>
        (Linus Walleij's message of "Mon, 16 Oct 2017 23:15:57 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus and Thierry,
 
 On lun., oct. 16 2017, Linus Walleij <linus.walleij@linaro.org> wrote:

> On Mon, Oct 16, 2017 at 4:53 PM, Gregory CLEMENT
> <gregory.clement@free-electrons.com> wrote:
>
>> Thanks for adding me in CC I wonder why I was not in CC in the original
>> series whereas we properly fill the MAINTAINER file for this.
>
> Because the change causing this was not touching any Armada
> files.
>
> It is a fallout from the driver using gpiolib
> internals. (chip->irq_base).

OK I see.

About the patch itself I tested it on the Armada 3720 DB and it's OK for
me:

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory

>
> Yours,
> Linus Walleij

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
