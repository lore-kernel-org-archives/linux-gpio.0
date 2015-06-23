From: Gottfried Haider <gottfried.haider@gmail.com>
Subject: Re: Pull-up/down control via sysfs
Date: Tue, 23 Jun 2015 07:33:29 +0200
Message-ID: <CAPoCmYK02CpVGaTzdnEPoC6Rn35KPZWB3OAU5=jUO5bMKccQzQ@mail.gmail.com>
References: <CAPoCmY+Py2Ngq4M8OwTV7egSp7bQoGR4kbFpyRN6+DGzHZnfHA@mail.gmail.com>
 <CAAVeFu+7y1dexCvtoOcYFn48DJGE5_jChQQ8nWpz7uwf7fNOHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:36859 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752185AbbFWFdu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2015 01:33:50 -0400
Received: by lbbpo10 with SMTP id po10so21892315lbb.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2015 22:33:49 -0700 (PDT)
In-Reply-To: <CAAVeFu+7y1dexCvtoOcYFn48DJGE5_jChQQ8nWpz7uwf7fNOHA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

> GPIOs have open source/open drain flags that I think can be used for
> what you want. The only problem is that these flags cannot be
> controlled from the sysfs interface. It should not be hard to add one
> entry to control these as well.
>
> What do you need to do exactly? Do you just want to set a pin as
> pull-up or pull-down? If so, using pinctrl seems more appropriate. My
> suggestion only applies if you need to control the GPIO's value after
> setting the open-source/open-drain property.

ARM boards such as the Raspberry Pi have internal pull-up & pull-down
resistors for their GPIO pins, that can be controlled via a set of
registers. I'd like to use them for input - i.e. giving the user
working with the board's exposed GPIO pins (pin header) the choice
whether to pull them high or low or leave them floating. I believe
that's quite handy, especially when learning about digital
electronics..

Is this what you had in mind with open source/open drain? Not so
familiar with that terminology but the pinctrl documentation mentions
an "input bias pull{up,down}".
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
