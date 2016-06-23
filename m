From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] gpio: of: move chip->of_gpio_n_cells checking to of_gpiochip_add()
Date: Thu, 23 Jun 2016 09:36:15 +0200
Message-ID: <CACRpkdZE0sWtMAK-AqF6D-vaNTHj6y5e9woBHwD7Cfc0RoO2Pw@mail.gmail.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com> <1465898827-2229-4-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465898827-2229-4-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 14, 2016 at 12:07 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Do this sanity check only once when the gpio_chip is added
> rather than every time gpio-hog is handled.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
