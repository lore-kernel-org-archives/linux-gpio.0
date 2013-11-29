From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v1 0/9] gpio: davinci: reuse for keystone arch
Date: Fri, 29 Nov 2013 09:37:18 +0100
Message-ID: <CACRpkdYKRWZJm8nRGSHV8DUehd9d0rh6y8R4HMvkimKhWezD2g@mail.gmail.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:36569 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751135Ab3K2IhT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 03:37:19 -0500
Received: by mail-oa0-f47.google.com with SMTP id k1so10147261oag.34
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 00:37:18 -0800 (PST)
In-Reply-To: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>

On Tue, Nov 26, 2013 at 8:40 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> [1] Depends on patch:
> "[PATCH 1/2] gpio: davinci: Fix a check for unbanked gpio"
> https://lkml.org/lkml/2013/11/8/22
>
> [2] and depends on series from Prabhakar Lad:
> "[PATCH v6 0/6] gpio: daVinci: cleanup and feature enhancement"
> https://www.mail-archive.com/devicetree@vger.kernel.org/msg05970.html

So this needs to go through the same tree as these patches.

And I suggested that Sekhar queue them and either take them
directly up to ARM SoC or send me a pull request to take it through
the GPIO tree.

I'm going to go in and review these now...

Yours,
Linus Walleij
