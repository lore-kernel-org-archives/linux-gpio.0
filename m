From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Fix bit masking in Kontron PLD GPIO driver
Date: Fri, 16 Aug 2013 17:09:04 +0200
Message-ID: <CACRpkdYe9+Fb-YO4Mn885YtY_YiRWsG1U+sFXo-poThpDOL1dw@mail.gmail.com>
References: <20130809173326.75aed3b6@mail.gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:43193 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754645Ab3HPPJF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 11:09:05 -0400
Received: by mail-oa0-f51.google.com with SMTP id h1so2371529oag.38
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 08:09:04 -0700 (PDT)
In-Reply-To: <20130809173326.75aed3b6@mail.gmx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Brunner <mibru@gmx.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Kevin Strasser <strassek@engr.orst.edu>, Darren Hart <dvhart@linux.intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Chris Healy <chealy@imsco-us.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Aug 9, 2013 at 5:33 PM, Michael Brunner <mibru@gmx.de> wrote:

> This patch fixes the bit masking within the GPIO driver. The masking =
is
> basically done twice which causes the wrong GPIOs to be addressed.
>
> Signed-off-by: Michael Brunner <michael.brunner@kontron.com>

This looks good but just doesn't apply. Look:

git am --signoff brunner2.patch
Till=E4mpar: gpio: Fix bit masking in Kontron PLD GPIO driver
error: patch misslyckades: drivers/gpio/gpio-kempld.c:46
error: drivers/gpio/gpio-kempld.c: patchen kan inte till=E4mpas

Then:
patch -p1 < brunner2.patch
patching file drivers/gpio/gpio-kempld.c
Hunk #1 FAILED at 46.
Hunk #2 FAILED at 60.
Hunk #3 FAILED at 69.
Hunk #4 FAILED at 80.
Hunk #5 FAILED at 92.
Hunk #6 FAILED at 107.
Hunk #7 FAILED at 122.
7 out of 7 hunks FAILED -- saving rejects to file drivers/gpio/gpio-kem=
pld.c.rej

I think there may be some whitespace mangling in your client
or mail server or whatever.

I had the same problem with the previous patch but hand-coded it
right since it was just a oneline.

Please try to figure out what is causing this.
Consult:
Documentation/email-clients.txt

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
