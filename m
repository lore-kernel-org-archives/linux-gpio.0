From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 00/14] pinctrl-sx150x: Various bug-fixes and code simplifications
Date: Thu, 3 Nov 2016 15:22:37 -0700
Message-ID: <CAHQ1cqEVGz85YDPr+yeSyZWjN7tfL8MW7NczA7fQsb-nZdHXcw@mail.gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
 <9bc0e603-b861-85d8-914f-bd4b6e8a8020@baylibre.com> <f0cdd71c-3036-56f8-74a4-ebf20cde75b4@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f0cdd71c-3036-56f8-74a4-ebf20cde75b4@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>
List-Id: linux-gpio@vger.kernel.org

>>
>> Hi Andrey,
>>
>> This is good, you went faster than me !
>>
>> Small point, could you add Kconfig dependency on REGMAP ?

Good catch! Will fix in v2 of the set.

>>
>> I will try out this patchset and hopefully get you a Tested-by in the next few days.
>>
>> Neil
>>
>
> Great, Successfully worked on 4.9-rc2 on my BeagleBone black installation with a SX1509.
> I got some rising and falling interrupts using gpio-event-mon.
>
> Small NIT: please add the sx1503 entry in the Kconfig desc and in the pinctrl-sx150x.txt bindings.
>

Oops, completely forgot I about that, thanks for noticing! Will add in v2.

> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
>
> With the Kconfig and bindings changes :
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>

Thank you!

Andrey Smirnov
