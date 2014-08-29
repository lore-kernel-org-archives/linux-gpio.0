From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: syscon: reuse for keystone 2 socs
Date: Fri, 29 Aug 2014 07:53:14 +0200
Message-ID: <CACRpkdb-JYAu39wE9_Byeh4FUgitB_TJmr+HrNOGFSAu82wk7A@mail.gmail.com>
References: <1407946582-20927-1-git-send-email-grygorii.strashko@ti.com>
	<1407946582-20927-4-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:59853 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751506AbaH2FxO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 01:53:14 -0400
Received: by mail-oa0-f45.google.com with SMTP id n16so1452133oag.18
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2014 22:53:14 -0700 (PDT)
In-Reply-To: <1407946582-20927-4-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Aug 13, 2014 at 6:16 PM, Grygorii Strashko
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

OK overall I'm getting used to the idea of merging this.

> +#ifdef CONFIG_ARCH_KEYSTONE
(...)
> +#endif

Can you please remove the ifdefs. I don't mind the minimal growth
in footprint, and it makes the code simpler to read.

Yours,
Linus Walleij
