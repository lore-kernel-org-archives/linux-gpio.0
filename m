From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PROBLEM] gpio: hog: requesting hog failed
Date: Fri, 16 Oct 2015 17:13:03 +0200
Message-ID: <CACRpkdZDi_Kjn+WJ1Jd+oxBLXqYth7t5xL9sZ8wL03hkQorWZg@mail.gmail.com>
References: <561661BB.70207@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35890 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751401AbbJPPNE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 11:13:04 -0400
Received: by oiao187 with SMTP id o187so8683954oia.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 08:13:03 -0700 (PDT)
In-Reply-To: <561661BB.70207@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>, Alexander Stein <alexander.stein@systec-electronic.com>, Alexander Stein <alexanders83@web.de>, Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "plagnioj@jcrosoft.com >> Jean-Christophe Plagniol-Villard" <plagnioj@jcrosoft.com>

On Thu, Oct 8, 2015 at 2:29 PM, Ji=C5=99=C3=AD Prchal <jiri.prchal@aksi=
gnal.cz> wrote:

> Hi everybody,
> I've just tried new gpio hog functionality, but maybe I misunderstand
> something
> or I'm doing something wrong?
> Can someone help me with it, please?

Sometimes this has something to do with driver probe order.
=46or example if the driver uses a pin control backend to the GPIO,
it will not be able to request its own GPIOs until after both drivers
have probed.

You need to talk to the maintainers of this driver, J-C, Alexander
Stein, Nicolas Ferre.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
