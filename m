From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: timberdale: simplify dependencies
Date: Thu, 10 Apr 2014 19:17:50 +0200
Message-ID: <CACRpkdb3542jPb-3R2X9TYiyuzMvuaVi+q4+eDsJNiRcsB7vWw@mail.gmail.com>
References: <20140403113331.60ec9d4b@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:37766 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758842AbaDJRRv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Apr 2014 13:17:51 -0400
Received: by mail-ob0-f181.google.com with SMTP id wp4so4793634obc.12
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 10:17:51 -0700 (PDT)
In-Reply-To: <20140403113331.60ec9d4b@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Thu, Apr 3, 2014 at 11:33 AM, Jean Delvare <jdelvare@suse.de> wrote:

> GPIO_TIMBERDALE doesn't need an explicit dependency on HAS_IOMEM,
> because it depends on MFD_TIMBERDALE which itself depends on
> HAS_IOMEM already.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

True. Patch applied.

Yours,
Linus Walleij
