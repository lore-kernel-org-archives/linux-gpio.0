From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 0/9] ARM: sa1100: Rework IRQ handling
Date: Wed, 20 Nov 2013 04:45:40 +0400
Message-ID: <CALT56yP-LsO_8qgpa3R6JQSWW2pGkNWBUtab8L2hQnC5UdoKvQ@mail.gmail.com>
References: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com>
	<CACRpkdZU3_EqhBjV68+okJwh7QONuxWVjKkrUO4PkwJhKrP+mQ@mail.gmail.com>
	<528B811A.1030501@gmail.com>
	<CACRpkdbgn22xDX4nJZSDSE9-h+u1j5DQt=8arO7oS-UCBdBMUQ@mail.gmail.com>
	<20131120002007.GR16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:43768 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752152Ab3KTApk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 19:45:40 -0500
Received: by mail-ie0-f181.google.com with SMTP id e14so5870301iej.12
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 16:45:40 -0800 (PST)
In-Reply-To: <20131120002007.GR16735@n2100.arm.linux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dmitry Artamonow <mad_soft@inbox.ru>

On Wed, Nov 20, 2013 at 4:20 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> Also note that we _do_ have sa11x0 platforms which request their GPIOs
> in their arch_initcall callback, so the sa11x0 GPIO driver better be
> around at that point otherwise things *will* fail.

Which ones if you have them in your mind?

> I suspect that means the SA11x0 GPIO driver must be initialised early.

Anyway in these patches gpio-sa1100 driver is registered at postcore
initcall, so gpios should
be available before arch_initcall functions.


-- 
With best wishes
Dmitry
