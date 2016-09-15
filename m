From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 8/8] gpio: don't include module.h in shared driver header
Date: Thu, 15 Sep 2016 14:05:24 +0200
Message-ID: <CACRpkda1hNBTWcyuVS78kgpUmP2FLU3ZpeG_inendxrQM4mxjQ@mail.gmail.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com> <20160912221631.15812-9-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36145 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934317AbcIOMFZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2016 08:05:25 -0400
Received: by mail-oi0-f41.google.com with SMTP id q188so65471080oia.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2016 05:05:25 -0700 (PDT)
In-Reply-To: <20160912221631.15812-9-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 13, 2016 at 12:16 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> Most shared headers in include/linux don't need to know what the
> internals of a struct module are; all they care about is that it
> is a struct and hence they may require a pointer to one.
>
> The advantage in this is that module.h is including a lot of stuff
> itself, and an otherwise empty C file that just contains module.h
> will result in ~750kB from CPP (compared to say 12kB from init.h)
>
> So we have approximately 50 instances of "struct module;" in the
> various include/linux headers already that help us keep module.h
> out of other headers; here we do the same for gpio.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Probably my mistake.
Thanks for tidying this up so nicely!

Patch applied.

Yours,
Linus Walleij
