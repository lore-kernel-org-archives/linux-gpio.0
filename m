From: Ian Pilcher <arequipeno@gmail.com>
Subject: Re: How to ensure other module/driver is initialized?
Date: Tue, 24 Jan 2017 10:40:59 -0600
Message-ID: <6a8fe8d3-024b-1cf7-0e2e-1421042036da@gmail.com>
References: <180b9075-7db0-1708-50f4-622333de2049@gmail.com>
 <CACRpkdYjUKimX+R0nZv5v+rhdUxAUtKv4pPu0dtGAYhEP1Ri7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYjUKimX+R0nZv5v+rhdUxAUtKv4pPu0dtGAYhEP1Ri7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 01/24/2017 07:02 AM, Linus Walleij wrote:
> On Thu, Dec 15, 2016 at 8:50 PM, Ian Pilcher <arequipeno@gmail.com> wrote:
>
>> I maintain an out-of-tree kernel module that enables the front-panel
>> LEDs on the Thecus N5550 NAS.
>>
>>   https://github.com/ipilcher/n5550/blob/master/modules/n5550_board.c
>
> Generally I'm not very happy about boardfiles and such stuff being
> maintained out-of-tree.
>
> Is there work ongoing to:
>
> (A) work upstream with this stuff
> (B) convert the whole platform to use device tree
>
> Because that is what is needed for long-term maintenance.

In general, I completely agree with you.  In this case, however, I
don't think that moving the module upstream and/or converting to device
tree is realistic.

I say this because the purpose of my module is to enable the LEDs and
GPIOs in the Thecus N5550 NAS for "generic" x86_64 distributions --
CentOS, Fedora, Debian, Ubuntu, etc.  It has nothing to do with the
Linux-based "firmware" provided by Thecus.  To the best of my knowledge,
the worldwide number of users of this module is in the single digits.

So even if the module were to be accepted upstream (which I tend to
doubt), it's extremely unlikely that any of the aforementioned
distributions would include it in their kernel configuration.

Device tree presents even greater problems.  It's not clear to me that
device tree even works with x86_64, and even if it does, I'm almost
positive that none of the "generic" distributions are going to support
it.

If my understanding of device tree is inaccurate, please do let me
know.  I'd definitely like to replace the "board" module with a
device tree description if it's possible.

Thanks!

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
-------- "I grew up before Mark Zuckerberg invented friendship" --------
========================================================================
