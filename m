From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] qnap-tsx51: add new driver for leds and button support on
 QNAP TS-x51 series
Date: Fri, 17 Jun 2016 23:02:47 +0200
Message-ID: <CACRpkdZx8S61zZhcWfEniC-yDhMXyTwZYgXc=sO+74kujT=g-w@mail.gmail.com>
References: <20160606004406.29f016de@gmail.com> <CACRpkdZ57_evCC=+hev9kNpY4bNViG+oBP7pOh8HkgRA0-oLXA@mail.gmail.com>
 <20160615004504.7b83d83c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34713 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136AbcFQVCs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2016 17:02:48 -0400
Received: by mail-oi0-f47.google.com with SMTP id d132so134508534oig.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jun 2016 14:02:48 -0700 (PDT)
In-Reply-To: <20160615004504.7b83d83c@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jun 15, 2016 at 2:45 AM, Vincent Pelletier
<plr.vincent@gmail.com> wrote:

> So I wonder if it makes sense at all for a driver to both define a gpio
> lookup table and then look for each gpio it just defined.
>
> Maybe I am doing it wrong and/or at the wrong level ?

Well ask yourself what you are doing I guess, GPIO is
General Purpose Input Output, a trap some people fall into
is confusing that with their special purpose input/outputs,
and sometimes they are input-only or output-only on top of
that. That is not GPIO.

So what is the use case for these electronics? If it is not
supposed to be used by misc input/output, it is not GPIO,
and it is better for the driver to manage it at will.

Yours,
Linus Walleij
