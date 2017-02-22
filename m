From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] gpio:mcp23s08 Fixed missing interrupts
Date: Wed, 22 Feb 2017 08:56:08 +0800
Message-ID: <56e0ad5a-f35a-33d3-182a-d16193f898d3@electromag.com.au>
References: <1486843355-2386-1-git-send-email-robert.middleton@rm5248.com>
 <1486843355-2386-2-git-send-email-robert.middleton@rm5248.com>
 <8aa3227c-c55c-6319-42ac-97e90c9098dd@electromag.com.au>
 <CAKpcJVZs7o=4M2mHDBRbRS4Kpno9mjd4XappVNgygy+=954jMg@mail.gmail.com>
 <b06d79e0-f966-933b-57d2-8bd79ee0f9a9@electromag.com.au>
 <CAKpcJVaX=RqT3e4e=SPdWWfd9Me6m77z5aVh_afG_WOO_G8Byw@mail.gmail.com>
 <ea72ed58-09fb-6d33-8105-c9384931e41f@electromag.com.au>
 <CAKpcJVaJ4KrxHSFvLOUQeS-BHAHqKAw_qhE-cdqmnENjphAk-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:40719 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753743AbdBVA4L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Feb 2017 19:56:11 -0500
In-Reply-To: <CAKpcJVaJ4KrxHSFvLOUQeS-BHAHqKAw_qhE-cdqmnENjphAk-Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Middleton <robert.middleton@rm5248.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

On 22/02/2017 01:34, Robert Middleton wrote:
> I have re-worked the interrupt handling, and I am reasonably sure at this
> point that it's working correctly.  It properly detects the
> rising/falling edges
> at this point, and doesn't trigger all the time.
>
> The logic has become rather complicated at this point though, so it
> may have to be broken up into a separate function.  I also found a few
> quirks with the chip on detecting the pin change in INTCAP, so I wasn't
> able to implement exactly as Phil had suggested.
>
> Phil, would you like to take a look at what I've done before I send a patch
> out, or would you prefer that I simply send out the patch as-is and discuss
> in a new thread?
>
Just send a v2 to the list.


-- 
Regards
Phil Reid

