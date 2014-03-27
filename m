From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] gpio: moxart: Avoid forward declaration
Date: Thu, 27 Mar 2014 10:18:23 +0100
Message-ID: <CACRpkdb3Gv25NabRA6xGKyXk5zB_20XtL1KJHJXs_3WEXJjiRA@mail.gmail.com>
References: <1395715413.12999.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:51196 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754638AbaC0JSZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Mar 2014 05:18:25 -0400
Received: by mail-ob0-f169.google.com with SMTP id va2so3949520obc.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2014 02:18:24 -0700 (PDT)
In-Reply-To: <1395715413.12999.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 25, 2014 at 3:43 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Slightly adjust the code to avoid forward declaration as we need to call
> moxart_gpio_set() in moxart_gpio_direction_output() to properly set the
> output state.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

 Nice cleanup, patch applied with Alexandre's review tag.

Yours,
Linus Walleij
