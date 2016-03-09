From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: lp3943: Drop pin_used and lp3943_gpio_request/lp3943_gpio_free
Date: Wed, 9 Mar 2016 09:18:40 +0700
Message-ID: <CACRpkdYXgaTSExJY=MupB=WjTw-O9H7odUDEwHemX_ifhRwsbw@mail.gmail.com>
References: <1456751299.25756.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35462 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766AbcCICSl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 21:18:41 -0500
Received: by mail-ob0-f179.google.com with SMTP id fp4so33366927obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 18:18:41 -0800 (PST)
In-Reply-To: <1456751299.25756.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Milo Kim <milo.kim@ti.com>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 29, 2016 at 8:08 PM, Axel Lin <axel.lin@ingics.com> wrote:

> The implementation of lp3943_gpio_request/lp3943_gpio_free test pin_used
> for tracing the pin usage. However, gpiolib already checks FLAG_REQUESTED
> flag for the same purpose. So remove the redundant implementation.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Nice catch! Thanks for reading through all drivers with this scrutiny,
patch applied.

Yours,
Linus Walleij
