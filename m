From: Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH v5 0/2] Add device driver for APU2/APU3 GPIOs
Date: Tue, 04 Dec 2018 10:58:24 +0100
Message-ID: <84a2396b0b5ba34a2339d35159a97a89@dev.tdt.de>
References: <20181127132508.5501-1-fe@dev.tdt.de>
 <CAHp75VfFYJQzTv_oe8RKPo03-FLYHy6BkrKaG23svAKtC+jVBg@mail.gmail.com>
 <583ca922b4a877a4b0577994e40ddf5f@dev.tdt.de>
 <CAHp75VcKu4fhP8=NH7fgfSFCh6xdCLWrNLcsHSuWvMcW+irfmA@mail.gmail.com>
 <70e7b8e2346b9837273b5edce0524584@dev.tdt.de>
 <CAHp75VfSKz8sauUKq2pxUhQ6xvmX4UeOBw6eEA+71=NUyWES9g@mail.gmail.com>
 <51e0d3f36dc23de801f2fdfc990f6c23@dev.tdt.de>
 <CAHp75VdEgm-=jHgJXz_mM6DZMnFVEeZW_es3VyL4L2V+khYWtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdEgm-=jHgJXz_mM6DZMnFVEeZW_es3VyL4L2V+khYWtg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Eckert.Florian@googlemail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

>> >> Yes i will fix your hints tomorrow and send a v6 of my patchset.
>> >> Thank you for your hints and time
>> >> It would be nice if you could fix ACPI problemmatik.
>> >
>> > I would like to see the ACPI dump for that...
>> 
>> See 
>> https://github.com/openwrt/openwrt/pull/1232#issuecomment-443224576
>> In this comment Michał Żygowski appended to this thread the missing
>> files you want to have.

> So, let me clarify what we have:
>  - some platforms are in the wild with old BIOS with broken ACPI tables

correct

>  - you still may fix the things for new BIOS version for all affected 
> platforms

I have seen that this is a lot of work and I didn't think it was so 
complicated!
To get the GPIO support for APU2/APU3 merged into the gpio subsystem.
I am little confused what i should do now. By the way I only have one 
board (APU3).

>  - you need to support both

That is not necessary from my point of view. I am fine if the driver 
supports at least
the current BIOS version. And if the coreboot maintainer fixes the ACPI 
problem
then we could extend the driver and add the ACPI stuff.
But this not in my hand, right?

> For broken firmware you need to do the following:
>  - create an MFD driver, which would instantiate GPIO and GPIO keys
> support (at least)
>  - create one of each above drivers w/o any DMI crap (should be done
> as a part of MFD driver)

I will have a look how to achieve this.
If we want to support all BIOS version.
And is a must have to get the driver into mainline.

> For fixed BIOS you need to add the following (example, not a fully
> correct solution) at the level behind SB:

I do not understand how I could fix this. I have no idea from ACPI.
I have not found any driver where I can inspire myself.

> 
> Scope (SB)
> {
>   Device(GPIO)
>   {

> After updating firmware you would need just an ACPI ID table to be
> added to the GPIO driver. MFD driver should not be enumerated at all.

That's maybe coming next when the coreboot maintainers have their bios 
fixed, right?
