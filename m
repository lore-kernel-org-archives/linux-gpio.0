From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND 2/2] pinctrl: i.MX27: Remove nonexistent pad definitions
Date: Fri, 4 Jul 2014 23:51:58 +0200
Message-ID: <CACRpkdYV-mrk_PuAeoX-kL-RowxpyEyHJzkCtuoCF9pFoKw97A@mail.gmail.com>
References: <1401813255-7897-1-git-send-email-shc_work@mail.ru>
	<1401813255-7897-2-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:60522 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752848AbaGDVv7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jul 2014 17:51:59 -0400
Received: by mail-oa0-f53.google.com with SMTP id l6so2250662oag.40
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2014 14:51:58 -0700 (PDT)
In-Reply-To: <1401813255-7897-2-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawn.guo@freescale.com>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Jun 3, 2014 at 6:34 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Pads for PB0-PB3, PC0-PC4, PE26-PE31 and PF24-PF31 does not exist on
> the i.MX27 SOC. There is no reason to define them, the presence of
> such definitions in the DTS files is a bug.
> This patch removes these nonexistent pad definitions.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Patch applied.

Maintainers may protest if they don't like this.

Yours,
Linus Walleij
