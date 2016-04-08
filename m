From: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/10] iio: stx104: Change STX104 dependency to ISA_BUS
Date: Fri, 8 Apr 2016 11:09:22 -0400
Message-ID: <20160408150922.GA28058@sophia>
References: <cover.1460040201.git.vilhelm.gray@gmail.com>
 <783be62acf68b35f3fe4785a2cedfe017624688b.1460040201.git.vilhelm.gray@gmail.com>
 <20160408004503.GB10211@roeck-us.net>
 <20160408123158.GB18202@sophia>
 <5707AF91.5010704@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5707AF91.5010704-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 08, 2016 at 06:18:09AM -0700, Guenter Roeck wrote:
> From the context, arm and mips use "select ISA". For those, adding and
>auto-selecting ISA_BUS would make sense. For the remaining architectures
>you could simply add "config ISA_BUS". I would suggest to update default
>configurations, though.
>
>There is also "um", for which you effectively disabled ISA support
>as far as I can see. You might want to look into that as well.
>
>> My avoidance of making ISA a selection of ISA_BUS is the possibility of
>> an invalid configuration: a user may initially enable ISA_BUS, then
>> later disable ISA, resulting in ISA_BUS remaining enabled without ISA
>> selected.
>>
>Does that even make sense ? Not sure I understand why you don't just
>select ISA_BUS if ISA is selected. That would also be backward compatible
>and avoid the problem I was concerned about.

I feel now that the introduction of the ISA_BUS option may the wrong
approach to resolve lack of ISA support for the X86_64 architecture;
adding ISA_BUS depends or selects through various Kconfigs would simply
obfuscate the ISA option. The true issue is that various driver
configs are assuming X86_32 architecture when they depend on the ISA
option, but the ISA bus does not require an X86_32 architecture.

The proper resolution then is to remove the misguided ISA_BUS option and
move the X86_32 dependency to the relevant drivers configs explicitly.
A grep for isa_register_driver calls within the kernel reveals that only
a few drivers explicitly use it. It should be trivial to create a patch
to add the explicit X86_32 dependency to the relevant drivers, so I will
submit one soon when I get the time to decouple X86_32 from the ISA
config option.

Once ISA is freed from the X86_32 dependency, I will simply use it
instead of ISA_BUS, and rebase this patchset for version 2.

>> As a side note, should the dummy isa_register_driver return 0? Would it
>> be more appropriate for it to return an error code to indicate lack of
>> support for ISA, rather than silently fail?
>>
>One should think so.
>
>Thanks,
>Guenter
>

I'll submit a separate patch for this as well then.

William Breathitt Gray
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
