From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: Add helpers for optional GPIOs
Date: Fri, 9 May 2014 13:50:18 +0200
Message-ID: <CACRpkdaGHviAXxLYcsMu2Jc+3zE_Wmm275YGYEo=U7CNk8dzUg@mail.gmail.com>
References: <1398438606-19718-1-git-send-email-thierry.reding@gmail.com>
	<1398438606-19718-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:48248 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752858AbaEILuS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 07:50:18 -0400
Received: by mail-oa0-f54.google.com with SMTP id j17so4724842oag.13
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 04:50:18 -0700 (PDT)
In-Reply-To: <1398438606-19718-2-git-send-email-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Apr 25, 2014 at 5:10 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Introduce gpiod_get_optional() and gpiod_get_index_optional() helpers
> that make it easier for drivers to handle optional GPIOs.

Excellent Thierry, patch applied with Alexandre's review tag.

Can you *please* also produce a patch to
Documentation/gpio/consumer.txt
explaining the new interface to potential users?

Yours,
Linus Walleij
