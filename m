From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: add pinctrl_register_reason() to return proper
 error code
Date: Tue, 2 Jun 2015 14:56:23 +0200
Message-ID: <CACRpkdZywHgUHbMg-1gfBDPZ3uXHuBWMvkAUZgkDRbn6Hi2Ovg@mail.gmail.com>
References: <1432899016-18155-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36539 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758933AbbFBM4Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 08:56:24 -0400
Received: by obbea2 with SMTP id ea2so126771285obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2015 05:56:23 -0700 (PDT)
In-Reply-To: <1432899016-18155-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 29, 2015 at 1:30 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The pinctrl_register() just returns NULL on error, so the callers
> can not know the exact reason of the failure.
>
> Some of the pinctrl drivers return -EINVAL, some -ENODEV, and some
> -ENOMEM on error of pinctrl_register() , although the error code
> might be different from the actual cause of the error.
>
> This new function, pinctrl_register_reason(), helps the drivers get
> and return the appropriate error code.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>

It should be named pinctrl_register_strict() or something.
"reason" is anyways wrong, should be "cause", but please
use _strict().

> If this patch is accepted, I can send a series to replace
> the pinctrl_register() in each driver with pinctrl_register_reason().

If it is replaced *everywhere* there is no point in keeping
a separate function. Then you should just do a big
patch changing all usage sites and the original function.

Yours,
Linus Walleij
