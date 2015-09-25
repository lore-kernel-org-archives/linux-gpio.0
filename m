From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ath79: Convert to the state container design pattern
Date: Fri, 25 Sep 2015 09:39:51 -0700
Message-ID: <CACRpkdbX+cMmS-j85zqhPSa8XRQHtus6HXqZrLo9b++KAHDc5g@mail.gmail.com>
References: <1441100282-13584-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:33538 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932234AbbIYQjv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2015 12:39:51 -0400
Received: by obbbh8 with SMTP id bh8so86148308obb.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2015 09:39:51 -0700 (PDT)
In-Reply-To: <1441100282-13584-1-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Gabor Juhos <juhosg@openwrt.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 1, 2015 at 2:38 AM, Alban Bedel <albeu@free.fr> wrote:

> Turn the ath79 driver into a true driver supporting multiple
> instances. While at it also removed unneed includes and make use of
> the BIT() macro.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>
> ---
>
> This patch apply on top of my previous MIPS GPIO patches that are pending
> for 4.3, so it might be better to take it thru the MIPS tree.

Patch applied (for v4.4).

Would you consider sending a patch adding yourself as maintainer
for this file in MAINTAINERS?

Yours,
Linus Walleij
