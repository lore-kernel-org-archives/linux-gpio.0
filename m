From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 2/2] pinctrl/amd: use byte access to clear irq/wake status bits
Date: Tue, 17 Jul 2018 07:30:22 -0500
Message-ID: <CAD8Lp446Zu=EhdzRE9pEoskMWeOHOovoAJ8qtrovEuZ2E7Z5VQ@mail.gmail.com>
References: <20180717005719.258905-1-djkurtz@chromium.org> <20180717005719.258905-2-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717005719.258905-2-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 16, 2018 at 7:57 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> Commit 6afb10267c1692 ("pinctrl/amd: fix masking of GPIO interrupts")
> changed to the clearing of interrupt status bits to a RMW in a critical
> section.  This works, but is a bit overkill.
>
> The relevant interrupt/wake status bits are in the Most Significant Byte
> of a 32-bit word.  These two are the only write-able bits in this byte.

I don't have the hardware to test this any more, and I also don't have
any docs to double if those are really the only writable bits, but
looking at the existing driver code it does seem to be the case.

I think you should retain the comment noting that the value of the
register may have changed since it was read just a few lines above
(and hence explaining more precisely why we make the special effort
just to modify the MSB), just in case there is further rework of this
code in future and we end up walking into the same trap. It was one of
those issues that took a frustratingly long time to figure out...

Thanks
Daniel
