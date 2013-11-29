From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] powerpc/gpio: Fix the wrong GPIO input data on MPC8572/MPC8536
Date: Fri, 29 Nov 2013 10:32:47 +0100
Message-ID: <CACRpkdaHtWze_L-WQ1JadN7isN6HLtv=p3ich8DvT+gjWbGdfg@mail.gmail.com>
References: <1385107960-373-1-git-send-email-Gang.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:60173 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753763Ab3K2Jcs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 04:32:48 -0500
Received: by mail-ob0-f169.google.com with SMTP id wm4so9824327obc.14
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 01:32:47 -0800 (PST)
In-Reply-To: <1385107960-373-1-git-send-email-Gang.Liu@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@freescale.com>, Anatolij Gustschin <agust@denx.de>
Cc: "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, b07421@freescale.com, r61911@freescale.com

On Fri, Nov 22, 2013 at 9:12 AM, Liu Gang <Gang.Liu@freescale.com> wrote:

> For MPC8572/MPC8536, the status of GPIOs defined as output
> cannot be determined by reading GPDAT register, so the code
> use shadow data register instead. But the code may give the
> wrong status of GPIOs defined as input under some scenarios:
>
> 1. If some pins were configured as inputs and were asserted
> high before booting the kernel, the shadow data has been
> initialized with those pin values.
> 2. Some pins have been configured as output first and have
> been set to the high value, then reconfigured as input.
>
> The above cases will make the shadow data for those input
> pins to be set to high. Then reading the pin status will
> always return high even if the actual pin status is low.
>
> The code should eliminate the effects of the shadow data to
> the input pins, and the status of those pins should be
> read directly from GPDAT.
>
> Signed-off-by: Liu Gang <Gang.Liu@freescale.com>
> ---
> changes in v2:
>  - Added more description of the problem.
>  - Reduced one in_be32() call.
>  - Do not modify the shadow data.

I'm waiting for the maintainers to ACK this before
applying.

Anatolij?

Yours,
Linus Walleij
