From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] pinctrl: mediatek: make mtk-common explicitly non-modular
Date: Sat, 27 Aug 2016 13:12:18 +0200
Message-ID: <CACRpkdY+XSQHpaTi2KOeP15Hqsaw59G7xFUVGE8umLjvdMV9SA@mail.gmail.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com> <20160823211944.18554-2-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34229 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbcH0LMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Aug 2016 07:12:19 -0400
Received: by mail-oi0-f47.google.com with SMTP id l203so142547669oib.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Aug 2016 04:12:19 -0700 (PDT)
In-Reply-To: <20160823211944.18554-2-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Aug 23, 2016 at 11:19 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Makefile currently controlling compilation of this code is:
>
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.o
>     ---> drivers/pinctrl/mediatek/Makefile:obj-y += pinctrl-mtk-common.o
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> We don't replace module.h with init.h since the file doesn't need that.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
