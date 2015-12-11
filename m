From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND RFC PATCH 1/2] gpio: Add isr property of gpio pins
Date: Fri, 11 Dec 2015 13:43:31 +0100
Message-ID: <CACRpkdbQztU14hY60HPv78TjVWVLx6RBzrFQqddVfNv3cj142g@mail.gmail.com>
References: <1449544808-3163-1-git-send-email-peda@lysator.liu.se>
	<1449544808-3163-2-git-send-email-peda@lysator.liu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:36095 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752631AbbLKMnc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 07:43:32 -0500
Received: by oiww189 with SMTP id w189so62043746oiw.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 04:43:31 -0800 (PST)
In-Reply-To: <1449544808-3163-2-git-send-email-peda@lysator.liu.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Rosin <peda@lysator.liu.se>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Peter Rosin <peda@axentia.se>

On Tue, Dec 8, 2015 at 4:20 AM, Peter Rosin <peda@lysator.liu.se> wrote:

> From: Peter Rosin <peda@axentia.se>
>
> Adds the possibility to read the interrupt status register bit for the
> gpio pin. Expose the bit as an isr file in sysfs.
>
> Signed-off-by: Peter Rosin <peda@axentia.se>

NACK. We have frozen the sysfs ABI and we are working on a
character device to replace it for userspace access, see:
http://marc.info/?l=linux-gpio&m=144550276512673&w=2

Second question is *WHY* you want this crazy thing? Userspace
should want *events* from a file descriptor, like IIO does it for
example (on top of a proper chardev), not polling a register to
figure out if an IRQ occurred.

We need to think about the real solution to what you want to do.

Yours,
Linus Walleij
