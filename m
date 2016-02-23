From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] kernel/resource.c: fix muxed resource handling in
 __request_region()
Date: Tue, 23 Feb 2016 09:19:05 -0800
Message-ID: <56CC9489.7060706@virtuousgeek.org>
References: <20150909220140.GD9892@kw.sim.vm.gnt>
 <1441836918-24159-1-git-send-email-simon.guinot@sequanux.org>
 <20160219221056.23487da2@x2> <56C7A459.1090801@virtuousgeek.org>
 <CA+55aFx9-itKjqahUnXAoeDNgbi1MeNH5gDQB8Sw9AguPwGefQ@mail.gmail.com>
 <15300c0ce08.2710.f266623ac48c822f02e65082a71b2734@virtuousgeek.org>
 <1456148952.24303.273.camel@linux.intel.com>
 <56CB7391.30203@virtuousgeek.org> <20160223161920.GB3840@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160223161920.GB3840@kw.sim.vm.gnt>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Alan Cox <alan@linux.intel.com>, Linus Torvalds <torvalds@linux-foundation.org>, Vincent Pelletier <plr.vincent@gmail.com>, Giel van Schijndel <me@mortis.eu>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 02/23/2016 08:19 AM, Simon Guinot wrote:
> On Mon, Feb 22, 2016 at 12:46:09PM -0800, Jesse Barnes wrote:
>> On 02/22/2016 05:49 AM, Alan Cox wrote:
>>>> we have some good alternatives in the form of bus and platform
>>>> drivers that
>>>> can manage the appropriate serialization and keep things from
>>>> stomping
>>>> on one another.
>>>
>>> It's not used much, especially nowdays. The use case is basically multi
>>> I/O chips on the ISA/LPC bus with magic shared config register ports.
>>>
>>> We have sufficiently few of those we could give muxed the boot and
>>> special case them if preferred.
>>
>> Ah that's right, now I remember the context.  So where should we go from here then?  Just leave the ugly fix in or hack on old stuff and hope not to break it?
> 
> Hi Jesse,
> 
> The fix is not ugly but only incomplete. And I have to say that the
> whole IORESOURCE_MUXED thing is not shiny either :)

Yeah definitely, I'm not casting stones at you, this whole problem is an
ugly one. :)

As Alan said, muxed is really intended for a pretty limited set of
cases.  The "right" solution is a lot more work than its worth, so we
have this instead, which is fine.  But obviously it's been a little
trickier to put in place than we hoped. :)

> The main problem in __request_region() is that we are dropping the
> spinlock of the resource list while holding a reference on a resource,
> waiting for a muxed resource to become available.
> 
> From here, I can see two bugs:
> 
> 1 - At wake-up, the next __request_resource() iteration will not detect
>     a remaining conflict. To work properly, __request_resource() needs
>     to be called with a parent of the conflicting resource. Instead we
>     are passing the conflicting resource itself...
> 2 - At wake-up the resource pointer we are holding could have been
>     freed. Since we are just about to use this pointer to insert a new
>     resource in the linked list, it is broken...
> 
> My patch fixes 1 and makes things better for 2.
> 
> But I think Linus is right. If at wake-up we use the original parent
> resource to check again for a conflict, then we are safe.
> 
> If you want, I can propose a such patch.
> 
> Note that IORESOURCE_MUXED is mostly used by Super-I/Os drivers. A
> Super-I/O is a legacy I/O controller embedded on x86 motherboards. It is
> used to connect the low-bandwidth devices such as parallel ports, serial
> ports, keyboard controllers, hardware monitoring controllers, GPIO
> controllers, etc. While each logical device have its own memory region,
> a shared memory region is used for some configuration purpose.
> IORESOURCE_MUXED is a convenient way to deal with that. For some code
> examples you can look at the superio_* functions in the IT87 drivers:
> gpio/gpio-it87.c, hwmon/it87.c and watchdog/it87_wdt.c.
> 
> I am not aware of any other users for IORESOURCE_MUXED.
> 
> Let me know how you want to go and if you need my help.

I'd be happy if you proposed a patch.  It would also be nice if we could
somehow more formally limit the MUXED usage to these super I/O devices,
just so other users don't get into trouble thinking it's more general
than it is.

Thanks,
Jesse
