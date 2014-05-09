From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/7] gpio: zevio: Make of_device_id array const
Date: Fri, 9 May 2014 11:04:27 +0200
Message-ID: <CACRpkdZMJsF7gmdSepe0MskCXDQrfy8VieLmJ6NMUfQRFuKssQ@mail.gmail.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
	<022d01cf69d3$fcbf5fd0$f63e1f70$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:39102 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbaEIJE2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 05:04:28 -0400
Received: by mail-ob0-f174.google.com with SMTP id uz6so4484770obc.33
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 02:04:28 -0700 (PDT)
In-Reply-To: <022d01cf69d3$fcbf5fd0$f63e1f70$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabian Vogt <fabian@ritter-vogt.de>

On Wed, May 7, 2014 at 11:09 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Make of_device_id array const, because all OF functions
> handle it as const.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied.

Yours,
Linus Walleij
