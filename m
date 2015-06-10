From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 07/10] Documentation: bindings: move the Berlin pinctrl documentation
Date: Wed, 10 Jun 2015 09:14:39 +0200
Message-ID: <CACRpkdZ8k9OVCPG1AMCJG9UMtL6Q2tCd+syKXR10F=E8ifuQDA@mail.gmail.com>
References: <1425654328-26298-1-git-send-email-antoine.tenart@free-electrons.com>
	<1425654328-26298-8-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33055 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933345AbbFJHOk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 03:14:40 -0400
Received: by oiha141 with SMTP id a141so26585045oih.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 00:14:39 -0700 (PDT)
In-Reply-To: <1425654328-26298-8-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, zhiming Xu <zmxu@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Mar 6, 2015 at 4:05 PM, Antoine Tenart
<antoine.tenart@free-electrons.com> wrote:

> The Berlin pinctrl documentation was part of the Marvell Berlin SoC
> documentation because the Berlin pinctrl configuration was inside the
> chip and the system controllers. With the recent rework of the chip and
> system controller handling (now an MFD driver registers all sub-devices
> of the two soc and system controller nodes and each device has its own
> sub-node), the documentation of the Berlin pinctrl driver can be moved
> to the generic pinctrl documentation directory.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
