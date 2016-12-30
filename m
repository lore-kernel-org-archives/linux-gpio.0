From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: core: Add generic pinctrl functions for
 managing groups
Date: Fri, 30 Dec 2016 15:09:42 +0100
Message-ID: <CACRpkdaKQDsNEWu9y1QeJXGARRvWEZ6U5CZH_tFDn4f2rLskwg@mail.gmail.com>
References: <20161227172003.6517-1-tony@atomide.com> <20161227172003.6517-4-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:34152 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751854AbcL3OJo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 09:09:44 -0500
Received: by mail-qt0-f179.google.com with SMTP id d45so173255216qta.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 06:09:43 -0800 (PST)
In-Reply-To: <20161227172003.6517-4-tony@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Nishanth Menon <nm@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>

On Tue, Dec 27, 2016 at 6:20 PM, Tony Lindgren <tony@atomide.com> wrote:

> We can add generic helpers for function handling for cases where the pin
> controller driver does not need to use static arrays.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Patch applied!

> +config GENERIC_PINMUX
> +       bool
> +       select PINMUX

I applied the first that had GENERIC_PINCTRL instead,

Then I went in and renamed this GENERIC_PINCTRL_GROUPS
since that is what it's all about.

Sent out as separate patch!

Yours,
Linus Walleij
