From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: split gpiod board registration into machine header
Date: Fri, 25 Jul 2014 11:16:43 +0900
Message-ID: <CAAVeFuKUZOCa=U-VcTQ2XsXzBbQD8DUbSzukowfXaxFJniYFDg@mail.gmail.com>
References: <1406225801-30295-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:63547 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758856AbaGYCRF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jul 2014 22:17:05 -0400
Received: by mail-ie0-f179.google.com with SMTP id rl12so2976868iec.24
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2014 19:17:04 -0700 (PDT)
In-Reply-To: <1406225801-30295-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Ralf Baechle <ralf@linux-mips.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>

On Fri, Jul 25, 2014 at 3:16 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> As per example from the regulator subsystem: put all defines and
> functions related to registering board info for GPIO descriptors
> into a separate <linux/gpio/machine.h> header.

Definitely the right thing to do, thanks!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
