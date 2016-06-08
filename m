From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: zynq: initialize clock even without CONFIG_PM
Date: Wed, 8 Jun 2016 10:37:12 +0200
Message-ID: <CACRpkdYo6wQapLO8_OD0VZR+PaJJmXAzA6VLimU+NPfJLb4DRg@mail.gmail.com>
References: <20160603121526.GA23642@laureti-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35179 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422787AbcFHIhO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 04:37:14 -0400
Received: by mail-oi0-f48.google.com with SMTP id s139so1911584oie.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 01:37:13 -0700 (PDT)
In-Reply-To: <20160603121526.GA23642@laureti-dev>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Helmut Grohne <h.grohne@intenta.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Helmut Buchsbaum <helmut.buchsbaum@gmail.com>

On Fri, Jun 3, 2016 at 2:15 PM, Helmut Grohne <h.grohne@intenta.de> wrote:

> When the PM initialization was moved in the commit referenced below, the
> code enabling the clock was removed from the probe function. On
> CONFIG_PM=y kernels, this is not a problem as the pm resume hook enables
> the clock, but when power management is disabled, all those pm_*
> functions are noops and the clock is never enabled resulting in a
> dysfunctional gpio controller.
>
> Put the clock initialization back to support CONFIG_PM=n.
>
> Signed-off-by: Helmut Grohne <h.grohne@intenta.de>
> Fixes: 3773c195d387 ("gpio: zynq: Do PM initialization earlier to support gpio hogs")

This v2 patch applied for fixes and tagged for stable.

Yours,
Linus Walleij
