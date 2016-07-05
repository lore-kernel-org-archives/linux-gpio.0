From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "gpiolib: Split GPIO flags parsing and GPIO configuration"
Date: Tue, 5 Jul 2016 15:50:52 +0200
Message-ID: <CACRpkdZQnQEZmvtadVZUE8_XN-w0zrk+aTKvFC-fyA3wrirTmg@mail.gmail.com>
References: <1467563525-30227-1-git-send-email-johan@kernel.org>
 <58708801.29lRIIaT3y@avalon> <CACRpkdZFUjFUApC-pZEjw7O54uCeivEvkjEBah_eq1x4nhnv+w@mail.gmail.com>
 <20160705091220.GC17168@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33754 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448AbcGENux (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2016 09:50:53 -0400
Received: by mail-oi0-f43.google.com with SMTP id u201so229504455oie.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jul 2016 06:50:53 -0700 (PDT)
In-Reply-To: <20160705091220.GC17168@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 5, 2016 at 11:12 AM, Johan Hovold <johan@kernel.org> wrote:

> Your call. :)

The patch is on my fixes branch and will go to Torvalds
by the end of the week unless I'm convinced otherwise ...

It turns out the patch is very isolated and doesn't collide with
any gpio development since 4.4 (which is impressive in itself)
so reverting is not a problem at all, as I thought earlier.

Yours,
Linus Walleij
