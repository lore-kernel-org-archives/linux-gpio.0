From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Replace WARN_ON with WARN_ON_ONCE
Date: Fri, 29 Nov 2013 13:27:56 +0100
Message-ID: <CACRpkdYEPo9J006k67EZB7Xdyb0iU3iE7wuve6VexhozJf1khQ@mail.gmail.com>
References: <1385296665-23713-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<20131128191655.GC13182@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:62772 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755008Ab3K2M15 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 07:27:57 -0500
Received: by mail-oa0-f54.google.com with SMTP id h16so10386967oag.13
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 04:27:56 -0800 (PST)
In-Reply-To: <20131128191655.GC13182@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Nov 28, 2013 at 8:16 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Hi Linus,
> On Sun, Nov 24, 2013 at 09:37:45AM -0300, Ezequiel Garcia wrote:
>> These warnings can be very spammy, since they could be called from
>> kernel threads. Use WARN_ON_ONCE, which is enough to warn developers
>> about the 'can_sleep' usage.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
(...)
> Any comments on this?

I'm a bit hesitant because I don't know the conventions for WARN_ON_ONCE()
vs WARN_ON().

I'd like some wider input if possible, Alexandre, Grant, what do you say?

Yours,
Linus Walleij
