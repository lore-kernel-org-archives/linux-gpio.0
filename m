From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH 1/2] pinctrl: change function behavior for per pin
 muxing controllers
Date: Mon, 13 Jul 2015 14:13:36 +0200
Message-ID: <CACRpkdaR1TP_cRY+oR91SijTungpFzmYACw5R-230yMbkPvmvg@mail.gmail.com>
References: <1433948699-19800-1-git-send-email-ludovic.desroches@atmel.com>
	<1433948699-19800-2-git-send-email-ludovic.desroches@atmel.com>
	<557EF60D.8020007@wwwdotorg.org>
	<20150617123816.GB12295@odux.rfo.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35479 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751196AbbGMMNh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 08:13:37 -0400
Received: by obbop1 with SMTP id op1so227719312obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2015 05:13:36 -0700 (PDT)
In-Reply-To: <20150617123816.GB12295@odux.rfo.atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Sascha Hauer <kernel@pengutronix.de>
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>

On Wed, Jun 17, 2015 at 2:38 PM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:

> It is not the first time, there are discussions about it. Sascha sent a
> patch which fits part of my needs:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/318452.html

It would be helpful to have Sascha's review of this patch set.

If it also fixes his issues, we will have some partial consensus,
as in "fixes more that AT91 problems".

Yours,
Linus Walleij
