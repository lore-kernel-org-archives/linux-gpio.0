From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "gpiolib: Split GPIO flags parsing and GPIO configuration"
Date: Tue, 5 Jul 2016 08:52:42 +0200
Message-ID: <CACRpkdaos5YiRtYjwVM=RpT=VdCa_JjzKNeVC0pfGfrb+OxmEA@mail.gmail.com>
References: <1467563525-30227-1-git-send-email-johan@kernel.org>
 <CACRpkdYZCO9vaegXWVtbRB9pF3294FxZR3XseyXNMiHcTKZUSw@mail.gmail.com> <17900570.or1ekOzmja@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34479 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754348AbcGEGwo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2016 02:52:44 -0400
Received: by mail-oi0-f48.google.com with SMTP id s66so217645397oif.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2016 23:52:44 -0700 (PDT)
In-Reply-To: <17900570.or1ekOzmja@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jul 4, 2016 at 10:30 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 04 Jul 2016 15:16:40 Linus Walleij wrote:
>> On Sun, Jul 3, 2016 at 6:32 PM, Johan Hovold <johan@kernel.org> wrote:
>> > This reverts commit 923b93e451db876d1479d3e4458fce14fec31d1c.
>>
>> Laurent, can we have you comment on this?
>>
>> Getting close to v4.7 final so we need to quickly see if
>> this is the solution or if it will cause further regressions on
>> your side if I revert it...
>
> Given that the offending patch dates from October 2015, why is the v4.7
> schedule an issue ?

Just convenient to cut a clean kernel and say that if people use
v4.7 or later they don't see the issue. Else you have to tell them to
use one or another stable kernel (which they should, for products etc)
which complicates things.

But you're right, it's no *big* deal in that sense.

Johan does use some alarmin language like destroyed hardware in
the patch description making me feel the issue is urgent though.
Given how long it has been there I don't know if it is really urgent
in practice and not only in theory.

Yours,
Linus Walleij
