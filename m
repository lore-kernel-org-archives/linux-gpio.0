From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: nomadik: hide nmk_gpio_get_mode when unused
Date: Mon, 9 May 2016 11:59:32 +0200
Message-ID: <CACRpkdaYkALuRLZ2LU-o-H97rvTLdCmqQf8Zs6sy-tjamuunnA@mail.gmail.com>
References: <1462289221-861102-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33349 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114AbcEIJ7d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 May 2016 05:59:33 -0400
Received: by mail-oi0-f43.google.com with SMTP id v145so204034347oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 May 2016 02:59:32 -0700 (PDT)
In-Reply-To: <1462289221-861102-1-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alessandro Rubini <rubini@unipv.it>, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Thomas Gleixner <tglx@linutronix.de>, Jonas Gorski <jogo@openwrt.org>, Irina Tirdea <irina.tirdea@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 3, 2016 at 5:26 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> nmk_gpio_get_mode is only used in one place, and that is conditionally
> compiled if DEBUG_FS is enabled. A recent cleanup has marked the
> definition 'static', which now leads to a warning:
>
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:614:12: error: 'nmk_gpio_get_mode' defined but not used [-Werror=unused-function]
>  static int nmk_gpio_get_mode(struct nmk_gpio_chip *nmk_chip, int offset)
>             ^~~~~~~~~~~~~~~~~
>
> Moving the function itself inside the #ifdef shuts it up again.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 5e81e0a0913c ("pinctrl: nomadik: use BIT() with offsets consequently")

Patch applied!

Yours,
Linus Walleij
