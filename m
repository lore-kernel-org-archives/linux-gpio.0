From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: promote own request failure to pr_err()
Date: Fri, 5 Jun 2015 12:18:09 +0200
Message-ID: <CACRpkdbb2puir1-oHDGtO+-sBOrAOR_1z-cfWkqPTRnQZsRVRg@mail.gmail.com>
References: <1433495421-16267-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35177 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754075AbbFEKSK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2015 06:18:10 -0400
Received: by oihd6 with SMTP id d6so50243703oih.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2015 03:18:09 -0700 (PDT)
In-Reply-To: <1433495421-16267-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Fri, Jun 5, 2015 at 11:10 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> These error messages are helpful to see that we fail to get
> hogs. Promote them to real errors so they appear in the boot
> crawl.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Bah I realize these are debug prints due to deferred probe
that would give unreasonable noise. Dropping this patch.

Yours,
Linus Walleij
