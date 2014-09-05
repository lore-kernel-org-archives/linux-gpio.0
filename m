From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/4] gpio: syscon: reuse for keystone 2 socs
Date: Fri, 5 Sep 2014 10:30:20 +0200
Message-ID: <CACRpkdbz3zXjVSRXtyE1A5-QjJ3dTiuCO=r=sFY1UZe+VnORgw@mail.gmail.com>
References: <1409763935-5713-1-git-send-email-grygorii.strashko@ti.com>
	<1409763935-5713-4-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:53011 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756247AbaIEIaW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Sep 2014 04:30:22 -0400
Received: by mail-ob0-f175.google.com with SMTP id wp4so8383954obc.6
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2014 01:30:21 -0700 (PDT)
In-Reply-To: <1409763935-5713-4-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Sep 3, 2014 at 7:05 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> On Keystone SOCs, ARM host can send interrupts to DSP cores using the
> DSP GPIO controller IP. Each DSP GPIO controller provides 28 IRQ signals for
> each DSP core. This is one of the component used by the IPC mechanism used
> on Keystone SOCs.
>
> Keystone 2 DSP GPIO controller has specific features:
> - each GPIO can be configured only as output pin;
> - setting GPIO value to 1 causes IRQ generation on target DSP core;
> - reading pin value returns 0 - if IRQ was handled or 1 - IRQ is still
>   pending.
>
> This patch updates gpio-syscon driver to be reused by Keystone 2 SoCs,
> because the Keystone 2 DSP GPIO controller is controlled through Syscon
> devices and, as requested by Linus Walleij, such kind of GPIO controllers
> should be integrated with drivers/gpio/gpio-syscon.c driver.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  .../devicetree/bindings/gpio/gpio-dsp-keystone.txt | 39 ++++++++++++++++++++++

Rob, can you look at these bindings?

I suspect they may fall under your category of "not a real device, but
leaking Linux implementation internals".

Yours,
Linus Walleij
