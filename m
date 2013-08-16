From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Fix platform driver name in Kontron PLD GPIO driver
Date: Fri, 16 Aug 2013 17:05:32 +0200
Message-ID: <CACRpkdb-V9f8eoSKQ8xOtKNh=9RFUDXAcgere-FsBXwk7E5fYQ@mail.gmail.com>
References: <20130809173306.1ba24b59@mail.gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:58479 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754055Ab3HPPFd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 11:05:33 -0400
Received: by mail-oa0-f44.google.com with SMTP id l20so2375853oag.31
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 08:05:33 -0700 (PDT)
In-Reply-To: <20130809173306.1ba24b59@mail.gmx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Brunner <mibru@gmx.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Kevin Strasser <strassek@engr.orst.edu>, Darren Hart <dvhart@linux.intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Chris Healy <chealy@imsco-us.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Aug 9, 2013 at 5:33 PM, Michael Brunner <mibru@gmx.de> wrote:

> This patch changes the driver name to be consistent with the name that
> is registered as cell name in the MFD driver. Otherwise the driver won't
> load.
>
> Signed-off-by: Michael Brunner <michael.brunner@kontron.com>

Patch applied!

Yours,
Linus Walleij
