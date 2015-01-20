From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: mcp23s08: create default gpio base if neither
 device node nor platform data is defined
Date: Tue, 20 Jan 2015 19:11:33 +0900
Message-ID: <CAAVeFuLS4YeOEDK+LY_Do_0O8wX_dzsXN2hUnVonv48dA+Khbg@mail.gmail.com>
References: <1421744408-8837-1-git-send-email-sonic.adi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:63434 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753094AbbATKLx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jan 2015 05:11:53 -0500
Received: by mail-ig0-f181.google.com with SMTP id hn18so2685073igb.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2015 02:11:53 -0800 (PST)
In-Reply-To: <1421744408-8837-1-git-send-email-sonic.adi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sonic Zhang <sonic.adi@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?Antonio_Fiol_Bonn=C3=ADn?= <antonio@fiol.es>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, adi-buildroot-devel@lists.sourceforge.net, Sonic Zhang <sonic.zhang@analog.com>

On Tue, Jan 20, 2015 at 6:00 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks!

Note: please always include a commit body even if the title is enough
to understand the patch.

Antonio, could you try this and give us your Tested-by if it succeeds?
