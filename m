From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] drivers/gpio/gpio-sch311x: check return value of gpiochip_remove()
Date: Sun, 6 Jul 2014 18:22:48 +0900
Message-ID: <CAAVeFuK8oQStjAozf_3e3YTWBx3JYzBxEvLUq6n6uke1qaxXvg@mail.gmail.com>
References: <1404457379-4193-1-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:42491 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbaGFJXJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Jul 2014 05:23:09 -0400
In-Reply-To: <1404457379-4193-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Varka Bhadram <varkab@cdac.in>

On Fri, Jul 4, 2014 at 4:02 PM, Varka Bhadram <varkabhadram@gmail.com> =
wrote:
> This patch eliminates the following warning
>
> drivers/gpio/gpio-sch311x.c: In function =E2=80=98sch311x_gpio_probe=E2=
=80=99:
> drivers/gpio/gpio-sch311x.c:286:18: warning: ignoring return value of=
 =E2=80=98gpiochip_remove=E2=80=99, declared with attribute warn_unused=
_result

gpiochip_remove() is to have its return value set to void in another
patch, so I'm not sure we need this one in the meantime?
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
