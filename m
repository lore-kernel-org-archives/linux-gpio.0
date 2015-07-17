From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio/davinci: add interrupt support for GPIOs 16-31
Date: Fri, 17 Jul 2015 14:16:19 +0200
Message-ID: <CACRpkdb0ORjwAyA5r4khK0Xa3_N0vpRjrXq76pe+GTFjLux+2w@mail.gmail.com>
References: <1435861890-23147-1-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35311 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbbGQMQT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 08:16:19 -0400
Received: by oihq81 with SMTP id q81so69410526oih.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 05:16:19 -0700 (PDT)
In-Reply-To: <1435861890-23147-1-git-send-email-vitalya@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vitaly Andrianov <vitalya@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Muralidharan Karicheri <m-karicheri2@ti.com>

On Thu, Jul 2, 2015 at 8:31 PM, Vitaly Andrianov <vitalya@ti.com> wrote:

> Interrupts for GPIOs 16 through 31 are enabled by bit 1 in the
> "binten" register (offset 8). Previous versions of GPIO only
> used bit 0, which enables GPIO 0-15 interrupts.
>
> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
> History
>
> v2.
> - use GENMASK to set binten. Thanks to Nori Sekhar's.

This version applied for v4.3 with Sekhar's review tag.

Yours,
Linus Walleij
