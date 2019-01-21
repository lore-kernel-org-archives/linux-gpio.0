From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mcp23s08: Allocate irq_chip dynamic
Date: Mon, 21 Jan 2019 14:19:49 +0100
Message-ID: <CACRpkdZFFu=wgHw0BqXUHiC5euGwWuYbr5bH60zDvFr+q394=w@mail.gmail.com>
References: <20190111162516.28197-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111162516.28197-1-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 11, 2019 at 4:16 PM Lars Poeschel <poeschel@lemonage.de> wrote:

> Keeping the irq_chip definition static shares it with multiple instances
> of the mcp23s08 gpiochip in the system. This is bad and now we get this
> warning from gpiolib core:
>
> "detected irqchip that is shared with multiple gpiochips: please fix the
> driver."
>
> Hence, move the irq_chip definition from being driver static into the
> struct mcp23s08. So a unique irq_chip is used for each gpiochip
> instance.
>
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>

Patch applied.

Yours,
Linus Walleij
