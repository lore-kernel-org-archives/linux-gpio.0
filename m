From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/8] gpio: use devres for irq generic chip
Date: Mon, 21 Aug 2017 00:03:48 +0200
Message-ID: <CACRpkdZ0BkCP3GAnLhWD4MLB1fuaK10C14mtR36HT2SwzxVNGA@mail.gmail.com>
References: <20170809122507.11149-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33224 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753300AbdHTWDt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Aug 2017 18:03:49 -0400
Received: by mail-oi0-f45.google.com with SMTP id f11so138619991oic.0
        for <linux-gpio@vger.kernel.org>; Sun, 20 Aug 2017 15:03:49 -0700 (PDT)
In-Reply-To: <20170809122507.11149-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 9, 2017 at 2:24 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> We now provide resource managed versions of irq_alloc_generic_chip()
> and irq_setup_generic_chip(). Use them in all relevant gpio drivers.
>
> v1 -> v2:
> - added three patches which explicitly disable driver unbinding for
>   non-modular drivers, only updated those built-in modules which already
>   use devres in their probe() functions
> - left out the sodaville patch since it explictly says it doesn't free
>   any resources

Argh missed the v2. I am indeed overloaded.

Applying this v2 series instead.

Yours,
Linus Walleij
