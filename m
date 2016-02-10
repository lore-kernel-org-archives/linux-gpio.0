From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: ath79: Allow building in compile tests
Date: Wed, 10 Feb 2016 11:08:59 +0100
Message-ID: <CACRpkdZMYd9xLjnD2OLJ2Q_JZswUgiZ0OG5pTYZuQWVG+fdCXw@mail.gmail.com>
References: <1454010273-21513-1-git-send-email-albeu@free.fr>
	<1454010273-21513-2-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36304 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994AbcBJKJA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2016 05:09:00 -0500
Received: by mail-ob0-f170.google.com with SMTP id ba1so20176405obb.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2016 02:08:59 -0800 (PST)
In-Reply-To: <1454010273-21513-2-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 28, 2016 at 8:44 PM, Alban Bedel <albeu@free.fr> wrote:

> To allow building the driver in compile tests we must drop the
> dependency on asm/mach-ath79/ar71xx_regs.h. For this we replace the
> include with local definition of the registers needed for this driver.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>

Patch applied. Much better like this anyways.

Yours,
Linus Walleij
