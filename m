From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: GPIO Char device and tools/gpio/gpio-utils.c
Date: Mon, 31 Jul 2017 14:22:06 +0200
Message-ID: <CACRpkdYKd1gyJNxyFY3GS4MZVJqPenoqzCKSBmWvvKbq4iszuA@mail.gmail.com>
References: <aa21e9a8-345d-b9db-e39c-e62d910794cc@cipherdyne.com> <546696b7-4be8-ef79-6436-d9eb0a41db52@cipherdyne.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:38554 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdGaMWJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 08:22:09 -0400
Received: by mail-it0-f44.google.com with SMTP id h199so124253806ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 05:22:08 -0700 (PDT)
In-Reply-To: <546696b7-4be8-ef79-6436-d9eb0a41db52@cipherdyne.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonathan Bennett <jbennett@cipherdyne.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jul 21, 2017 at 7:26 PM, Jonathan Bennett
<jbennett@cipherdyne.com> wrote:

> So to use GPIO pins through the chardev interface, one has to hold on to the file
> descriptor to keep the pins from reverting to their initial state.  Is this a bug, or
> intended behavior?

I do not remember putting any code in that would explicitly return the
GPIO line to
the inital state.

That said it makes some weird sense as people might be probing around with
the tools and then it would be good behaviour to leave things in the room like
they were arranged when you entered, don't you think?

I'd like to hear Bartosz take on this though, he is more versed with userspace
GPIO than me these days, and talk directly to users of this feature.

Yours,
Linus Walleij
