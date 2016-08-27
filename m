From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/6] pinctrl: sirf: make atlas7 explicitly non-modular
Date: Sat, 27 Aug 2016 13:15:47 +0200
Message-ID: <CACRpkdbf1aGRjGLuxxo+7pgWLbf3LjYty=v52109Cg4vT9J3UA@mail.gmail.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com> <20160823211944.18554-6-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35619 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbcH0LPt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Aug 2016 07:15:49 -0400
Received: by mail-oi0-f49.google.com with SMTP id 6so8529057oih.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Aug 2016 04:15:48 -0700 (PDT)
In-Reply-To: <20160823211944.18554-6-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Aug 23, 2016 at 11:19 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Makefile currently controlling compilation of this code is:
>
>   drivers/pinctrl/sirf/pinctrl-atlas7.o
>     ---> drivers/pinctrl/sirf/Makefile:obj-y += pinctrl-atlas7.o
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Barry Song <baohua@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
