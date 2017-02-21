From: Robert Middleton <robert.middleton@rm5248.com>
Subject: Re: [PATCH] gpio:mcp23s08 Fixed missing interrupts
Date: Tue, 21 Feb 2017 12:34:19 -0500
Message-ID: <CAKpcJVaJ4KrxHSFvLOUQeS-BHAHqKAw_qhE-cdqmnENjphAk-Q@mail.gmail.com>
References: <1486843355-2386-1-git-send-email-robert.middleton@rm5248.com>
 <1486843355-2386-2-git-send-email-robert.middleton@rm5248.com>
 <8aa3227c-c55c-6319-42ac-97e90c9098dd@electromag.com.au> <CAKpcJVZs7o=4M2mHDBRbRS4Kpno9mjd4XappVNgygy+=954jMg@mail.gmail.com>
 <b06d79e0-f966-933b-57d2-8bd79ee0f9a9@electromag.com.au> <CAKpcJVaX=RqT3e4e=SPdWWfd9Me6m77z5aVh_afG_WOO_G8Byw@mail.gmail.com>
 <ea72ed58-09fb-6d33-8105-c9384931e41f@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sub5.mail.dreamhost.com ([208.113.200.129]:39233 "EHLO
        homiemail-a46.g.dreamhost.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753515AbdBUReW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Feb 2017 12:34:22 -0500
Received: from homiemail-a46.g.dreamhost.com (localhost [127.0.0.1])
        by homiemail-a46.g.dreamhost.com (Postfix) with ESMTP id 778F9613D
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2017 09:34:21 -0800 (PST)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com [209.85.218.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: robert.middleton@rm5248.com)
        by homiemail-a46.g.dreamhost.com (Postfix) with ESMTPSA id 63409613C
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2017 09:34:21 -0800 (PST)
Received: by mail-oi0-f50.google.com with SMTP id 2so32097392oif.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2017 09:34:21 -0800 (PST)
In-Reply-To: <ea72ed58-09fb-6d33-8105-c9384931e41f@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

I have re-worked the interrupt handling, and I am reasonably sure at this
point that it's working correctly.  It properly detects the
rising/falling edges
at this point, and doesn't trigger all the time.

The logic has become rather complicated at this point though, so it
may have to be broken up into a separate function.  I also found a few
quirks with the chip on detecting the pin change in INTCAP, so I wasn't
able to implement exactly as Phil had suggested.

Phil, would you like to take a look at what I've done before I send a patch
out, or would you prefer that I simply send out the patch as-is and discuss
in a new thread?

-Robert Middleton
