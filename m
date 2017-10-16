From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [gpio:devel 12/12] drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27:
 error: 'struct gpio_chip' has no member named 'irq_base'; did you mean 'base'?
Date: Mon, 16 Oct 2017 23:15:57 +0200
Message-ID: <CACRpkdYyq0vw=9H2xRg1W4LVvdyc_m1-Mayo=ZvtB+_BQTrhjQ@mail.gmail.com>
References: <201710150916.Se4u1t6V%fengguang.wu@intel.com> <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
 <20171016080502.GB17369@ulmo> <20171016080821.GC17369@ulmo>
 <CACRpkdYuJeKQA+yyU1B0fvU2WoaFRNBHn3XVrGs1jgWXUOOmqg@mail.gmail.com>
 <20171016124656.GA6539@ulmo> <87po9n6t5e.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:55258 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753554AbdJPVP7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 17:15:59 -0400
Received: by mail-io0-f181.google.com with SMTP id e89so9890065ioi.11
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 14:15:59 -0700 (PDT)
In-Reply-To: <87po9n6t5e.fsf@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, kbuild test robot <fengguang.wu@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 16, 2017 at 4:53 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> Thanks for adding me in CC I wonder why I was not in CC in the original
> series whereas we properly fill the MAINTAINER file for this.

Because the change causing this was not touching any Armada
files.

It is a fallout from the driver using gpiolib internals. (chip->irq_base).

Yours,
Linus Walleij
