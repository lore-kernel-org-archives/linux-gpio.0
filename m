From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: Fix GPIO control register offset
 calculation
Date: Thu, 29 Jun 2017 12:13:24 -0700
Message-ID: <6ce5e7fd-ac9e-4902-760e-0b6b00ffc92a@linux.intel.com>
References: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CACRpkdY83WvJ_PzzdEwzgHEFBm=ixLGLqCYdpkArWPFBa7U2Kw@mail.gmail.com>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY83WvJ_PzzdEwzgHEFBm=ixLGLqCYdpkArWPFBa7U2Kw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Graeme Gregory <graeme.gregory@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,


On 06/29/2017 05:17 AM, Linus Walleij wrote:
> On Mon, Jun 26, 2017 at 7:37 PM,
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> According to Whiskey Cove PMIC GPIO controller specification, for GPIO
>> pins 0-12, GPIO input and output register control address range from,
>>
>> 0x4e44-0x4e50 for GPIO outputs control register
>>
>> 0x4e51-0x4e5d for GPIO input control register
>>
>> But, currently when calculating the GPIO register offsets in to_reg()
>> function, all GPIO pins in the same bank uses the same GPIO control
>> register address. This logic is incorrect. This patch fixes this
>> issue.
>>
>> This patch also adds support to selectively skip register modification
>> for virtual GPIOs.
>>
>> In case of Whiskey Cove PMIC, ACPI code may use up 94 virtual GPIOs.
>> These virtual GPIOs are used by the ACPI code as means to access various
>> non GPIO bits of PMIC. So for these virtual GPIOs, we don't need to
>> manipulate the physical GPIO pin register. A similar patch has been
>> merged recently by Hans for Crystal Cove PMIC GPIO driver. You can
>> find more details about it in Commit 9a752b4c9ab9 ("gpio: crystalcove:
>> Do not write regular gpio registers for virtual GPIOs")
> So where can I get a handle on the people inside Intel who are obviously
> using ACPI GPIO class for shoehorning what we in the linux kernel call
> syscon or register bit misc access into the GPIO ACPI container just
> because they feel it is convenient?
Found the patch from where it all started. It looks like the origin of this
hack is from Crystal Cove PMIC. This was added to handle the side-effects
of windows specific BIOS fix . After that instead of finding the proper BIOS
fix, the same hack has been adapted to other Intel family PMIC devices in
ACPI tables.

commit dcdc3018d6357c35eae7d80b323e10bd72253cb7
Author: Aaron Lu <aaron.lu@intel.com>
Date:   Thu Sep 25 10:57:26 2014 +0800

     gpio: crystalcove: support virtual GPIO

     The virtual GPIO introduced in ACPI table of Baytrail-T based system is
     used to solve a problem under Windows. We do not have such problems
     under Linux so we do not actually need them. But we have to tell GPIO
     library that the Crystal Cove GPIO chip has this many GPIO pins or the
     common GPIO handler will refuse any access to those high number GPIO
     pins, which will resulted in a failure evaluation of every ACPI control
     method that is used to turn on/off power resource and/or report sensor
     temperatures.

     Signed-off-by: Aaron Lu <aaron.lu@intel.com>
     Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
     [changed vgpio number from 0x5e to 94]
     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


> They need to invent a NEW ACPI four-character thing and call that
> "misc register bit" (_MRB?) or whatever and have it bind to syscon.
> This is not working.
At this point I am not sure whether this BIOS fix is a hack or actual 
requirement.

Mike or Aaron might have more info on this windows issue mentioned in 
the above
commit message.

If this is really a requirement then I can send these details to Rafael 
or Bob Moore for
more ACPI specific review.
>
> It feels like I am starting to maintain Intel's swiss army knife for misc
> register manipulation, and that should not be done by "virtual GPIO"
> because just look at it:
Sorry about that. When I submitted this patch, I also noticed that this 
"Virtual GPIO" concept has nothing to do with GPIO subsystem. But since 
this hack is already merged and has tight dependency on BIOS, I can't 
fix it cleanly any more. Only solution is, to prevent this hack being 
adapted to any future Intel PMIC GPIO drivers.
>
> General-purpose input/output - yeah that sounds like something
> going in/out of the system right? And something that is used by electronics
> outside the provider. Like a LED. Or a key.
>
> "Virtual GPIO" - those are not input/outputs at all in most cases,
> because they are internally routed, and they are not general purpose
> at all because mostly they are for a specific purpose. Neither are they
> virtual because the signals are very real.
>
> Calling something "virtual GPIO" is just one big confusion for the brain.
>
> Looking at Rusty Russell's API design manifesto:
> http://sweng.the-davies.net/Home/rustys-api-design-manifesto
> this is just screwing things up.
>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> Reported-by: Jukka Laitinen <jukka.laitinen@intel.com>
> I have applied the patch because I think you know this better than
> me, just including Mika and Andy as a side note. The patch is fine
> because it makes the system run despite the above mentioned
> violation of ACPI which is not your fault.
Thanks. I have also tested it and it seem to run fine. Without this fix, 
I am getting
Interrupt storms in USB Type-C device.
>
> Would you mind signing yourself up as maintainer in the MAINTAINERS
> file for this driver?
I don't mind. I can sign-up for it.
>
> Yours,
> Linus Walleij
>

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer
