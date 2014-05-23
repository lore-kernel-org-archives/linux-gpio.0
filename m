From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-pch: Fix Kconfig dependencies
Date: Fri, 23 May 2014 13:25:26 +0200
Message-ID: <CACRpkdYMmBCO3h-gdi1RrT8WD=Y_bw52F6g=CYpnXryFFnZdow@mail.gmail.com>
References: <20140516115914.2e250976@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:47173 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750981AbaEWLZ0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 23 May 2014 07:25:26 -0400
Received: by mail-ob0-f180.google.com with SMTP id va2so5228905obc.11
        for <linux-gpio@vger.kernel.org>; Fri, 23 May 2014 04:25:26 -0700 (PDT)
In-Reply-To: <20140516115914.2e250976@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, May 16, 2014 at 11:59 AM, Jean Delvare <jdelvare@suse.de> wrote:

> The gpio-pch driver is for a companion chip to the Intel Atom E600
> series processors. These are 32-bit x86 processors so the driver is
> only needed on X86_32. Add COMPILE_TEST as an alternative, so that the
> driver can still be build-tested elsewhere.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

Patch applied.

Yours,
Linus Walleij
