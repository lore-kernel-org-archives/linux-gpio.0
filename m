From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [RFC] qnap-tsx51: add new driver for leds and button support on
 QNAP TS-x51 series
Date: Sat, 18 Jun 2016 07:18:06 +0000
Message-ID: <20160618071806.546da3fa@gmail.com>
References: <20160606004406.29f016de@gmail.com>
	<CACRpkdZ57_evCC=+hev9kNpY4bNViG+oBP7pOh8HkgRA0-oLXA@mail.gmail.com>
	<20160615004504.7b83d83c@gmail.com>
	<CACRpkdZx8S61zZhcWfEniC-yDhMXyTwZYgXc=sO+74kujT=g-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:34205 "EHLO
	mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750968AbcFRHSM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2016 03:18:12 -0400
Received: by mail-pf0-f181.google.com with SMTP id h14so22402744pfe.1
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jun 2016 00:18:12 -0700 (PDT)
In-Reply-To: <CACRpkdZx8S61zZhcWfEniC-yDhMXyTwZYgXc=sO+74kujT=g-w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello,

On Fri, 17 Jun 2016 23:02:47 +0200, Linus Walleij
<linus.walleij@linaro.org> wrote:
> Well ask yourself what you are doing I guess, GPIO is
> General Purpose Input Output, a trap some people fall into
> is confusing that with their special purpose input/outputs,
> and sometimes they are input-only or output-only on top of
> that. That is not GPIO.
> 
> So what is the use case for these electronics? If it is not
> supposed to be used by misc input/output, it is not GPIO,
> and it is better for the driver to manage it at will.

Thanks, I think it is the distinction I did not do.

Just to confirm my understanding:
- from the chip (and its module) point of view, these signals are
  GPIOs, because they cannot presume how it is wired
- but from the platform point of view (this specific NAS model), these
  GPIOs are wired to leds and buttons, so they are leds and buttons
  and not GPIOs anymore

So using GPIO numbers is acceptable in such driver.

Is this correct ?
If it is, I will submit my patch on platform-drivers ML.

Regards,
-- 
Vincent Pelletier
