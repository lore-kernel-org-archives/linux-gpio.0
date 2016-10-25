From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: of: fix GPIO drivers with multiple gpio_chip for
 a single node
Date: Tue, 25 Oct 2016 14:09:44 +0200
Message-ID: <CACRpkdYZaOjQ0ctg54w2hJisPcr7RJH4QRsman04Ejsjnci3Jw@mail.gmail.com>
References: <1477360064-6644-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:37453 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755733AbcJYMJp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 08:09:45 -0400
Received: by mail-qk0-f175.google.com with SMTP id w69so18338942qka.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2016 05:09:45 -0700 (PDT)
In-Reply-To: <1477360064-6644-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 25, 2016 at 3:47 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Sylvain Lemieux reports the LPC32xx GPIO driver is broken since
> commit 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and
> struct gg_data").  Probably, gpio-etraxfs.c and gpio-davinci.c are
> broken too.
>
> Those drivers register multiple gpio_chip that are associated to a
> single OF node, and their own .of_xlate() checks if the passed
> gpio_chip is valid.
>
> Now, the problem is of_find_gpiochip_by_node() returns the first
> gpio_chip found to match the given node.  So, .of_xlate() fails,
> except for the first GPIO bank.
>
> Reverting the commit could be a solution, but I do not want to go
> back to the mess of struct gg_data.  Another solution here is to
> take the match by a node pointer and the success of .of_xlate().
> It is a bit clumsy to call .of_xlate twice; for gpio_chip matching
> and for really getting the gpio_desc index.  Perhaps, our long-term
> goal might be to convert the drivers to single chip registration,
> but this commit will solve the problem until then.
>
> Fixes: 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and struct gg_data")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reported-by: Sylvain Lemieux <slemieux.tyco@gmail.com>
> Tested-by: David Lechner <david@lechnology.com>
> ---
>
> Changes in v2:
>   - correcton pointed out by Sylvain:
>        chip->of_xlate(chip, gpiospec, NULL) >= 0

Patch applied for fixes.

Yours,
Linus Walleij
