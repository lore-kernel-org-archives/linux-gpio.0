From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: max77620: select PINMUX
Date: Tue, 14 Jun 2016 08:56:51 +0200
Message-ID: <CACRpkdZkj+C7W8S9A1Hgngmn45x_zz_BaAQ758w-4tRvWJS51g@mail.gmail.com>
References: <1465831250-2689101-1-git-send-email-arnd@arndb.de> <1465831250-2689101-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36617 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751412AbcFNG4w (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 02:56:52 -0400
Received: by mail-oi0-f52.google.com with SMTP id p204so242778511oih.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2016 23:56:52 -0700 (PDT)
In-Reply-To: <1465831250-2689101-2-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 13, 2016 at 5:18 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The recently added max77620 driver fails to build when CONFIG_PINMUX
> is not set:
>
> pinctrl/pinctrl-max77620.c:272:21: error: variable 'max77620_pinmux_ops' has initializer but incomplete type
>  static const struct pinmux_ops max77620_pinmux_ops = {
>                      ^~~~~~~~~~
> pinctrl/pinctrl-max77620.c:273:2: error: unknown field 'get_functions_count' specified in initializer
>
> This adds the Kconfig 'select' statement that was clearly meant
> to be there and is used in all other pinmux drivers.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
