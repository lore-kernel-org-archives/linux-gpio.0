From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: move gpiod_set_array_value_priv()
Date: Sat, 30 Apr 2016 12:58:23 +0200
Message-ID: <CACRpkdZ4P=tFRP97briZfN0unuC=oDoCBja3o5KFx9YLCGtmsA@mail.gmail.com>
References: <1461660663-17207-1-git-send-email-linus.walleij@linaro.org>
	<CAAVeFuJHBb6qSVeckJdJQtJ93b-xvHo8CQoATsiE-TMGQxHVYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:32809 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751070AbcD3K6Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Apr 2016 06:58:24 -0400
Received: by mail-oi0-f42.google.com with SMTP id v145so111680443oie.0
        for <linux-gpio@vger.kernel.org>; Sat, 30 Apr 2016 03:58:24 -0700 (PDT)
In-Reply-To: <CAAVeFuJHBb6qSVeckJdJQtJ93b-xvHo8CQoATsiE-TMGQxHVYA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Thu, Apr 28, 2016 at 7:59 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, Apr 26, 2016 at 5:51 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> This renames gpiod_set_array_value_priv() to
>> gpiod_set_array_value_complex() and moves it to the gpiolib.h
>> private header file so we can reuse it in the subsystem.
>
> Why "complex"?

Couldn't come up with anything better. It is not private anymore
as I want to break out the chardev stuff to its own file.

>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks!

Yours,
Linus Walleij
