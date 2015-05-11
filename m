From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] gpio: mxc: read output value from GPIO_DR register
Date: Mon, 11 May 2015 11:54:28 +0200
Message-ID: <CACRpkdY2b7sPgFCgSyqSVT_+vKeNFjqJDCKs8p7fdStZxLSvUg@mail.gmail.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
	<1430321701-13758-5-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33258 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752583AbbEKJy2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2015 05:54:28 -0400
Received: by obblk2 with SMTP id lk2so95952356obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2015 02:54:28 -0700 (PDT)
In-Reply-To: <1430321701-13758-5-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Shawn Guo <shawn.guo@linaro.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Apr 29, 2015 at 5:35 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> All supported iMX GPIO controllers store configured GPIO output value
> in GPIO_DR data register, which is represented by GPIO generic reg_set.
> Provide a BGPIOF_READ_OUTPUT_REG_SET flag to bgpio_init() to allow
> correct getting of previously set output value.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Patch applied, unless Shawn has some issue with it.
Add Shawn to CC when patching this driver.

Yours,
Linus Walleij
