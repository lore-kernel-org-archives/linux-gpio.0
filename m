From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 090/182] pinctrl: cygnus-gpio: use gpiochip data pointer
Date: Sun, 13 Dec 2015 12:27:22 +0100
Message-ID: <CACRpkdbSDCdQJvDUyvYo9-HRbh66XRYNMH7VdFLPARqgTK_mBw@mail.gmail.com>
References: <1449667793-1826-1-git-send-email-linus.walleij@linaro.org>
	<56685F8F.4020700@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33479 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751717AbbLML1X (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2015 06:27:23 -0500
Received: by oigy66 with SMTP id y66so4965038oig.0
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2015 03:27:22 -0800 (PST)
In-Reply-To: <56685F8F.4020700@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>

On Wed, Dec 9, 2015 at 6:06 PM, Ray Jui <rjui@broadcom.com> wrote:

> The change itself looks fine to me. But I thought the previous patchset from
> Pramod changes the file name, all the function names and macros from
> "cygnus" to "iproc" and have been merged by you?
>
> Shouldn't this patch be developed on top of that? Or am I missing something?

Merge conflicts is a fact of life. I am merging this change to the GPIO
tree and the other stuff is merged to the pinctrl tree.

That said I think that git copes with this kind of stuff. And if it doesn't,
I will maybe merge the trees into one for this merge window, just to make
things easier.

Yours,
Linus Walleij
