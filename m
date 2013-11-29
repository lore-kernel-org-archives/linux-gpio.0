From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] powerpc/gpio: Fix the wrong GPIO input data on MPC8572/MPC8536
Date: Fri, 29 Nov 2013 13:37:41 +0100
Message-ID: <CACRpkday5SGFwhdLgit-am0+Hg0QQmwZonMC8ReQku5UoHp=_A@mail.gmail.com>
References: <1385107960-373-1-git-send-email-Gang.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:37171 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754497Ab3K2Mhm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 07:37:42 -0500
Received: by mail-oa0-f46.google.com with SMTP id o6so10375495oag.33
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 04:37:41 -0800 (PST)
In-Reply-To: <1385107960-373-1-git-send-email-Gang.Liu@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@freescale.com>
Cc: "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Anatolij Gustschin <agust@denx.de>, b07421@freescale.com, r61911@freescale.com

On Fri, Nov 22, 2013 at 9:12 AM, Liu Gang <Gang.Liu@freescale.com> wrote:

> For MPC8572/MPC8536, the status of GPIOs defined as output
> cannot be determined by reading GPDAT register, so the code
> use shadow data register instead. But the code may give the
> wrong status of GPIOs defined as input under some scenarios:
(...)
> Signed-off-by: Liu Gang <Gang.Liu@freescale.com>
> ---
> changes in v2:
>  - Added more description of the problem.
>  - Reduced one in_be32() call.
>  - Do not modify the shadow data.

Applied this v2 version, added ACKs and tagged for stable.

Yours,
Linus Walleij
