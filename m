From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl/amd: use byte access to clear irq/wake status bits
Date: Fri, 20 Jul 2018 17:38:17 -0600
Message-ID: <CAGS+omDPkC=Tv7SJ91cLxrFnab_VPC3VZRAugkvAUokkkoYSTg@mail.gmail.com>
References: <20180717005719.258905-1-djkurtz@chromium.org> <20180717005719.258905-2-djkurtz@chromium.org>
 <CAD8Lp446Zu=EhdzRE9pEoskMWeOHOovoAJ8qtrovEuZ2E7Z5VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD8Lp446Zu=EhdzRE9pEoskMWeOHOovoAJ8qtrovEuZ2E7Z5VQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Shyam-sundar.S-k@amd.com, Nehal-bakulchandra.Shah@amd.com, Ken.Xue@amd.com, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Daniel,

On Tue, Jul 17, 2018 at 6:30 AM Daniel Drake <drake@endlessm.com> wrote:
>
> On Mon, Jul 16, 2018 at 7:57 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> > Commit 6afb10267c1692 ("pinctrl/amd: fix masking of GPIO interrupts")
> > changed to the clearing of interrupt status bits to a RMW in a critical
> > section.  This works, but is a bit overkill.
> >
> > The relevant interrupt/wake status bits are in the Most Significant Byte
> > of a 32-bit word.  These two are the only write-able bits in this byte.
>
> I don't have the hardware to test this any more, and I also don't have
> any docs to double if those are really the only writable bits, but
> looking at the existing driver code it does seem to be the case.
>
> I think you should retain the comment noting that the value of the
> register may have changed since it was read just a few lines above
> (and hence explaining more precisely why we make the special effort
> just to modify the MSB), just in case there is further rework of this
> code in future and we end up walking into the same trap. It was one of
> those issues that took a frustratingly long time to figure out...

Sounds reasonable.  How about:

-                       /* Clear interrupt.
-                        * We must read the pin register again, in case the
-                        * value was changed while executing
-                        * generic_handle_irq() above.
+                       /*
+                        * Write-1-to-clear irq/wake status bits in MSByte.
+                        * All other bits in this byte are read-only.
+                        * This avoids modifying the lower 24-bits
because they may have
+                        *  changed while executing generic_handle_irq() above.
                         */


>
> Thanks
> Daniel
