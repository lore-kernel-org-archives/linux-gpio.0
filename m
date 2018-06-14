From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: uniphier: set legitimate irq trigger type in
 .to_irq hook
Date: Thu, 14 Jun 2018 16:20:01 +0200
Message-ID: <CACRpkdYKO6BArTXzk9ms70AJrNC4kAk_ZyaNHUGJANwuBqqUtg@mail.gmail.com>
References: <1528954065-25563-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528954065-25563-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 14, 2018 at 7:27 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> If a GPIO chip is a part of a hierarchy IRQ domain, there is no
> way to specify the trigger type when gpio(d)_to_irq() allocates an
> interrupt on-the-fly.
>
> Currently, uniphier_gpio_to_irq() sets IRQ_TYPE_NONE, but it causes
> an error in the .alloc() hook of the parent domain.
> (drivers/irq/irq-uniphier-aidet.c)
>
> Even if we change irq-uniphier-aidet.c to accept the NONE type,
> GIC complains about it since commit 83a86fbb5b56 ("irqchip/gic:
> Loudly complain about the use of IRQ_TYPE_NONE").
>
> Instead, use IRQ_TYPE_LEVEL_HIGH as a temporary value when an irq
> is allocated.  irq_set_irq_type() will override it when the irq is
> really requested.
>
> Fixes: dbe776c2ca54 ("gpio: uniphier: add UniPhier GPIO controller driver")
> Reported-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Tested-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>

Patch applied for fixes!

Yours,
Linus Walleij
