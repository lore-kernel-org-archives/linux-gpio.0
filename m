From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: poll InterruptEnable bits in amd_gpio_irq_set_type
Date: Tue, 25 Sep 2018 12:41:34 +0200
Message-ID: <CACRpkdZrmjjQ4CQFgV9gmCzEJVwoE1850+4iMen2-sCK3xp0Eg@mail.gmail.com>
References: <20180922195826.175628-1-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180922195826.175628-1-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Daniel Drake <drake@endlessm.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 22, 2018 at 9:58 PM Daniel Kurtz <djkurtz@chromium.org> wrote:

> From the AMD BKDG, if WAKE_INT_MASTER_REG.MaskStsEn is set, a software
> write to the debounce registers of *any* gpio will block wake/interrupt
> status generation for *all* gpios for a length of time that depends on
> WAKE_INT_MASTER_REG.MaskStsLength[11:0].  During this period the Interrupt
> Delivery bit (INTERRUPT_ENABLE) will read as 0.
>
> In commit 4c1de0414a1340 ("pinctrl/amd: poll InterruptEnable bits in
> enable_irq") we tried to fix this same "gpio Interrupts are blocked
> immediately after writing debounce registers" problem, but incorrectly
> assumed it only affected the gpio whose debounce was being configured
> and not ALL gpios.
>
> To solve this for all gpios, we move the polling loop from
> amd_gpio_irq_enable() to amd_gpio_irq_set_type(), while holding the gpio
> spinlock.  This ensures that another gpio operation (e.g.
> amd_gpio_irq_unmask()) can read a temporarily disabled IRQ and
> incorrectly disable it while trying to modify some other register bits.
>
> Fixes: 4c1de0414a1340 pinctrl/amd: poll InterruptEnable bits in enable_irq
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>

Patch applied for fixes.

Thanks!
Linus Walleij
