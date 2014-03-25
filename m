From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: moxart: Actually set output state in moxart_gpio_direction_output()
Date: Tue, 25 Mar 2014 13:01:40 +0900
Message-ID: <CAAVeFuKYs71G+sAcCn7yw-TpBxPAQKqTAxAJEUes3JJTu_G01A@mail.gmail.com>
References: <1395715413.12999.0.camel@phoenix> <1395715459.12999.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:49658 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833AbaCYECB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Mar 2014 00:02:01 -0400
Received: by mail-vc0-f176.google.com with SMTP id lc6so6730807vcb.21
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 21:02:00 -0700 (PDT)
In-Reply-To: <1395715459.12999.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonas Jensen <jonas.jensen@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 25, 2014 at 11:44 AM, Axel Lin <axel.lin@ingics.com> wrote:
> moxart_gpio_direction_output() ignored the state passed into it. Fix it.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
