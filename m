From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: take in account the active low flag when
 configuring the gpio as an ouput
Date: Wed, 12 Feb 2014 17:20:51 +0100
Message-ID: <CACRpkdbZ0LJorKN_ydk=8KBkyHToYZVAj7xUCYkU=Agtb4sVrA@mail.gmail.com>
References: <1392044614-6837-1-git-send-email-jjhiblot@traphandler.com>
	<CAAVeFuJ6BP4JnVb6qD1DYXqPQ3zBKw8hb+xLqcmUjktOxAjdGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:37633 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752896AbaBLQUv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2014 11:20:51 -0500
Received: by mail-oa0-f53.google.com with SMTP id m1so11166104oag.40
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2014 08:20:51 -0800 (PST)
In-Reply-To: <CAAVeFuJ6BP4JnVb6qD1DYXqPQ3zBKw8hb+xLqcmUjktOxAjdGA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Richard Genoud <richard.genoud@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 11, 2014 at 5:22 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, Feb 11, 2014 at 12:03 AM, Jean-Jacques Hiblot
> <jjhiblot@traphandler.com> wrote:
>> The initial value of the gpio is passed to gpiod_direction_output. Currently
>> this value is the raw value of the GPIO line, but it should be the logical
>> value.
>
> I think we have a patch that already does this:
>
> http://www.kernelhub.org/?msg=390263&p=2
>
> Linus said it would be merged for 3.15, but I am not seeing it in -next. Linus?

I just haven't queued my devel branch for next yet. Will do
today now that I sent a batch of fixes to Torvalds.

Yours,
Linus Walleij
