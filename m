From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RFT: gpio: pca953x: use gpiolib irqchip helpers
Date: Wed, 28 May 2014 15:28:09 +0200
Message-ID: <CACRpkdbpzkyrdKFjR-gpPzXgQxsrhRmkRFXShG-nBE02+4A+nQ@mail.gmail.com>
References: <1399635339-16812-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:58583 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753658AbaE1N2J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 28 May 2014 09:28:09 -0400
Received: by mail-ob0-f177.google.com with SMTP id wp4so10505112obc.36
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2014 06:28:09 -0700 (PDT)
In-Reply-To: <1399635339-16812-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, Graeme Smecher <gsmecher@threespeedlogic.com>, Andrew Ruder <andy@aeruder.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Fri, May 9, 2014 at 1:35 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> This switches the PCA953x driver over to using the gpiolib irqchip
> helpers to handle the threaded interrups cascaded off this
> GPIO chip.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> PCA953x users: please! help testing this. It is just compile-tested
> but I'm sure this or something close to it will work just fine.
>
> The patch depends on the GPIO tree devel branch, so I have set up
> a branch you can test:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#pca953-irqchip-helpers
>
> The branch is on top of Toby's changes. Please help to provide
> Tested-by tags.

OK since nobody involved with this driver cares/have time/realized
they have to test the changes in advance I will now merge this to
the v3.16 devel branch and if you run into problems we fix this in the
v3.16 release cycle.

Yours,
Linus Walleij
