From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pxa: export pxa2xx_pinctrl_init()
Date: Wed, 27 Jan 2016 13:33:23 +0100
Message-ID: <CACRpkdai_HysVqroBz-NcupxRF_2PPyHQnj8e8Ani6+04xre0A@mail.gmail.com>
References: <1453577113-14423-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33187 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932226AbcA0MdY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 07:33:24 -0500
Received: by mail-ob0-f170.google.com with SMTP id is5so5755192obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 04:33:24 -0800 (PST)
In-Reply-To: <1453577113-14423-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Jan 23, 2016 at 8:25 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Building pinctrl-pxa27x.c as a module causes a link error:
>
> ERROR: "pxa2xx_pinctrl_init" [drivers/pinctrl/pxa/pinctrl-pxa27x.ko] undefined!
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with Robert's ACK.

Yours,
Linus Walleij
