From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: moxart: Actually set output state in moxart_gpio_direction_output()
Date: Thu, 10 Apr 2014 19:22:52 +0200
Message-ID: <CACRpkdakFkiaXfHpWWkwMxGPbv01UNwgkrtPitp+vgnEYU3aEQ@mail.gmail.com>
References: <1395715413.12999.0.camel@phoenix>
	<1395715459.12999.1.camel@phoenix>
	<CACmBeS1y7y9C7BGG8vrkB7FdXRiBuA2Ar6KNZFM2RC0enMxZ0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:33682 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753322AbaDJRWw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Apr 2014 13:22:52 -0400
Received: by mail-ob0-f181.google.com with SMTP id wp4so4739300obc.40
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 10:22:52 -0700 (PDT)
In-Reply-To: <CACmBeS1y7y9C7BGG8vrkB7FdXRiBuA2Ar6KNZFM2RC0enMxZ0w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Jensen <jonas.jensen@gmail.com>
Cc: Axel Lin <axel.lin@ingics.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 4, 2014 at 11:32 AM, Jonas Jensen <jonas.jensen@gmail.com> wrote:

> Verified by buzzing the buzzer and writing RTC (next-20140403):
(...)
> Tested-by: Jonas Jensen <jonas.jensen@gmail.com>

This patch is already upstream in Torvalds' tree, but thanks anyway!

Yours,
Linus Walleij
