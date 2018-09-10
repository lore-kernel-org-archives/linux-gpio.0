From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/5] gpio: davinci: Use dev name for label and automatic
 base selection
Date: Mon, 10 Sep 2018 13:07:19 +0530
Message-ID: <b1f74d63-c9e8-2a7f-bd13-8f5fff27fc22@ti.com>
References: <20180831191326.25106-1-afd@ti.com>
 <20180831191326.25106-2-afd@ti.com>
 <2a02c241-ac91-1bac-380d-122858bb03c3@ti.com>
 <CACRpkdYvNeKyfRf5Et5zC4=hcu9cfDubftRFRHtrKLN-5Snd1Q@mail.gmail.com>
 <040ce524-f6e2-81a2-68db-57a645de22ea@ti.com>
 <0e199aa3-2d9d-4e7d-af23-8523722f017a@ti.com>
 <CACRpkdYcuSpfZ0=UFUOx_-5kaAtCA4=AyXmSMbfrcqjf0r_xmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYcuSpfZ0=UFUOx_-5kaAtCA4=AyXmSMbfrcqjf0r_xmQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>, "Andrew F. Davis" <afd@ti.com>, Kevin Hilman <khilman@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Lechner <david@lechnology.com>, Adam Ford <aford173@gmail.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Monday 10 September 2018 12:55 PM, Linus Walleij wrote:
> On Sat, Sep 8, 2018 at 9:41 PM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>> On 09/06/2018 09:16 AM, Keerthy wrote:
> 
>>> Okay now its numbered differently:
>>>
>>> cat /sys/class/gpio/gpiochip340/ngpio
>>> 144
>>>
>>> cat /sys/class/gpio/gpiochip272/ngpio
>>> 68
> (...)
> 
> So:
> 
>>>> Are there applications that rely on the sysfs ABI on DaVinci?
>>>>
>>>> In that case base needs to be prerseved.
>>
>> Not only base, but label also - /sys/class/gpio/gpiochip0/label, as this is
>> the way to find proper GPIO chip in sysfs using legacy GPIO ABI.
>>
>> Linus, this platform is old and most of the users do not use new ABI (chardev),
>> so we could try change this, but need to be prepared for regressions reports.
> 
> So what I'm trying to ask you guys is if there are applications that you
> are aware of that use the old ABI, and who will upgrade their
> kernels and be upset.
> 
> We must not break userspace, but as you know if a tree falls in the
> forest and nobody is there to hear it, it doesn't make a sound.
> 
> If you're not aware of any such applications I guess we should try
> changing this.

Personally I am not really aware of any application which relies on the
ABI. I may have some scripts, but I can adjust them. I am also copying
some frequent users of DaVinci in mainline for any comments from them.

Thanks,
Sekhar
