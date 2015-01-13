From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mxs: Use PIN2IRQ register to mask interrupts
Date: Tue, 13 Jan 2015 07:34:31 +0100
Message-ID: <CACRpkdaqPVED6U6mYWEzfrbtoYdfmdGZ34jjmokMp_KfOCZnaQ@mail.gmail.com>
References: <1418639312-12520-1-git-send-email-robin@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:43942 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039AbbAMGeb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jan 2015 01:34:31 -0500
Received: by mail-ie0-f182.google.com with SMTP id x19so1146930ier.13
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2015 22:34:31 -0800 (PST)
In-Reply-To: <1418639312-12520-1-git-send-email-robin@protonic.nl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robin van der Gracht <robin@protonic.nl>, Shawn Guo <shawn.guo@linaro.org>, Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Sascha Hauer <kernel@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Jander <david@protonic.nl>, Marek Vasut <marex@denx.de>

On Mon, Dec 15, 2014 at 11:28 AM, Robin van der Gracht
<robin@protonic.nl> wrote:

> The PIN2IRQ register should be used to mask an interrupt. Clearing a
> bit in the IRQEN register only prevents the interrupt from propagating but
> still allows hardware to set the status bit when triggered. So when
> unmasking the interrupt, it will immediately re-trigger if an interrupt
> condition occurred during masking.
>
> This is unwanted behavior especially when using level triggered
> interrupts. In this case every interrupt triggers twice. If the
> interrupt is handled in the handler, the second interrupt will be
> the first one to be able to ack the interrupt.
>
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>

Apparently MXS is a popular GPIO controller without a real maintainer.

Adding some random users to the To: line hoping we get some
review of this patch.

Yours,
Linus Walleij
