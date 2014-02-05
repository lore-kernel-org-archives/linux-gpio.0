From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: clps711x: Add missing .owner to struct gpio_chip
Date: Wed, 5 Feb 2014 13:43:41 +0100
Message-ID: <CACRpkda_O9zieJgxfgp8jKoSkc0wNupexMVNrG5Yn7xGW+7tAA@mail.gmail.com>
References: <1391523927.21522.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:48739 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbaBEMnl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 07:43:41 -0500
Received: by mail-ob0-f169.google.com with SMTP id wo20so336996obc.28
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 04:43:41 -0800 (PST)
In-Reply-To: <1391523927.21522.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 4, 2014 at 3:25 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Add missing .owner of struct gpio_chip. This prevents the
> module from being removed from underneath its users.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
