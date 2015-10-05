From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add GPIO support for IT87xx, replacing gpio-it8761e
Date: Mon, 5 Oct 2015 10:31:27 +0200
Message-ID: <CACRpkdbAPKYQtsbhpPHSPJoL_Jp-rkdfKAp0XgTQjyfkjYZRMw@mail.gmail.com>
References: <1442852664-8948-1-git-send-email-vincent.donnefort@seagate.com>
	<1442852664-8948-2-git-send-email-vincent.donnefort@seagate.com>
	<CACRpkdb-DYCxEZGhk1TEjpJRiar5oi=zjmBmmgQie-xr+X+sVg@mail.gmail.com>
	<20151002125455.GE7306@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34633 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462AbbJEIb2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 04:31:28 -0400
Received: by oiev17 with SMTP id v17so86766300oie.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 01:31:27 -0700 (PDT)
In-Reply-To: <20151002125455.GE7306@kw.sim.vm.gnt>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Vincent Donnefort <vdonnefort@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.eu>

On Fri, Oct 2, 2015 at 2:54 PM, Simon Guinot <simon.guinot@sequanux.org=
> wrote:

> This super-I/O device is embedded in a LaCie NAS. The driver has been
> originally written and submitted by Diego Elio Petten=C3=B2. But at t=
he time
> it has not been merged for some reasons. Since we (LaCie) need this
> driver, we are simply taking over the mainline submission work. Some
> fixing and cleaning have been done by Christophe. And now Vincent is
> submitting the driver again. Vincent, Christophe and myself are all
> working for LaCie/Seagate.
>
> I hope this helps to clarify the situation :)

Yup, good work. Consider adding yourself to the MAINTAINERS file,
patches accepted.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
