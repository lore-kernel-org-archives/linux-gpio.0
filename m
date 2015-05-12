From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-kempld: Fix get_direction return value
Date: Tue, 12 May 2015 13:50:26 +0200
Message-ID: <CACRpkdaXBjvdi+-Lbtibgdi1vRjSfgKzb+8Y+6Wk0YE=CcFz_Q@mail.gmail.com>
References: <20150511124649.1221e86e@hyperion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35088 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932375AbbELLu1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 07:50:27 -0400
Received: by oign205 with SMTP id n205so3429929oig.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 04:50:26 -0700 (PDT)
In-Reply-To: <20150511124649.1221e86e@hyperion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Brunner <mibru@gmx.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jochen Henneberg <jh@henneberg-systemdesign.com>, Michael Brunner <michael.brunner@kontron.com>, Darren Hart <dvhart@linux.intel.com>, Kevin Strasser <kevin.strasser@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>

On Mon, May 11, 2015 at 12:46 PM, Michael Brunner <mibru@gmx.de> wrote:

> This patch fixes an inverted return value of the gpio get_direction
> function.
>
> The wrong value causes the direction sysfs entry and GPIO debugfs file
> to indicate incorrect GPIO direction settings. In some cases it also
> prevents setting GPIO output values.
>
> The problem is also present in all other stable kernel versions since
> linux-3.12.
>
> Reported-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
> Signed-off-by: Michael Brunner <michael.brunner@kontron.com>

Patch applied and tagged for stable v3.12+

Yours,
Linus Walleij
