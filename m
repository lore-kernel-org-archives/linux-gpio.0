From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: altera: use of_mm_gpiochip_remove() to fix
 memory leak
Date: Wed, 15 Jul 2015 11:45:29 +0200
Message-ID: <CACRpkdYRWOCBjFByrhg69hNAreVZxQRi6khV4_E6yE3vh+TEuQ@mail.gmail.com>
References: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tien Hock Loh <thloh@altera.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 17, 2015 at 1:59 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This driver calls of_mm_gpiochip_add() to add a memory mapped gpio
> chip.  So, of_mm_gpiochip_remove() should be used when removing it.
>
> The direct call of gpiochip_remove() misses unmapping the register
> and freeing the label.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
