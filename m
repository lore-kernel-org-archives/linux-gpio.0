From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: bt8xx: remove unnecessary pci_set_drvdata()
Date: Fri, 20 Sep 2013 20:43:40 +0200
Message-ID: <CACRpkdaPA_3uD_Hg0Xve4tAwVRcRCBoiKGt6-ePMRHFGaHLULA@mail.gmail.com>
References: <001901ceaf84$1627bd10$42773730$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:46856 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753745Ab3ITSnk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 14:43:40 -0400
Received: by mail-ob0-f182.google.com with SMTP id wo20so1043637obc.13
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 11:43:40 -0700 (PDT)
In-Reply-To: <001901ceaf84$1627bd10$42773730$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michael Buesch <m@bues.ch>

On Thu, Sep 12, 2013 at 8:48 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> The driver core clears the driver data to NULL after device_release
> or on probe failure. Thus, it is not needed to manually clear the
> device driver data to NULL.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied.

Yours,
Linus Walleij
