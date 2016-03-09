From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: omap: drop dev field from gpio_bank structure
Date: Wed, 9 Mar 2016 18:08:04 +0700
Message-ID: <CACRpkdYJbGQMUSN7-LjD_BApuMagVZt3W9MzkH3UeAsyBBQ3Bw@mail.gmail.com>
References: <1457105135-28124-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34793 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932234AbcCILIH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 06:08:07 -0500
Received: by mail-ob0-f182.google.com with SMTP id ts10so43025036obc.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2016 03:08:05 -0800 (PST)
In-Reply-To: <1457105135-28124-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Mar 4, 2016 at 10:25 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> GPIO chip structure already has "parent" field which is used for the
> same purpose as "dev" field in gpio_bank structure - store pointer on
> GPIO device.
>
> Hence, drop duplicated "dev" field from gpio_bank structure.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied with Santosh's ACK.

Yours,
Linus Walleij
