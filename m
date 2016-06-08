From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: Do not treat a PIN without MUX register as
 an error
Date: Wed, 8 Jun 2016 09:52:32 +0200
Message-ID: <CACRpkdaZFs=equFmDYatYR2h1BM=H1VA3v-7J1+CTNaHBY8L0A@mail.gmail.com>
References: <1464808913-7796-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33138 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932331AbcFHHwd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 03:52:33 -0400
Received: by mail-oi0-f41.google.com with SMTP id k23so594250oih.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 00:52:32 -0700 (PDT)
In-Reply-To: <1464808913-7796-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Adrian Alonso <aalonso@freescale.com>, Philipp Zabel <p.zabel@pengutronix.de>

On Wed, Jun 1, 2016 at 9:21 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Some PINs do not have a MUX register, it is not an error.
> It is necessary to allow the continuation of the PINs configuration,
> otherwise the whole PIN-group will be configured incorrectly.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

No reply from the i.MX maintainers for a week but the issue seems
serious so I have applied it for fixes and tagged for stable.

Yours,
Linus Walleij
