From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: menz127: Drop *mdev field from struct men_z127_gpio
Date: Tue, 22 Mar 2016 11:32:48 +0100
Message-ID: <CACRpkdY523vVGtmwJ-hWWMNWLx2GRbmwKyXUcAdJ8_iueyueAg@mail.gmail.com>
References: <1457527135.720.1.camel@ingics.com>
	<1457527197.720.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33493 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752822AbcCVKct (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 06:32:49 -0400
Received: by mail-oi0-f53.google.com with SMTP id d205so167889579oia.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 03:32:48 -0700 (PDT)
In-Reply-To: <1457527197.720.2.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Andreas Werner <andreas.werner@men.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 9, 2016 at 1:39 PM, Axel Lin <axel.lin@ingics.com> wrote:

> No need to store *medv in struct men_z127_gpio.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied for v4.7.

Yours,
Linus Walleij
