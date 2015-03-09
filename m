From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: do not implicitly set pin regs to -1
Date: Mon, 9 Mar 2015 17:18:05 +0100
Message-ID: <CACRpkdb1iTf4YjJ1r4Mq-jOun+J95ofRG8AkG+Oj6Of-m1=S0Q@mail.gmail.com>
References: <1423240256-27210-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:39952 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752337AbbCIQSG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 12:18:06 -0400
Received: by obcuz6 with SMTP id uz6so8274025obc.7
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 09:18:06 -0700 (PDT)
In-Reply-To: <1423240256-27210-1-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 6, 2015 at 5:30 PM, Stefan Agner <stefan@agner.ch> wrote:

> Commit 3dac1918a491 ("pinctrl: imx: detect uninitialized pins") needs
> the values in struct imx_pin_reg to be -1. This has been done in a
> rather unorthodox way by setting the memory to 0xff using memset...
> Use a proper for loop to initialize the whole array with -1.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Patch applied with the ACKs.

Yours,
Linus Walleij
