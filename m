From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: 74x164: Driver cleanup
Date: Thu, 12 Dec 2013 09:19:01 +0100
Message-ID: <CACRpkdZSvj0FFesCnLDdWepZ2BSERjNV-rfDS9W4A102XnuhRQ@mail.gmail.com>
References: <1386410903-29788-1-git-send-email-shc_work@mail.ru>
	<1386410903-29788-2-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:47856 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399Ab3LLITD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2013 03:19:03 -0500
Received: by mail-oa0-f42.google.com with SMTP id i4so68122oah.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2013 00:19:02 -0800 (PST)
In-Reply-To: <1386410903-29788-2-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>

On Sat, Dec 7, 2013 at 11:08 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> - Removed excess "spi" field from private data.
> - Removed excess check for spi_get_drvdata() in remove().
> - Removed unneeded message in remove().
> - Simplify error path in probe().
> - Fixed warnings by cripts/checkfile.pl.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Patch applied.

Yours,
Linus Walleij
