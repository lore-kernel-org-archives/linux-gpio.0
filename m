From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: imx: use generic pinmux helpers for managing functions
Date: Mon, 2 Jan 2017 22:42:37 +0100
Message-ID: <CACRpkdbWD0Uhc9GSFFCdtdgF5xzn2_n1eP0haOdekPEiwW71cg@mail.gmail.com>
References: <20170102182022.2047-1-gary.bisson@boundarydevices.com> <20170102182022.2047-3-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:34706 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933553AbdABVmi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Jan 2017 16:42:38 -0500
Received: by mail-qt0-f176.google.com with SMTP id d45so227007193qta.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Jan 2017 13:42:38 -0800 (PST)
In-Reply-To: <20170102182022.2047-3-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, ext Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 2, 2017 at 7:20 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Now using function_desc structure instead of imx_pmx_func.
>
> Also leveraging generic functions to retrieve functions count/name/groups.
>
> The imx_free_funcs function can be removed since it is now handled by
> the core driver during unregister.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Patch applied.

Yours,
Linus Walleij
