From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: kempld: Fix autoloading of module
Date: Tue, 22 Apr 2014 23:44:09 +0200
Message-ID: <CACRpkdaT8Z2AGo4dLo923XHO7Ab7sYH4jN-TURKsqVxtGr7T1w@mail.gmail.com>
References: <1397277918.29335.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:44238 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757930AbaDVVoJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 17:44:09 -0400
Received: by mail-oa0-f52.google.com with SMTP id l6so96554oag.11
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 14:44:09 -0700 (PDT)
In-Reply-To: <1397277918.29335.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Michael Brunner <michael.brunner@kontron.com>, Guenter Roeck <linux@roeck-us.net>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Apr 12, 2014 at 6:45 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Make the module alias match the platform device name, so gpio-kempld =
module
> should now autoload correctly.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with G=C3=BCnther's Review tag.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
