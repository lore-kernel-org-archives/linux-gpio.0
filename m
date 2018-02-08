From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpiolib: suppress error message on EPROBE_DEFER
Date: Thu, 8 Feb 2018 12:18:37 -0600
Message-ID: <ee9d3352-6575-9e7b-d8d2-20caf609e0ef@ti.com>
References: <1516566774-1786-1-git-send-email-david@lechnology.com>
 <CACRpkdbKWrdnbBp2e1kFd_3fYZxtWKnWPPgOd_FXSvXcOetLwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbKWrdnbBp2e1kFd_3fYZxtWKnWPPgOd_FXSvXcOetLwA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, David Lechner <david@lechnology.com>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org



On 02/07/2018 06:57 AM, Linus Walleij wrote:
> On Sun, Jan 21, 2018 at 9:32 PM, David Lechner <david@lechnology.com> wrote:
> 
>> This suppresses printing an error message during probe of gpio drivers
>> when the error is EPROBE_DEFER.
>>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: David Lechner <david@lechnology.com>
> 
> I'm not sure about this.
> 
> GPIO can be very basic system components. If we don't
> print this, defer a few times (for some reason) and then
> the kernel gives up on retrying, silently (as it happens)
> there is no trace in dmesg of what happened. That makes
> things hard to debug.
> 
> This happened to me with some other driver, so it is not
> a made up example.
> 
> What about an explicit deferral message for now?
> 

The DD has debuging prints for all cases, so in general it can be used
for boot debugging (really_probe()). So, in my opinion it make sense to 
print gpiolib specific message only in case of !EPROBE_DEFER.

5c

-- 
regards,
-grygorii
