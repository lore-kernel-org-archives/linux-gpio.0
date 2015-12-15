From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: pxa: change the interrupt management
Date: Tue, 15 Dec 2015 14:15:51 +0100
Message-ID: <CACRpkdYKqWLZsEiSqoVxVikZ2RPToVHpmASoFPZmBnh0X_Qrcw@mail.gmail.com>
References: <1449960921-19002-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449960921-19002-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2015 at 11:55 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> The interrupt management is changed by this patch to rely on chip data
> instead of chained interrupts.
>
> The main goal is to loosen the dependency on the global pxa chip
> structure in favor of the passed chip data. The secondary goal is to
> better show in /proc/interrupts the difference between interrupts for
> gpio0 and gpio1 (directly wired to interrupt controller), and the other
> gpios (wired onto a third line in the interrupt controller).
>
> The last advantage of this patch is that the interrupt is actually
> requested, so that another driver cannot steal this line, or overwrite
> the handler.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Since v1: moved CONFIG_OF for pxa_irq_domain_ops

I already merged v1 and I don't like to rebase my tree,
can you send an incremental patch fixing this, based off
my "devel" branch?

Yours,
Linus Walleij
