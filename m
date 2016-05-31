From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: remove redundant owner assignments of drivers
Date: Tue, 31 May 2016 10:11:36 +0200
Message-ID: <CACRpkdbimqo_bBHooVgmsN4fTHwZ0xt9yOa8Dt4xu9=nkLwQ2Q@mail.gmail.com>
References: <1463968150-9334-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463968150-9334-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 23, 2016 at 3:49 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> A platform_driver need not set an owner since it will be populated
> by platform_driver_register().
> Likewise for mcb_driver (gpio-menz127.c).
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
