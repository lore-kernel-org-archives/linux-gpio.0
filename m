From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 08/18] gpio: add driver for Atheros AR5312 SoC GPIO controller
Date: Mon, 29 Sep 2014 11:04:35 +0200
Message-ID: <CACRpkdZTrE6q==SqtH91iYYSce9pzLkb=0_UY7a=jJSo8Zg7Bw@mail.gmail.com>
References: <1410723213-22440-1-git-send-email-ryazanov.s.a@gmail.com>
	<1410723213-22440-9-git-send-email-ryazanov.s.a@gmail.com>
	<CACRpkda2nNqb9iARw+ze=vsdmXVePGu+Fb5PMGo75FSCGJ+tDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:46783 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbaI2JEg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Sep 2014 05:04:36 -0400
Received: by mail-ig0-f181.google.com with SMTP id h18so2939322igc.8
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2014 02:04:35 -0700 (PDT)
In-Reply-To: <CACRpkda2nNqb9iARw+ze=vsdmXVePGu+Fb5PMGo75FSCGJ+tDA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Sep 29, 2014 at 11:03 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:

> This driver seems surplus, it's just MMIO. Use
> drivers/gpio/gpio-generic.c instead.

Bah, I'm talking crap. It does IRQs so it needs to be a custom
driver for sure. I'll take a second look.

Yours,
Linus Walleij
