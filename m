From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio-sch: set output level after configuration of direction
Date: Tue, 22 Apr 2014 13:30:38 +0200
Message-ID: <CACRpkdZU5ZpM2qwMCNbE5V2mgYHdpA-ECXckk2Y1sU+w6=7XaQ@mail.gmail.com>
References: <20140327190507.GX3998@book.gsilab.sittig.org>
	<1396873232-19888-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:52343 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932152AbaDVLaj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 07:30:39 -0400
Received: by mail-oa0-f42.google.com with SMTP id i4so5523443oah.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 04:30:38 -0700 (PDT)
In-Reply-To: <1396873232-19888-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Gerhard Sittig <gsi@denx.de>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Apr 7, 2014 at 2:20 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> From: Daniel Krueger <daniel.krueger@systec-electronic.com>
>
> According to the datasheet, writing to the level register has no effect
> when GPIO is programmed as input. Actually the the level register is
> read-only when configured as input. Thus presetting the output level
> before switching to output is _NOT_ possible. Any writes are lost!
> Hence we set the level after configuring the GPIO as output.
> But we cannot prevent a short low pulse if direction is set to high and
> an external  pull-up is connected.
>
> Signed-off-by: Daniel Krueger <daniel.krueger@systec-electronic.com>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> ---
> Changes in v2:
> * Adjusted commited message to make clear that writes are lost when GPIO
> is configured as input.

No further comments, so I have applied this v2 version for v3.16.

Yours,
Linus Walleij
