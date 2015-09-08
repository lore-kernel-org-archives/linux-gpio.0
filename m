From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: sx150x: Remove unnecessary MODULE_ALIAS()
Date: Tue, 8 Sep 2015 15:48:31 +0200
Message-ID: <CACRpkdZnWnf7Jzwhrjp6g2kxQjyVQO6w3dHk1NaSnBOkLupPeQ@mail.gmail.com>
References: <1440971924-15571-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36693 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753193AbbIHNsc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 09:48:32 -0400
Received: by oibi136 with SMTP id i136so58991124oib.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 06:48:32 -0700 (PDT)
In-Reply-To: <1440971924-15571-1-git-send-email-javier@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sun, Aug 30, 2015 at 11:58 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:

> The driver has a I2C device id table that is used to create the module
> aliases and also "sx150x" isn't a supported I2C id, so it's never used.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Patch applied.

Yours,
Linus Walleij
