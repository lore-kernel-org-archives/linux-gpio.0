From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: Remove .owner field for driver
Date: Fri, 29 Aug 2014 07:46:45 +0200
Message-ID: <CACRpkdYBbonERHWMWF3X5VfwWaiwc7OfwadyR0Nbr=x0NixBMQ@mail.gmail.com>
References: <78682b5ace6f31f2b52496823823116076eefd61.1407931277.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:52726 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752067AbaH2Fqq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 01:46:46 -0400
Received: by mail-oi0-f43.google.com with SMTP id e131so1297150oig.16
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2014 22:46:46 -0700 (PDT)
In-Reply-To: <78682b5ace6f31f2b52496823823116076eefd61.1407931277.git.michal.simek@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Josh Cartwright <josh.cartwright@ni.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Aug 13, 2014 at 2:01 PM, Michal Simek <michal.simek@xilinx.com> wrote:

> There is no need to init .owner field.
>
> Based on the patch from Peter Griffin <peter.griffin@linaro.org>
> "mmc: remove .owner field for drivers using module_platform_driver"
>
> This patch removes the superflous .owner field for drivers which
> use the module_platform_driver API, as this is overriden in
> platform_driver_register anyway."
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Patch applied.

Yours,
Linus Walleij
