From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mvebu: Remove initcall-based driver initialization
Date: Fri, 9 May 2014 11:09:40 +0200
Message-ID: <CACRpkdbXq_0C-d+uJ8yz8esHDvmY4A+MM8XE4G2TKFpbdKTBNw@mail.gmail.com>
References: <1398372890-7568-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:54373 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751978AbaEIJJk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 05:09:40 -0400
Received: by mail-oa0-f53.google.com with SMTP id m1so4433093oag.26
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 02:09:40 -0700 (PDT)
In-Reply-To: <1398372890-7568-1-git-send-email-ezequiel.garcia@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>

On Thu, Apr 24, 2014 at 10:54 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:

> There's no reason to use an initcall to initialize this driver,
> and regular module_platform_driver() can be used instead.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Has anyone tested this on real hardware? That is the only test that
counts on initcalls as it happens.

That said, patch is tentatively applied as I guess you have the hardware.

Yours,
Linus Walleij
