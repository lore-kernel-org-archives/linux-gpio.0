From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/10] iio: stx104: Change STX104 dependency to ISA_BUS
Date: Fri, 8 Apr 2016 08:31:58 -0400
Message-ID: <20160408123158.GB18202@sophia>
References: <cover.1460040201.git.vilhelm.gray@gmail.com>
 <783be62acf68b35f3fe4785a2cedfe017624688b.1460040201.git.vilhelm.gray@gmail.com>
 <20160408004503.GB10211@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160408004503.GB10211-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 07, 2016 at 05:45:03PM -0700, Guenter Roeck wrote:
>This means for this and other similar drivers that the driver is no longer
>supported on architectures which support ISA but not the newly introduced
>ISA_BUS. Affected architectures are alpha, arm, m32r, m68k, mips, powerpc,
>and parisc.
>
>A typical example is SCSI_AHA1542, which is no longer supported on those
>architectures. It builds, but isa_register_driver() will be a dummy and fail.
>Actually, this is true for _all_ drivers calling isa_register_driver().
>
>I hope this is understood and doesn't cause any problems.
>
>Thanks,
>Guenter

That's a good catch. I overlooked this when I submitted the ISA_BUS
patch; I had improperly assumed the ISA option to have a dependency on
X86_32 based on arch/x86/Kconfig. The intention of the ISA_BUS is to
allow the proper definition of the isa_register_driver and
isa_unregister_driver functions without the dependency on X86_32 (e.g.
on X86_64 systems). How can this be resolved without ending support for
ISA on these other architectures? Would it be appropriate to add the
ISA_BUS dependency to every "config ISA" block for the other
architectures?

My avoidance of making ISA a selection of ISA_BUS is the possibility of
an invalid configuration: a user may initially enable ISA_BUS, then
later disable ISA, resulting in ISA_BUS remaining enabled without ISA
selected.

As a side note, should the dummy isa_register_driver return 0? Would it
be more appropriate for it to return an error code to indicate lack of
support for ISA, rather than silently fail?

William Breathitt Gray
