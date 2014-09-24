From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: xgene: Remove unneeded #ifdef CONFIG_OF guard
Date: Wed, 24 Sep 2014 11:03:26 +0200
Message-ID: <CACRpkdb=xW9mHDkdr82MnSGpXovZF01sE-GynzoZjc_JvkyMfg@mail.gmail.com>
References: <1411273889.20539.0.camel@phoenix>
	<1411273979.20539.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:45425 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414AbaIXJD1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Sep 2014 05:03:27 -0400
Received: by mail-ig0-f179.google.com with SMTP id l13so6140644iga.12
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2014 02:03:26 -0700 (PDT)
In-Reply-To: <1411273979.20539.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Feng Kan <fkan@apm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Sep 21, 2014 at 6:32 AM, Axel Lin <axel.lin@ingics.com> wrote:

> This driver depends on OF_GPIO, so it won't be built if !CONFIG_OF.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
