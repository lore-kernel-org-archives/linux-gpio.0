From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Thu, 2 Jan 2014 13:33:38 +0100
Message-ID: <CACRpkdYvnxy6sXN78PfDwnm1J6dQB5GPPr6q-Pz2LZqgKVStbw@mail.gmail.com>
References: <bfc8635f56992aa8865dc58810a4f9872b3a0c86.1387350629.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:47531 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751365AbaABMdi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 07:33:38 -0500
Received: by mail-oa0-f46.google.com with SMTP id o6so14691786oag.19
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 04:33:38 -0800 (PST)
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

See my comments on v1 and fix them.

Yours,
Linus Walleij
