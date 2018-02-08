From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [ANNOUNCE] libgpiod v1.0
Date: Thu, 8 Feb 2018 15:12:12 +0100
Message-ID: <CACRpkdbnX0_eJBXM9kWv-xrtpWOLP_8u_2h=UArvGTvjnvC+HA@mail.gmail.com>
References: <CAMRc=MeEMu8cm=6F_7GEgGcJZgavYnsum+BuriOP1B8bkYbWAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:46255 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750961AbeBHOMO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Feb 2018 09:12:14 -0500
Received: by mail-io0-f172.google.com with SMTP id f34so5883175ioi.13
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2018 06:12:14 -0800 (PST)
In-Reply-To: <CAMRc=MeEMu8cm=6F_7GEgGcJZgavYnsum+BuriOP1B8bkYbWAQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, SZ Lin <sz.lin@moxa.com>, Clemens Gruber <clemens.gruber@pqgruber.com>

On Wed, Feb 7, 2018 at 4:52 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> libgpiod v1.0 has been released and is available at kernel.org[1][2].

Congratulations, and thanks for doing this!

The API looks very nice to me, sure there is some stuff around the
events we may need to polish, but we are very fine for now, and this
thing is already a million times better than the old sysfs ABI.

I hope it will be picked up by many consumers!

Yours,
Linus Walleij
