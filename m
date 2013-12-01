From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: Replace WARN_ON with WARN_ON_ONCE
Date: Sun, 1 Dec 2013 12:07:26 +0900
Message-ID: <CAAVeFu+Kn5Fad7rtgDfWYeX=xAvYhvAHQRom9a=qogUPreDdgg@mail.gmail.com>
References: <1385296665-23713-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131128191655.GC13182@localhost> <CACRpkdYEPo9J006k67EZB7Xdyb0iU3iE7wuve6VexhozJf1khQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:38064 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403Ab3LADHr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2013 22:07:47 -0500
Received: by mail-ie0-f181.google.com with SMTP id e14so17892459iej.26
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2013 19:07:47 -0800 (PST)
In-Reply-To: <CACRpkdYEPo9J006k67EZB7Xdyb0iU3iE7wuve6VexhozJf1khQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 29, 2013 at 9:27 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 28, 2013 at 8:16 PM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
>> Hi Linus,
>> On Sun, Nov 24, 2013 at 09:37:45AM -0300, Ezequiel Garcia wrote:
>>> These warnings can be very spammy, since they could be called from
>>> kernel threads. Use WARN_ON_ONCE, which is enough to warn developers
>>> about the 'can_sleep' usage.
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> (...)
>> Any comments on this?
>
> I'm a bit hesitant because I don't know the conventions for WARN_ON_ONCE()
> vs WARN_ON().
>
> I'd like some wider input if possible, Alexandre, Grant, what do you say?

I'd say WARN_ON() is just appropriate here. Calling a preemptible
function from a context that cannot sleep is a serious issue and you
cannot nag the user enough about it. At least if something bad happens
due to this condition the warning is guaranteed to be one of the last
messages the user will see before the system locks. Change it with
WARN_ON_ONCE() and chances are high that the system will hang without
any meaningful log near the point of failure.

Each caller should know whether it is running in preemptible context
or not and can thus use the right function, so I don't see any reason
to relax the rules here.

If we could know for sure at runtime whether we are running in
preemptible context or not we could probably merge these functions
into one and warn more appropriately on a per-case basis, but as far
as I know (which is not very far) there is no such way.

Alex.
