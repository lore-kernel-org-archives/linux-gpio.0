From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/2] pinctrl/amd: only handle irq if it is pending and
 unmasked
Date: Thu, 19 Jul 2018 16:54:48 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1807191654230.1693@nanos.tec.linutronix.de>
References: <20180717005719.258905-1-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717005719.258905-1-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, Daniel Drake <drake@endlessm.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, 16 Jul 2018, Daniel Kurtz wrote:

> The AMD pinctrl driver demultiplexes GPIO interrupts and fires off their
> individual handlers.
> 
> If one of these GPIO irqs is configured as a level interrupt, and its
> downstream handler is a threaded ONESHOT interrupt, the GPIO interrupt
> source is masked by handle_level_irq() until the eventual return of the
> threaded irq handler.  During this time the level GPIO interrupt status
> will still report as high until the actual gpio source is cleared - both
> in the individual GPIO interrupt status bit (INTERRUPT_STS_OFF) and in
> its corresponding "WAKE_INT_STATUS_REG" bit.
> 
> Thus, if another GPIO interrupt occurs during this time,
> amd_gpio_irq_handler() will see that the (masked-and-not-yet-cleared)
> level irq is still pending and incorrectly call its handler again.
> 
> To fix this, have amd_gpio_irq_handler() check for both interrupts status
> and mask before calling generic_handle_irq().
> 
> Note: Is it possible that this bug was the source of the interrupt storm
> on Ryzen when using chained interrupts before commit ba714a9c1dea85
> ("pinctrl/amd: Use regular interrupt instead of chained")?
> 
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>

Acked-by: Thomas Gleixner <tglx@linutronix.de>
