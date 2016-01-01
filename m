From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 13/54] gpio: pcf857x: Be sure to clamp return value
Date: Fri, 1 Jan 2016 18:06:34 +0100
Message-ID: <CACRpkdY3OO1rHxPf7yZQkNAtHnZzKPAa8wWHwO4HtC95ds__Jg@mail.gmail.com>
References: <1450794009-22885-1-git-send-email-linus.walleij@linaro.org>
	<11897257.suvtS8Wvz6@avalon>
	<567F3258.7020003@mentor.com>
	<4184910.enE8aZKjEM@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:33500 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751922AbcAARGf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jan 2016 12:06:35 -0500
Received: by mail-ob0-f174.google.com with SMTP id bx1so185619335obb.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jan 2016 09:06:35 -0800 (PST)
In-Reply-To: <4184910.enE8aZKjEM@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, George Cherian <george.cherian@ti.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

On Sun, Dec 27, 2015 at 8:47 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> Would something like the following make sense ?
>
>         value = chip->get ? chip->get(chip, offset) : -EIO;
>         value = IS_ERR_VALUE(value) ? value : !!value;

Yeah that makes sense, I didn't think about using IS_ERR_VALUE()
to mitigate the situation.

Patches welcome :)

> Granted, GPIO drivers would still need to make sure that the value they return
> from register reads don't get considered as an error code, but any val & (1 <<
> offset) would be fine, which is the most common case.
>
> If you still think that patching all GPIO drivers is better I won't oppose to
> that.

I have already patches all the drivers with this problem, merged the
larger part of it and will merge the remainders for v4.6. The above is
still more elegant than the code we have so I'd take it to put some
nice robustness icing on top...

Yours,
Linus Walleij
