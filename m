From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Fri, 16 May 2014 17:49:24 +0200
Message-ID: <CACRpkdahGkBwLrNujbB_HQohiPK=8ro7J1X71FYDyC4VSGj5dA@mail.gmail.com>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
	<CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com>
	<536767A1.5090701@cit-ec.uni-bielefeld.de>
	<CAAVeFuJB21n04qKbwxyPCVi=s882sTfgvftG8GgaBLqH-cjFCQ@mail.gmail.com>
	<53679B6D.2030603@cit-ec.uni-bielefeld.de>
	<CAAVeFuL22kTEy+QZgPE8ZTVGkD9N1dMx1m+7AxjkPPD=s+oriw@mail.gmail.com>
	<53720DE0.4010005@cit-ec.uni-bielefeld.de>
	<CAAVeFuJi6eAnie+Ku_w4LQsFq8pY-45L4URDAB7pHtV_q9+Yzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:62971 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750915AbaEPPtY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 May 2014 11:49:24 -0400
Received: by mail-oa0-f49.google.com with SMTP id eb12so3185988oac.22
        for <linux-gpio@vger.kernel.org>; Fri, 16 May 2014 08:49:24 -0700 (PDT)
In-Reply-To: <CAAVeFuJi6eAnie+Ku_w4LQsFq8pY-45L4URDAB7pHtV_q9+Yzg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 13, 2014 at 4:24 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, May 13, 2014 at 9:19 PM, Robert ABEL
> <rabel@cit-ec.uni-bielefeld.de> wrote:

>> But you won't accept my patch, because you don't want to. Not because I'm
>> correct, right? Good, thought so.
>
> This example has nothing to do with the validity of having this or
> that function public.
>
> Besides I have no authority to accept your patch - that's Linus' job.
> If he likes your patch nothing that I say will prevent him from
> merging it.

I will not merge a patch which the GPIO co-maintainer has doubts
about, as happens to be the case.

Right now I'm more thinking about how we get your patch removing
the function into shape so we can apply it and resolve the whole issue,
as I trust you to be doing the right thing around the gpiod_* functions
for sure.

Yours,
Linus Walleij
