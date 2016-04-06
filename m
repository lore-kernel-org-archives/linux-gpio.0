From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k/gpio: remove arch specific sysfs bus device
Date: Thu, 7 Apr 2016 05:31:14 +1000
Message-ID: <57056402.8020308@uclinux.org>
References: <1459909950-26077-1-git-send-email-gerg@uclinux.org>
 <CACRpkda6SHJC-TfeakPa=ZcYtTyhNijN3H6y8FUDyziVNXCEEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda6SHJC-TfeakPa=ZcYtTyhNijN3H6y8FUDyziVNXCEEw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-m68k@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On 06/04/16 16:57, Linus Walleij wrote:
> On Wed, Apr 6, 2016 at 4:32 AM, Greg Ungerer <gerg@uclinux.org> wrote:
>
>> From: Greg Ungerer <gerg@gumby.(none)>
>>
>> The ColdFire architecture specific gpio support code registers a sysfs
>> bus device named "gpio". This clashes with the new generic API device
>> added in commit 3c702e99 ("gpio: add a userspace chardev ABI for GPIOs").
>>
>> The old ColdFire sysfs gpio device was never used for anything specific,
>> and no links or other nodes were created under it. The new API sysfs gpio
>> device has all the same default sysfs links (device, drivers, etc) and
>> they are properly populated.
>>
>> Remove the old ColdFire sysfs gpio registration.
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks Linus. I will push via the m68knommu git tree.

Regards
Greg
