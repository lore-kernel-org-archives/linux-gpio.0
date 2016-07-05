From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "gpiolib: Split GPIO flags parsing and GPIO configuration"
Date: Tue, 5 Jul 2016 08:54:36 +0200
Message-ID: <CACRpkdZFUjFUApC-pZEjw7O54uCeivEvkjEBah_eq1x4nhnv+w@mail.gmail.com>
References: <1467563525-30227-1-git-send-email-johan@kernel.org> <58708801.29lRIIaT3y@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36557 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754336AbcGEGyi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2016 02:54:38 -0400
Received: by mail-oi0-f51.google.com with SMTP id f189so217974579oig.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2016 23:54:37 -0700 (PDT)
In-Reply-To: <58708801.29lRIIaT3y@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jul 4, 2016 at 10:33 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> As we're not dealing with a v4.7 regression that would need to be applied this
> week, can't you propose a proper fix instead of a revert ?

AFAICT the proper fix is to simply move the gpiod_request() sites earlier,
I can propose something if that's all right?

Yours,
Linus Walleij
