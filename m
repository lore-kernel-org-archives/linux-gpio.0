From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: safer implementation of desc_to_gpio()
Date: Fri, 11 Oct 2013 16:25:14 +0200
Message-ID: <CACRpkdb=rEiXJqnkS8mQeo1gO3r7r8GYCNmopsjh9iDC4HagvQ@mail.gmail.com>
References: <1380909598-6382-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:37931 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754354Ab3JKOZP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 10:25:15 -0400
Received: by mail-ie0-f181.google.com with SMTP id tp5so8212462ieb.40
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 07:25:15 -0700 (PDT)
In-Reply-To: <1380909598-6382-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Oct 4, 2013 at 7:59 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> The current implementation of desc_to_gpio() relies on the chip pointer
> to be set to a valid value in order to compute the GPIO number. This
> was done in the hope that we can get rid of the gpio_desc global array,
> but this is not happening anytime soon.
>
> This patch reimplements desc_to_gpio() in a fashion similar to that of
> gpio_to_desc(). As a result, desc_to_gpio(gpio_to_desc(gpio)) == gpio is
> now always true. This allows to call desc_to_gpio() on non-initialized
> descriptors as some error-handling code currently does.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reported-by: Dr. H. Nikolaus Schaller <hns@goldelico.com>

Patch applied.

Yours,
Linus Walleij
