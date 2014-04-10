From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zevio: Remove of_match_ptr around zevio_gpio_of_match
Date: Thu, 10 Apr 2014 19:59:06 +0200
Message-ID: <CACRpkdY36mz85o8BMr2bxF1JKw3kWaTc2BRZtM2o0x1iY2xdgA@mail.gmail.com>
References: <1396928689.25334.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:54107 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753244AbaDJR7G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Apr 2014 13:59:06 -0400
Received: by mail-ob0-f169.google.com with SMTP id va2so4854030obc.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 10:59:06 -0700 (PDT)
In-Reply-To: <1396928689.25334.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Gerhard Sittig <gsi@denx.de>, Fabian Vogt <fabian@ritter-vogt.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 8, 2014 at 5:44 AM, Axel Lin <axel.lin@ingics.com> wrote:

> This is a DT-only driver and it will be built only when CONFIG_OF is set.
> So it's pointless to use of_match_ptr.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
