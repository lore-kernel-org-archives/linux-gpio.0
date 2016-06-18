From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] qnap-tsx51: add new driver for leds and button support on
 QNAP TS-x51 series
Date: Sat, 18 Jun 2016 10:00:00 +0200
Message-ID: <CACRpkdb7Cvrps1VKtv=9J4i2L4nKbEwb6RoT8__xpUJkQHXuXw@mail.gmail.com>
References: <20160606004406.29f016de@gmail.com> <CACRpkdZ57_evCC=+hev9kNpY4bNViG+oBP7pOh8HkgRA0-oLXA@mail.gmail.com>
 <20160615004504.7b83d83c@gmail.com> <CACRpkdZx8S61zZhcWfEniC-yDhMXyTwZYgXc=sO+74kujT=g-w@mail.gmail.com>
 <20160618071806.546da3fa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35611 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864AbcFRIAD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2016 04:00:03 -0400
Received: by mail-oi0-f49.google.com with SMTP id v7so36733576oig.2
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jun 2016 01:00:02 -0700 (PDT)
In-Reply-To: <20160618071806.546da3fa@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Jun 18, 2016 at 9:18 AM, Vincent Pelletier
<plr.vincent@gmail.com> wrote:

> Just to confirm my understanding:
> - from the chip (and its module) point of view, these signals are
>   GPIOs, because they cannot presume how it is wired
> - but from the platform point of view (this specific NAS model), these
>   GPIOs are wired to leds and buttons, so they are leds and buttons
>   and not GPIOs anymore
>
> So using GPIO numbers is acceptable in such driver.

We usually model this as GPIO if it is GPIO on the SoC,
because we want to reuse the same code on several systems
using the same SoC.

But you should use GPIO descriptors, not numbers.

Yours,
Linus Walleij
