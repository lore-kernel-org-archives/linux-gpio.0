From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Tue, 7 Jan 2014 18:59:00 +0100
Message-ID: <CACRpkdZkYwDFk9gOhz+g+tmL8goA-PVEucps7qd6k54UTRFC1g@mail.gmail.com>
References: <bfc8635f56992aa8865dc58810a4f9872b3a0c86.1387350629.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:60744 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753007AbaAGR7B (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2014 12:59:01 -0500
Received: by mail-oa0-f52.google.com with SMTP id o6so563889oag.11
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2014 09:59:01 -0800 (PST)
In-Reply-To: <bfc8635f56992aa8865dc58810a4f9872b3a0c86.1387350629.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

On Wed, Dec 18, 2013 at 8:10 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Prevent build failure when the selected variant does not support GPIO32.
>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>    Move the HAVE_XTENSA_GPIO32 definition to arch/xtensa/Kconfig (Max)
>    Add Max's ack

OK applied this v2 version then, as this is how the xtensa maintainer
want it.

Yours,
Linus Walleij
