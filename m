From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Add GPIO support for the ACCES 104-IDI-48
Date: Thu, 10 Dec 2015 16:17:55 +0100
Message-ID: <CACRpkda1Ss5=0XRT8q_tfe7xd_f2fe4RngCCK7pSzz12p3w7sg@mail.gmail.com>
References: <20151129163346.GA13433@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151129163346.GA13433@sophia>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Nov 29, 2015 at 5:33 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDI-48 family of PC/104 utility boards feature 48
> individually optically isolated digital inputs. Enabled inputs feature
> change-of-state detection capability; if change-of-state detection is
> enabled, an interrupt is fired off if a change of input level
> (low-to-high or high-to-low) is detected. Change-of-state IRQs are
> enabled/disabled on 8-bit boundaries, for a total of six boundaries.
>
> This driver provides GPIO and IRQ support for these 48 channels of
> digital input. The base port address for the device may be configured
> via the idi_48_base module parameter. The interrupt line number for the
> device may be configured via the idi_48_irq module parameter.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
> Changes in v2:
>   - Reimplement irq_ack callback as a NOOP since status register read in
>     idi_48_irq_handler clears all pending interrupts.

Sorry I seem to have already applied an earlier version of the driver
to my tree.

Can you make an incremental patch fixing up what is on my
"devel" branch to what was in v2 instead?
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel

Yours,
Linus Walleij
