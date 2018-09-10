From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 2/5] gpio: davinci: Use dev name for label and automatic
 base selection
Date: Mon, 10 Sep 2018 08:17:32 +0530
Message-ID: <7ffe6694-0bb1-d1ae-3d93-51f11a358cc0@ti.com>
References: <20180831191326.25106-1-afd@ti.com>
 <20180831191326.25106-2-afd@ti.com>
 <2a02c241-ac91-1bac-380d-122858bb03c3@ti.com>
 <CACRpkdYvNeKyfRf5Et5zC4=hcu9cfDubftRFRHtrKLN-5Snd1Q@mail.gmail.com>
 <040ce524-f6e2-81a2-68db-57a645de22ea@ti.com>
 <0e199aa3-2d9d-4e7d-af23-8523722f017a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0e199aa3-2d9d-4e7d-af23-8523722f017a@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org



On Sunday 09 September 2018 01:11 AM, Grygorii Strashko wrote:
> 
> 
> On 09/06/2018 09:16 AM, Keerthy wrote:
>>
>>
>> On Wednesday 05 September 2018 04:07 PM, Linus Walleij wrote:
>>> On Mon, Sep 3, 2018 at 7:40 AM Keerthy <j-keerthy@ti.com> wrote:
>>>> On Saturday 01 September 2018 12:43 AM, Andrew F. Davis wrote:
>>>>> Use dev_name to get a unique label and use -1 for a base to get our
>>>>> selection automatically. We pull in all GPIOs per chip now so this
>>>>> does not have the effect of out of order labels like before.
>>>>>
>>>>> We do these both together so we can drop all the static data in one
>>>>> patch. This also lets us normalize the return paths as we don't need
>>>>> any cleanup after this change.
>>>>
>>>> echo 28 > /sys/class/gpio/export
>>>> / # echo 28 > /sys/class/gpi[   12.839205] export_store: invalid GPIO 28
>>>> o/export
>>>> echo 2 > /sys/class/gp[   22.165728] export_store: invalid GPIO 2
>>>> io/export
>>>> / # echo 1 > /sys/class/gp[   25.961392] export_store: invalid GPIO 1
>>>> io/export
>>>> / # echo 3 > /sys/class/gp[   29.981918] export_store: invalid GPIO 3
>>>> io/export
>>>>
>>>> Export fails with this patch. I am testing this on keystone-k2g-evm.
>>>
>>> I think the GPIO got a new number didn't it?
>>>
>>> Did you check the gpio file in debugfs to see which number
>>> it got.
>>
>> Okay now its numbered differently:
>>
>> cat /sys/class/gpio/gpiochip340/ngpio
>> 144
>>
>> cat /sys/class/gpio/gpiochip272/ngpio
>> 68
> 
> could you or Andrew provide content of /debug/gpio before/after?
> And ls /sys/class/gpio/?

Output on K2G:

Before
======

cat /debug/gpio
gpiochip1: GPIOs 0-143, parent: platform/2603000.gpio, davinci_gpio.0:

gpiochip2: GPIOs 144-211, parent: platform/260a000.gpio, davinci_gpio.1:
 gpio-156 (                    |cd                  ) in  lo

gpiochip0: GPIOs 484-511, parent: platform/2620240.keystone_dsp_gpio,
2620240.keystone_dsp_gpio:

 ls /sys/class/gpio/
export       gpiochip0    gpiochip144  gpiochip484  unexport

cat /sys/class/gpio/gpiochip0/label
davinci_gpio.0

cat /sys/class/gpio/gpiochip144/label
davinci_gpio.1

cat /sys/class/gpio/gpiochip144/ngpio
68
/ # cat /sys/class/gpio/gpiochip0/ngpio
144


After
=====

 cat /debug/gpio
gpiochip2: GPIOs 272-339, parent: platform/260a000.gpio, 260a000.gpio:
 gpio-284 (                    |cd                  ) in  lo

gpiochip1: GPIOs 340-483, parent: platform/2603000.gpio, 2603000.gpio:

gpiochip0: GPIOs 484-511, parent: platform/2620240.keystone_dsp_gpio,
2620240.keystone_dsp_gpio:

ls /sys/class/gpio/
export       gpiochip272  gpiochip340  gpiochip484  unexport


cat /sys/class/gpio/gpiochip340/label
2603000.gpio
/ # cat /sys/class/gpio/gpiochip272/label
260a000.gpio
/ # cat /sys/class/gpio/gpiochip272/label

cat /sys/class/gpio/gpiochip272/ngpio
68
/ # cat /sys/class/gpio/gpiochip340/ngpio
144

In the case of SoCs that support multiple instances of Davinci GPIO IPs
it is harder to figure out the right gpio number to export.

>>
>> So gpio bank2 and bank1 have different gpio numbers. Is that acceptable?
>>
>>>
>>> This is sadly the global numberspace that we are tying to
>>> get rid of (new apps/scripts should use the chardev).
>>>
>>> Are there applications that rely on the sysfs ABI on DaVinci?
>>>
>>> In that case base needs to be prerseved.
> 
> Not only base, but label also - /sys/class/gpio/gpiochip0/label, as this is
> the way to find proper GPIO chip in sysfs using legacy GPIO ABI.
> 
> Linus, this platform is old and most of the users do not use new ABI (chardev),
> so we could try change this, but need to be prepared for regressions reports.
> 

Totally agree with this.
