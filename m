From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stm32: Modify error handling for pinctrl_register
Date: Wed, 29 Jun 2016 10:33:25 +0200
Message-ID: <CACRpkdZURfExVneWCWT6xW4xgdVrFAoDYBfn=t2RKsohLzTb4A@mail.gmail.com>
References: <20160627142310.GA26798@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:35840 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbcF2Id0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 04:33:26 -0400
Received: by mail-ob0-f174.google.com with SMTP id mu6so15829258obc.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 01:33:26 -0700 (PDT)
In-Reply-To: <20160627142310.GA26798@amitoj-Inspiron-3542>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Mon, Jun 27, 2016 at 4:23 PM, Amitoj Kaur Chawla
<amitoj1606@gmail.com> wrote:

> pinctrl_register returns an ERR_PTR on error.
>
> The Coccinelle semantic patch used to make this change is as follows:
>
> @@
> expression e,e1,e2;
> @@
>
> e = pinctrl_register(...)
> ... when != e = e1
> if (
> -   e == NULL
> +   IS_ERR(e)
>    ) {
>      ...
>      return
> -      e2
> +      PTR_ERR(e)
>      ;
>      }
>
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>

I already have a patch like this in my tree it seems.

But very nice that cocinelle is now finding this!

Yours,
Linus Walleij
