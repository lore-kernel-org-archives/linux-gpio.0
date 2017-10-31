From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/7] gpio: brcmstb: release the bgpio lock during irq handlers
Date: Tue, 31 Oct 2017 10:29:18 +0100
Message-ID: <CACRpkdaqenb0nhhMYLhT=pM=6exj71+7tqM_4G0mc2+6ATxGwQ@mail.gmail.com>
References: <20171024195451.30535-1-opendmb@gmail.com> <20171024195451.30535-4-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171024195451.30535-4-opendmb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 24, 2017 at 9:54 PM, Doug Berger <opendmb@gmail.com> wrote:

> The basic memory-mapped GPIO controller lock must be released
> before calling the registered GPIO interrupt handlers to allow
> the interrupt handlers to access the hardware.
>
> Examples of why a GPIO interrupt handler might want to access
> the GPIO hardware include an interrupt that is configured to
> trigger on rising and falling edges that needs to read the
> current level of the input to know how to respond, or an
> interrupt that causes a change in a GPIO output in the same
> bank. If the lock is not released before enterring the handler
> the hardware accesses will deadlock when they attempt to grab
> the lock.
>
> Since the lock is only needed to protect the calculation of
> unmasked pending interrupts create a dedicated function to
> perform this and hide the complexity.
>
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Gregory Fong <gregory.0xf0@gmail.com>

Patch applied.

Yours,
Linus Walleij
