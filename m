From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/9] ARM: sa1100: convert gpio driver to be a proper
 platform driver
Date: Tue, 19 Nov 2013 11:08:09 +0100
Message-ID: <CACRpkdYb6KAG2i-NH2iAmYvtGDnhOgO9CZxmYsNPJXN6qqkOoQ@mail.gmail.com>
References: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com>
	<1384505280-25389-5-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:46224 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618Ab3KSKIJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 05:08:09 -0500
Received: by mail-ob0-f171.google.com with SMTP id wp18so3708322obc.30
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 02:08:09 -0800 (PST)
In-Reply-To: <1384505280-25389-5-git-send-email-dbaryshkov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Dmitry Artamonow <mad_soft@inbox.ru>

On Fri, Nov 15, 2013 at 9:47 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:

> Start cleaning up/refreshing SA1100 GPIO driver.
> * Changed to bind through device model.
> * Replaced direct register access with readl/writel.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess you want to merge this one through Russell's tree
with the rest of the patches.

Yours,
Linus Walleij
