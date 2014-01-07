From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: fix/clarify gpiod_direction_output comment
Date: Tue, 7 Jan 2014 19:39:23 +0900
Message-ID: <CAAVeFuLVnETMx1b1wav-aSOR3YmjOdpki3HAVcuGTaYJg+wt=w@mail.gmail.com>
References: <1389089274-26861-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f180.google.com ([209.85.128.180]:59279 "EHLO
	mail-ve0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751068AbaAGKjn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2014 05:39:43 -0500
Received: by mail-ve0-f180.google.com with SMTP id jz11so10136675veb.11
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2014 02:39:43 -0800 (PST)
In-Reply-To: <1389089274-26861-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 7, 2014 at 7:07 PM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> This corrects the gpiod_direction_output description comment
> and adds clarification about the value parameter being a raw
> value, not taking into account ACTIVE_LOW status.

Mmm, that's something I must have missed. I'd say
gpiod_direction_output() should on the contrary honor the ACTIVE_LOW
flag, and maybe we should also have gpiod_direction_output_raw() to
allow control of the raw value?
