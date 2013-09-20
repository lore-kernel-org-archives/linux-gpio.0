From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: Don't flip bits on PCA957x GPIO expanders
 when probing them.
Date: Fri, 20 Sep 2013 22:24:33 +0200
Message-ID: <CACRpkdbwo5J9tx4KcPf5sVngCyqEkauqn0GFzJ844GuuixBFsQ@mail.gmail.com>
References: <1379108508-19933-1-git-send-email-gsmecher@threespeedlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:51024 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755651Ab3ITUYe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 16:24:34 -0400
Received: by mail-ob0-f179.google.com with SMTP id wn1so1193196obc.10
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 13:24:33 -0700 (PDT)
In-Reply-To: <1379108508-19933-1-git-send-email-gsmecher@threespeedlogic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Graeme Smecher <gsmecher@threespeedlogic.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 13, 2013 at 11:41 PM, Graeme Smecher
<gsmecher@threespeedlogic.com> wrote:

> The pca957x driver supports a handful of I2C GPIO expanders from NXP, Maxim,
> and TI. For the PCA9574 and PCA9575 devices only, the driver resets the GPIO
> level and direction in the pca957x_probe function. This seems like the wrong
> thing to do, since it can cause hardware bit twiddles during warm reboots when
> the chip state and reset values don't match.
>
> This kind of initialization is best left upstream (in a bootloader) or
> downstream (in userspace). It's also an inconsistency across devices supported
> by this driver.
>
> This patch is NOT boot-tested: the SoC I'm  using is stuck on 2.6.37, and the
> patch doesn't apply trivially.
>
> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> Acked-by: Haojian Zhuang <haojian.zhuang@gmail.com>

Looks like you're deleting code from Gregory CLEMENT,
Gregory what do you say about this?

Yours,
Linus Walleij
