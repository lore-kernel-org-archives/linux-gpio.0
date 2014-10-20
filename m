From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: allow exporting gpios with custom names
Date: Mon, 20 Oct 2014 10:29:09 +0900
Message-ID: <CAAVeFuLDrbmXTshzrpHoh9W78vi96CrrpD7ULDrBry-Y3cs2iw@mail.gmail.com>
References: <1413049516-27021-1-git-send-email-lexszero@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:39271 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752093AbaJTB3a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Oct 2014 21:29:30 -0400
Received: by mail-ie0-f173.google.com with SMTP id tp5so3815826ieb.18
        for <linux-gpio@vger.kernel.org>; Sun, 19 Oct 2014 18:29:29 -0700 (PDT)
In-Reply-To: <1413049516-27021-1-git-send-email-lexszero@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexey Ignatov <lexszero@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi,

On Sun, Oct 12, 2014 at 2:45 AM, Alexey Ignatov <lexszero@gmail.com> wrote:
> This allows exporting gpio pins to sysfs with custom names. Before
> this patch only gpiochip-supplied names was used, or generic gpio%d.
> Added gpiod_export_name() and gpio_export_name() functions.

This looks very similar to another proposal that has been posted a few
months ago:

https://lkml.org/lkml/2014/7/23/537

There has been a lenghty discussion about the merits/drawbacks of
doing this instead of using gpiod_export_link(). To summarize my
opinion on the matter, I *really* think using gpiod_export_link() is a
better solution since it puts the GPIO under its owner's /sysfs node,
instead of having totally unrelated GPIOs arbitrarily named under
/sys/class/gpio. IIRC Linus was not too enthusiastic neither.

Could you explain why you think this change is needed, how you plan to
make use of it, and why you cannot use gpiod_export_link() to do the
same?

> gpio_request_one() now uses new behaviour with 'label' as gpio name.

Doesn't this mean that drivers that used gpio_request_one() to export
a GPIO might see the exported name change all of a sudden? This might
make a few people unhappy (also, I could not see this change in your
patch, but only had a quick look).
