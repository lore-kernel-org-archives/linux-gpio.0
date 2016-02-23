From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] tools: gpio: Small updates for output format
Date: Tue, 23 Feb 2016 14:21:36 +0100
Message-ID: <CACRpkdbzJjPvwvkeBwsD_QO7ns+uFi7ui4JBV1guzVSt=iG_ug@mail.gmail.com>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33802 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751781AbcBWNVh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2016 08:21:37 -0500
Received: by mail-oi0-f51.google.com with SMTP id m82so77482772oif.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Feb 2016 05:21:37 -0800 (PST)
In-Reply-To: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Tue, Feb 23, 2016 at 8:54 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> Use %2d for the GPIO line number. This should align the results
> horziontally for most gpio chips.
>
> The GPIO label uses quotes for real values. For GPIO names this is
> currently missing. The patch adds the missing quote.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
