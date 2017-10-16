From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [bug report] gpio: reflect base and ngpio into gpio_device
Date: Mon, 16 Oct 2017 14:08:58 +0200
Message-ID: <CACRpkdb0qOqvt2aUGdKj1GRY6nQSfjQ0_xeZOAQjfe5zP7Ojuw@mail.gmail.com>
References: <20171012210824.33pc7gme3shvubn7@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:43048 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751287AbdJPMI7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 08:08:59 -0400
Received: by mail-io0-f175.google.com with SMTP id 134so11611091ioo.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 05:08:59 -0700 (PDT)
In-Reply-To: <20171012210824.33pc7gme3shvubn7@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Oct 12, 2017 at 11:08 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> drivers/gpio/gpiolib.c
>   2345  int gpiod_direction_output(struct gpio_desc *desc, int value)
>   2346  {
>   2347          struct gpio_chip *gc = desc->gdev->chip;
>   2348          int ret;
>   2349
>   2350          VALIDATE_DESC(desc);
>
> I'm not a huge fan of the VALIDATE_DESC() macro because it has hidden
> returns in it...

It was the best I could come up with. It's either this macro, or duplicate
the same code all over the place which would be a mess.

This is the lesser evil IMO, if you have better ideas, .... share them. :)
(Duplicating the descriptor check at every site is not a good idea.
Static inlines cannot be used, because we need to return if the descriptor
is invalid. You get the picture...)

>  But actually it's the earlier desc->gdev->chip
> dereference which is wrong.  We should probably move that below the
> checks for NULL.

True. I bet there is already a patch in my inbox ;)

Yours,
Linus Walleij
