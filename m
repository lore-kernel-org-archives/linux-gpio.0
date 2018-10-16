From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: Drop parent irq assignment during cascade setup
Date: Tue, 16 Oct 2018 09:28:50 +0200
Message-ID: <CACRpkdYtZEiTcWs61HSmZjy0rgLbos=7Mo9N=OCpJDvf+Jhw1A@mail.gmail.com>
References: <20181008163216.97436-1-swboyd@chromium.org> <20181008163216.97436-3-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008163216.97436-3-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, evgreen@chromium.org, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 8, 2018 at 6:32 PM Stephen Boyd <swboyd@chromium.org> wrote:

> We want to set the irq parent for interrupts that we're setting up to be
> cascaded from another interrupt controller, but we may or may not have
> already mapped the gpiochip irqs into the kernel's virtual irq number
> space at this point. If we have mapped irqs before calling here, then
> we've gone through gpiochip_irq_map() and called irq_set_parent()
> already. If we haven't mapped irqs, then the gpiochip is dynamically
> mapping irqs and we can rely on gpiochip_irq_map() or the gpio driver's
> irqdomain ops to setup the irq parent properly.
>
> Either way, setting the parent here when cascading the gpiochip doesn't
> make much sense because it should be done at irq mapping time. In the
> dynamic mapping case, this code is mapping virq 0 to some parent virq in
> a loop. While that's benign, let's drop this code to simplify.
>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Yep this is some leftover from the past.

Patch applied!

Yours,
Linus Walleij
