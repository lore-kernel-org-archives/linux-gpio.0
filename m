From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: generic: clamp values from bgpio_get_set()
Date: Thu, 17 Dec 2015 09:22:53 +0100
Message-ID: <CACRpkdZ2=5DBFaO7iJivAFCjocUmOwMbFzohL6=n8yjKby-SKg@mail.gmail.com>
References: <1449869778-6974-1-git-send-email-linus.walleij@linaro.org>
	<CAOMZO5DVNm9JK080RQ+OnhtBVyt+VYc5PmdYDUzRnJDBZ+3CEg@mail.gmail.com>
	<CACRpkdb2nv99RN1PGwQx7LxSd1_jn0A5MAB7YGTY5TWm_s7z5A@mail.gmail.com>
	<CAOMZO5D22UWVOr3J-LgwB41w8XJcvyraeKgfvgUpCr1Uv8kL6A@mail.gmail.com>
	<CACRpkdZoz8vM1Jiyn7y39d14ezO4F5PLGXT2S5F8CKbWjAZrAw@mail.gmail.com>
	<20151215170013.GB18302@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35140 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753811AbbLQIWy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2015 03:22:54 -0500
Received: by mail-oi0-f43.google.com with SMTP id l9so10095146oia.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2015 00:22:53 -0800 (PST)
In-Reply-To: <20151215170013.GB18302@kroah.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Fabio Estevam <festevam@gmail.com>, linux-stable@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Tue, Dec 15, 2015 at 6:00 PM, Greg KH <gregkh@linuxfoundation.org> wrote:

> No, please don't.  I do pick up _some_ patches that have "Fixes:" tags
> in them, if they look relevant, and I'm bored at the moment.  Otherwise,
> if you want something in a stable release, put the needed
> "stable@vger.kernel.org" tag in it, that way you know it will go there
> as I know to look for that.

OK! I will be a better person from this day :D

Yours,
Linus Walleij
