From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpiolib: Convert fwnode_get_named_gpiod() to
 configure GPIO
Date: Wed, 11 Jan 2017 13:21:09 +0100
Message-ID: <CACRpkdbAwpg581qodaqyUJBwp4DMCqS4kv2AjDFFuszgryZhrw@mail.gmail.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com> <20170109140228.47613-4-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:34007 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965977AbdAKMVL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 07:21:11 -0500
Received: by mail-qk0-f182.google.com with SMTP id a20so207239848qkc.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 04:21:10 -0800 (PST)
In-Reply-To: <20170109140228.47613-4-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Mon, Jan 9, 2017 at 3:02 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Make fwnode_get_named_gpiod() consistent with the rest of gpiod_get() like API,
> i.e. configure GPIO pin immediately after request.
>
> Besides obvious clean up it will help to configure pins based on firmware
> provided resources.
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is overall fine. However I have another patch in the works from
Alexander Stein to pass down the label to the core properly, can you look
at this patch too, so we don't have to mess around too much?
http://marc.info/?l=linux-gpio&m=148179211709228&w=2

Which patch should we base on which patch? Or can they be
combined into one?

That patch has been held back awaiting ACKs and already
has an ACK from Jacek so I would merge it first. Could you
rebase this patch on top of Alexander's patch?

Yours,
Linus Walleij
