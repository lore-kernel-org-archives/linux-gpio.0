From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: fix gpio input on gpio offsets >= 8
Date: Fri, 16 Aug 2013 17:19:58 +0200
Message-ID: <CACRpkdZ25a70wyzHbAn4dDRJcoCj02fkxUzB89Y2f-LJVXrEmA@mail.gmail.com>
References: <20130807215240.GA31924@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:43070 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755048Ab3HPPT6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 11:19:58 -0400
Received: by mail-ob0-f178.google.com with SMTP id ef5so2205772obb.9
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 08:19:58 -0700 (PDT)
In-Reply-To: <20130807215240.GA31924@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Ruder <andy@aeruder.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>

On Wed, Aug 7, 2013 at 11:52 PM, Andrew Ruder <andy@aeruder.net> wrote:

> This change fixes a regression introduced by commit
> f5f0b7aa8 (gpio: pca953x: make the register access by GPIO bank)
>
> When the pca953x driver was converted to using 8-bit reads/writes
> the bitmask in pca953x_gpio_get_value wasn't adjusted with a
> modulus BANK_SZ and consequently looks at the wrong bits in the
> input register.
>
> Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>

Patch applied with Gregory's ACK.

Yours,
Linus Walleij
