From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 13/15] pinctrl-sx150x: Use handle_bad_irq instead of handle_edge_irq
Date: Tue, 8 Nov 2016 09:47:23 +0100
Message-ID: <CACRpkdZw-g+OJcnvTpdzaUMAyCvrjNMQu6d31f-6MZHS2OL_2w@mail.gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com> <1478537603-23653-14-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-14-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 7, 2016 at 5:53 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> Althought the function passed as a "handler" during GPIO chip
> instantiation is not going to ever be called, specifying handle_edge_irq
> there makes for a rather confusing read, both because no "ack" callback
> in specified for irqchip and because there's no acking action is
> necessary.
>
> Specify handle_bad_irq instead a make a note of the situation. This
> commit should be a no-op behaviour wise.
>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Patch applied!

Yours,
Linus Walleij
