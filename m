From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: grgpio: Avoid potential NULL pointer dereference
Date: Thu, 8 Jan 2015 20:14:26 +0100
Message-ID: <CACRpkdb6dv+CA26QwWLA8VbMUpM61N5u-R4=awdybF2j9dimWQ@mail.gmail.com>
References: <1419086827.20365.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:60389 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001AbbAHTOa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jan 2015 14:14:30 -0500
Received: by mail-ie0-f171.google.com with SMTP id ar1so11213020iec.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2015 11:14:29 -0800 (PST)
In-Reply-To: <1419086827.20365.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andreas Larsson <andreas@gaisler.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Dec 20, 2014 at 3:47 PM, Axel Lin <axel.lin@ingics.com> wrote:

> irqmap is optional property, so priv->domain can be NULL if !irqmap.
> Thus add NULL test for priv->domain before calling irq_domain_remove()
> to prevent NULL pointer dereference.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied for fixes. Thanks!

Yours,
Linus Walleij
