From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 06/23] gpio: sysfs: clean up chip class-device handling
Date: Tue, 12 May 2015 10:14:59 +0200
Message-ID: <CACRpkdb1K36QpEJrE4no0jP5L5VaHwmur5qFM2LZ5YSLRneKJw@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-7-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:33289 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752782AbbELIPA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 04:15:00 -0400
Received: by obblk2 with SMTP id lk2so119143137obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 01:14:59 -0700 (PDT)
In-Reply-To: <1430752248-15401-7-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Clean gpio-chip class device registration and deregistration.
>
> The class device is registered when a gpio-chip is added (or from
> gpiolib_sysfs_init post-core init call), and deregistered when the chip
> is removed.
>
> Store the class device in struct gpio_chip directly rather than do a
> class-device lookup on deregistration. This also removes the need for
> the exported flag.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
