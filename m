From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpiolib: skip unwanted events, don't convert them to
 opposite edge
Date: Mon, 3 Jul 2017 14:07:15 +0300
Message-ID: <CAHp75Vddwkxgj6uLc9GSqqAF0PQCzX9a2QyyBhE7GviVBJH8jQ@mail.gmail.com>
References: <1499073123-13393-1-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:33181 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753032AbdGCLHQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2017 07:07:16 -0400
In-Reply-To: <1499073123-13393-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jul 3, 2017 at 12:12 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> The previous fix for filtering out of unwatched events was not entirely
> correct. Instead of skipping the events we don't want, they are now
> interpreted as events with opposing edge.
>
> In order to fix it: always read the GPIO line value on interrupt and
> only emit the event if it corresponds with the event type we requested.

>         struct lineevent_state *le = p;
>         struct gpioevent_data ge;
> -       int ret;
> +       int ret, level;

I prefer
int level;
int ret;

Though it's matter of taste (I don't remember which one Linus' preferable).

-- 
With Best Regards,
Andy Shevchenko
