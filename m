From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Tue, 20 Jun 2017 14:28:02 +0200
Message-ID: <20170620122802.vddn3grn3aesmfrs@pd.tnic>
References: <alpine.DEB.2.20.1705232307330.2409@nanos>
 <CACRpkdbkEnLpZtLKz+x6FLQZTdsyxKsFexFa_UQwNxgZJGDExQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:34610 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750884AbdFTM2T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Jun 2017 08:28:19 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbkEnLpZtLKz+x6FLQZTdsyxKsFexFa_UQwNxgZJGDExQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ken Xue <Ken.Xue@amd.com>

On Mon, May 29, 2017 at 01:55:57PM +0200, Linus Walleij wrote:
> Patch applied for fixes.

Btw, any chance you can add the CC:stable tag to it or would you prefer
for me to backport it once it hits mainline?

Thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
