From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio-ts5500: Add dependency
Date: Thu, 27 Feb 2014 10:20:08 +0100
Message-ID: <CACRpkdYHkg2hrJ+ChKf-spHsj+7oLDozNvi6Q8AqBRheeN0X6A@mail.gmail.com>
References: <20140214112824.27b98f1d@endymion.delvare>
	<20140214113214.70ed0b65@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f176.google.com ([209.85.128.176]:47277 "EHLO
	mail-ve0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813AbaB0JUJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Feb 2014 04:20:09 -0500
Received: by mail-ve0-f176.google.com with SMTP id cz12so2543526veb.7
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2014 01:20:08 -0800 (PST)
In-Reply-To: <20140214113214.70ed0b65@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>

On Fri, Feb 14, 2014 at 11:32 AM, Jean Delvare <jdelvare@suse.de> wrote:

> There is no point in displaying the TS5500-specific driver entries if
> TS5500 board support itself isn't enabled.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Patch applied.

Yours,
Linus Walleij
