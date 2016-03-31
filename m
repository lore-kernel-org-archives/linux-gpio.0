From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: fix legacy non pinctrl aware builds
Date: Thu, 31 Mar 2016 15:18:10 +0200
Message-ID: <CACRpkdaNfHjfq9MZ9H2qBskKemR_x92VoELKPUptVavCwZedBQ@mail.gmail.com>
References: <1459238640-29243-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33528 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762AbcCaNSL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 09:18:11 -0400
Received: by mail-oi0-f53.google.com with SMTP id d205so59799283oia.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 06:18:10 -0700 (PDT)
In-Reply-To: <1459238640-29243-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Mar 29, 2016 at 10:04 AM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> In legacy pxa builds, ie. non device-tree and platform-data only builds,
> pinctrl is not yet available. As a consequence, the pinctrl gpio
> direction change function is a stub, returning always success.
>
> In the current state, the gpio driver direction function believes the
> pinctrl direction change was successful, and exits without actually
> changing the gpio direction.
>
> This patch changes the logic :
>  - if the pinctrl direction function fails, gpio direction will report
>    that failure
>  - if the pinctrl direction function succeeds, gpio direction is changed
>    by the gpio driver anyway.
>    This is sub optimal in the pinctrl aware case, as the gpio direction
>    will be changed twice: once by pinctrl function and another time by
>    the gpio direction function.
>
> Yet it should be acceptable in this form, as this is functional for all
> pxa platforms (device-tree and platform-data), and moreover changing a
> gpio direction is very very seldom, usually in machine initialization,
> seldom in drivers probe, and an exception for ac97 reset bug.
>
> Fixes: a770d946371e ("gpio: pxa: add pin control gpio direction and request")
> Reported-by: Guenter Roeck <guenter@roeck-us.net>
> Tested-by: Guenter Roeck <guenter@roeck-us.net>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Patch applied for fixes.

Yours,
Linus Walleij
