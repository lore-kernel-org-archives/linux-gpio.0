From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] gpio: moxart: Actually set output state in moxart_gpio_direction_output()
Date: Thu, 27 Mar 2014 10:19:52 +0100
Message-ID: <CACRpkdaDLJgnE+VtOA2maC6OqEeG5K5Qs4-cXG6HxcL1MiaVCg@mail.gmail.com>
References: <1395715413.12999.0.camel@phoenix>
	<1395715459.12999.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:40816 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754844AbaC0JTx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Mar 2014 05:19:53 -0400
Received: by mail-oa0-f41.google.com with SMTP id j17so4085895oag.28
        for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2014 02:19:52 -0700 (PDT)
In-Reply-To: <1395715459.12999.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 25, 2014 at 3:44 AM, Axel Lin <axel.lin@ingics.com> wrote:

> moxart_gpio_direction_output() ignored the state passed into it. Fix it.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied unless the moxart people start complaining.

Yours,
Linus Walleij
