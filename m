From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] tools: gpio: Add necessary include paths
Date: Tue, 23 Feb 2016 14:26:09 +0100
Message-ID: <CACRpkdYxDeKDLN8bsA0q3F_q-WiSDd1JTEsw8YYwUXSecMmsoA@mail.gmail.com>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
	<1456214089-13954-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36152 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751880AbcBWN0J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2016 08:26:09 -0500
Received: by mail-oi0-f53.google.com with SMTP id w5so77562242oie.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Feb 2016 05:26:09 -0800 (PST)
In-Reply-To: <1456214089-13954-2-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Tue, Feb 23, 2016 at 8:54 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> Add include paths to the Makefile so that linux/gpio.h can be found even
> on systems without this header.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
(...)
> -CFLAGS += -Wall -g -D_GNU_SOURCE
> +CFLAGS += -Wall -g -D_GNU_SOURCE -I ../include -I ../../include/uapi

This is probably not how userspace compilation is supposed
to work. The way I understand it, userspace programs from tools/*
should be compiled like this:

make headers_install ARCH=foo INSTALL_HDR_PATH=<bar>
cd tools/gpio
make CFLAGS="$CFLAGS -I<bar>"

The reason being that UAPI files can differ after install depending
on arch.

Yours,
Linus Walleij
