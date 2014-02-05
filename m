From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: clps711x: Add module alias to support module auto loading
Date: Wed, 5 Feb 2014 11:05:25 +0100
Message-ID: <CACRpkdYBsTyzKhbTA61dMJnV-V5n+jCucqGvcSyJtgUSsREtsg@mail.gmail.com>
References: <1391506755.21056.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:53802 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356AbaBEKF0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 05:05:26 -0500
Received: by mail-ob0-f170.google.com with SMTP id va2so165673obc.29
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 02:05:26 -0800 (PST)
In-Reply-To: <1391506755.21056.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 4, 2014 at 10:39 AM, Axel Lin <axel.lin@ingics.com> wrote:

> commit 55fe14ab872a "GPIO: clps711x: Rewrite driver for using generic GPIO code"
> allows this driver to be built as a module.
> Thus add module alias to support module auto loading.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

However I've never really understood how the alias is actually used
during module loading. Where can I learn more about this?

Yours,
Linus Walleij
