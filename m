From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: pca953x: Drop deprecated DT bindings
Date: Fri, 8 Aug 2014 15:07:21 +0200
Message-ID: <CACRpkdYOuUXv9U+sb_hQFNvVUm1G7W46sRv6n3nSPMwz7yLUiQ@mail.gmail.com>
References: <1406618686-22385-1-git-send-email-mpa@pengutronix.de>
	<1406618686-22385-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:42293 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756568AbaHHNHW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Aug 2014 09:07:22 -0400
Received: by mail-oa0-f45.google.com with SMTP id i7so4040738oag.32
        for <linux-gpio@vger.kernel.org>; Fri, 08 Aug 2014 06:07:22 -0700 (PDT)
In-Reply-To: <1406618686-22385-2-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Jul 29, 2014 at 9:24 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> Drop deprecated DT bindings and use automaticly assigned gpio and irq
> bases.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Patch applied.

> -       val = of_get_property(node, "linux,gpio-base", &size);
> -       WARN(val, "%s: device-tree property 'linux,gpio-base' is deprecated!", __func__);

Gah! This should never have been merged.

I even consider this patch a bug fix now.

Yours,
Linus Walleij
