From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 16/35] gpio: use dev_get_platdata()
Date: Fri, 16 Aug 2013 15:25:37 +0200
Message-ID: <CACRpkdau+3iPzNQxR52i3KyYCECOPaOhTvve5U=F2cKsRr8afw@mail.gmail.com>
References: <004101ce8cfb$eb8fe8c0$c2afba40$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:65122 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751184Ab3HPNZi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 09:25:38 -0400
Received: by mail-ob0-f182.google.com with SMTP id wo10so2059042obc.27
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 06:25:37 -0700 (PDT)
In-Reply-To: <004101ce8cfb$eb8fe8c0$c2afba40$@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jul 30, 2013 at 10:08 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Use the wrapper function for retrieving the platform data instead of
> accessing dev->platform_data directly.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied. Had to do some rebasing on one hunk of the
patch, pls check the result in linux-next.

Yours,
Linus Walleij
