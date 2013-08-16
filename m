From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-pca953x: Fix read for chips with more than 8 gpios
Date: Fri, 16 Aug 2013 17:21:18 +0200
Message-ID: <CACRpkdbOPL7K2yc_zAo0-b-Y0mXCRXJfc7YYDhcb0K3uj76BBQ@mail.gmail.com>
References: <1376490038-32382-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:52015 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755048Ab3HPPVS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 11:21:18 -0400
Received: by mail-oa0-f51.google.com with SMTP id h1so2389579oag.38
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 08:21:18 -0700 (PDT)
In-Reply-To: <1376490038-32382-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Ruder <andy@aeruder.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>

On Wed, Aug 14, 2013 at 4:20 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> pca953x_read_single returns ONLY the value of the 8 inputs of the
> same bank.
>
> off can have a value from 0 to 15, therefore we have to find the
> offset of that gpio within that bank.
>
> Without this patch gpios 8-15 will always be read as zero.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Nice! But it turns out I already had an identical patch by
Andrew Ruder acked by Gregory Clement in my patch queue.

Yours,
Linus Walleij
