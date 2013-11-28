From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: move irqdomain initialization
Date: Thu, 28 Nov 2013 15:23:09 +0100
Message-ID: <CACRpkdaHRuFqKDzxGVf+PHpW7Yo6uUo5MreiCybgxBC27OOupg@mail.gmail.com>
References: <1385557881-3667-1-git-send-email-linus.walleij@linaro.org>
	<20131127134159.GF32436@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:60457 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148Ab3K1OXK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2013 09:23:10 -0500
Received: by mail-ob0-f180.google.com with SMTP id wo20so8694707obc.25
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2013 06:23:09 -0800 (PST)
In-Reply-To: <20131127134159.GF32436@tarshish>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Alexandre Courbot <acourbot@nvidia.com>, Rob Herring <robherring2@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>

On Wed, Nov 27, 2013 at 2:41 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Isn't this a matter for -stable (v3.10+)?

Sure I just missed to add that tag. I'll send a separate ping to Greg
on stable@vger once this is upstream, I've put a reminder into my
calendar...

Yours,
Linus Walleij
