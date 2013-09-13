From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/7] staging: media/lirc: switch to use gpiolib
Date: Fri, 13 Sep 2013 09:14:06 +0200
Message-ID: <CACRpkdaBeYTchtQn6-QThAv2XWAT=vd=YarHA1TgVZeLoLNfpA@mail.gmail.com>
References: <1378816283-8164-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:57933 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752319Ab3IMHOH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2013 03:14:07 -0400
Received: by mail-ob0-f175.google.com with SMTP id uz6so779772obc.6
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2013 00:14:06 -0700 (PDT)
In-Reply-To: <1378816283-8164-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Mauro,

On Tue, Sep 10, 2013 at 2:31 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> The lirc serial module has special hooks to work with NSLU2,
> switch these over to use gpiolib, as that is available on the
> ixp4 platform.
>
> Not even compile tested as there is no way to select this
> driver from menuconfig on the ixp4 platform.
>
> Cc: Imre Kaloz <kaloz@openwrt.org>
> Cc: Krzysztof Halasa <khc@pm.waw.pl>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hi Greg: I'm seeking an ACK on this patch to take it through
> the GPIO tree as part of a clean-up attempt to remove custom
> GPIO APIs.

Could you ACK this patch if it looks OK to you?

Yours,
Linus Walleij
