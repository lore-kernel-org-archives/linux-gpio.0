From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: 74x164: Remove non-DT support
Date: Thu, 12 Dec 2013 09:17:02 +0100
Message-ID: <CACRpkdb_EVaOnkqkhmRJB12N_W4ghQyYVD+iriD26bjpvh9-Xg@mail.gmail.com>
References: <1386410903-29788-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:41708 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399Ab3LLIRD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2013 03:17:03 -0500
Received: by mail-oa0-f46.google.com with SMTP id o6so62773oag.5
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2013 00:17:02 -0800 (PST)
In-Reply-To: <1386410903-29788-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Mark Brown <broonie@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>

On Sat, Dec 7, 2013 at 11:08 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Commit 20bc4d5d565159eb2b942bf4b7fae86fba94e32c
> (gpio: 74x164: Add support for the daisy-chaining) introduce check
> for DT for the driver, so driver cannot be used without DT.
> There are no in-tree users of this driver, so remove non-DT support
> completely.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/gpio/Kconfig       |  6 +++---
>  drivers/gpio/gpio-74x164.c | 14 +-------------
>  include/linux/spi/74x164.h |  9 ---------
>  3 files changed, 4 insertions(+), 25 deletions(-)
>  delete mode 100644 include/linux/spi/74x164.h

Broonie: is it OK that I apply this patch deleting <linux/spi/74x164.h>
to the GPIO tree? Apparently it's only platform data for the GPIO.

(Tentatively applied, waiting for Marks ACK.)

Yours,
Linus Walleij
