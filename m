From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/11] Documentation: bindings: move the Berlin pinctrl documentation
Date: Thu, 5 Mar 2015 10:41:42 +0100
Message-ID: <CACRpkdY5g4Xjtf0gRP2b2BjEmXRgorwDB8zFaUcGZbpwPGQE1g@mail.gmail.com>
References: <1423671332-24580-1-git-send-email-antoine.tenart@free-electrons.com>
	<1423671332-24580-9-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:36085 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932175AbbCEJlm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Mar 2015 04:41:42 -0500
Received: by obbnt9 with SMTP id nt9so12752843obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2015 01:41:42 -0800 (PST)
In-Reply-To: <1423671332-24580-9-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, zhiming Xu <zmxu@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 11, 2015 at 5:15 PM, Antoine Tenart
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

I tried applying the patch but it doesn't work. Rebase on v4.0-rc1 and
resend if you want me to apply it to the pinctrl tree.

Yours,
Linus Walleij
