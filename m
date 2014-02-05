From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pl061: Select IRQ_DOMAIN rather than GENERIC_IRQ_CHIP
Date: Wed, 5 Feb 2014 13:42:29 +0100
Message-ID: <CACRpkdYP+S+NAUsQQ1M6tJDrGrZHke5HOYZV+2VZrbFtxjW4+A@mail.gmail.com>
References: <1391517541.3899.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:39671 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751671AbaBEMm3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 07:42:29 -0500
Received: by mail-ob0-f171.google.com with SMTP id wp4so333738obc.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 04:42:29 -0800 (PST)
In-Reply-To: <1391517541.3899.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 4, 2014 at 1:39 PM, Axel Lin <axel.lin@ingics.com> wrote:

> commit f1f70479e999 "gpio: pl061: support irqdomain" drops the support of
> irq generic chip and use irqdomain instead. Thus fixes the dependency by
> selecting IRQ_DOMAIN rather than GENERIC_IRQ_CHIP.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch appled for next.

Yours,
Linus Walleij
