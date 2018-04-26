From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: add hogs support for machine code
Date: Thu, 26 Apr 2018 14:07:20 +0200
Message-ID: <CACRpkda+K3-=sPpJO90rjW0=+bsQ1uYT6E9Hp+G+-OEyTpc=fg@mail.gmail.com>
References: <20180410203028.11412-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180410203028.11412-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jonathan Corbet <corbet@lwn.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 10, 2018 at 10:30 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Board files constitute a significant part of the users of the legacy
> GPIO framework. In many cases they only export a line and set its
> desired value. We could use GPIO hogs for that like we do for DT and
> ACPI but there's no support for that in machine code.
>
> This patch proposes to extend the machine.h API with support for
> registering hog tables in board files.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> v1 -> v2:
> - kbuild bot complains about enum gpiod_flags having incomplete type
>   although it builds fine for me locally: change the type of dflags
>   to int

I like the idea and thinking behind this patch, so patch applied.

It's a bit of code to carry, so if it doesn't see any use, I will simply
revert it :)

But I bet you intend to follow up with some machine patches
and then it is immediately worth it.

Yours,
Linus Walleij
