From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: moxart: Avoid forward declaration
Date: Tue, 25 Mar 2014 13:01:06 +0900
Message-ID: <CAAVeFu+-KViRm5bdMtn9txJMEp-g4reaXCz_0As7KZ5=iO8FAg@mail.gmail.com>
References: <1395715413.12999.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:60578 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833AbaCYEB1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Mar 2014 00:01:27 -0400
Received: by mail-ve0-f177.google.com with SMTP id sa20so6742474veb.36
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 21:01:27 -0700 (PDT)
In-Reply-To: <1395715413.12999.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonas Jensen <jonas.jensen@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 25, 2014 at 11:43 AM, Axel Lin <axel.lin@ingics.com> wrote:
> Slightly adjust the code to avoid forward declaration as we need to call
> moxart_gpio_set() in moxart_gpio_direction_output() to properly set the
> output state.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
