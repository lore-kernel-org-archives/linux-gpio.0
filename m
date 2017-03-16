From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH fixes v3] pinctrl: Really force states during suspend/resume
Date: Thu, 16 Mar 2017 15:08:40 +0100
Message-ID: <CACRpkdZBrYT=vXhR77W+v_hN=t6zYACVPm5HR==kC7nmDYJLQA@mail.gmail.com>
References: <20170301183257.6554-1-f.fainelli@gmail.com> <CAHp75VdWVq3E3qrgtvvJK=A4yxK+yM_q3ZJd1hNnFBTj-H4Mxw@mail.gmail.com>
 <304fb86d-0862-992b-4563-61151b37d060@gmail.com> <CACRpkdb-_oTuRyGWtH9Rb2g2w_J9VM=m3mXK94OYbCXy+E0XLw@mail.gmail.com>
 <18ca4418-8b62-a1c9-1282-0c468f2aefb2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:38070 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752006AbdCPOI7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Mar 2017 10:08:59 -0400
Received: by mail-it0-f42.google.com with SMTP id m27so44577189iti.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Mar 2017 07:08:58 -0700 (PDT)
In-Reply-To: <18ca4418-8b62-a1c9-1282-0c468f2aefb2@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Al Cooper <alcooperx@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>

On Wed, Mar 15, 2017 at 3:18 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 03/14/2017 03:16 AM, Linus Walleij wrote:

>> The most obvious would be to use the API as many already do:
>> define "sleep" states in the core, and switch to these before
>> going to sleep. If CONFIG_PM is available simply by calling
>> pinctrl_pm_select_sleep_state() in the driver suspend() callback.
>
> Well, the difficulty for our platforms is that S2 does not make the HW
> lose pin states, only S3 does and drivers should be agnostic of S2 vs. S3.
>
> There is not really a "sleep" and "default" state defined for these
> platforms just the "default" state. I initially even considered adding a
> fake "sleep" state just to satisfy the state transition condition, but
> that does not accurately represent the HW.

Do you mean that on the way up, on the resume path, you know
whether the setting was lost or not?

Or you don't know it anywhere?

It is not less elegant to uncessesarily switch to a sleep state
than to unnecessarily program the default state when you only
went into S2 in that case.

I guess then it is better to assume we will loose the state, or
push for more granular handling of S2/3 etc states in the
PM core (I guess these states comes from ACPI or similar).

>> Alternatively we would add a function to set the pinctrl handle to
>> an "unknown" state, so that when we resume, the pinctrl core at
>> least knows that we are not in "default" state anymore, so that
>> "default" is applied.
>
> And such a function would be called during driver suspend? Would not we
> still end-up with the drivers having to know about the fact that there
> is a) only one pin state defined, and b) these pins potentially lose
> their states in some deep sleep mode?

Again, the proposal to switch to default state twice just because
we do not know how deep sleep we went into isn't any more
elegant. Then it is better to just assume we lost the state at
all times.

Alternatively develop the PM core. Is it really impossible for
PM hooks to know which state it went into/came from?

Yours,
Linus Walleij
