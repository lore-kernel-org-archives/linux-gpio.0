From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] pinctrl: activate pxa architecture
Date: Thu, 10 Dec 2015 16:14:55 +0100
Message-ID: <CACRpkdZyAqfCcaPWZ0RKxcPEYNJ_BxTe9SHV6FdT6x9rygHEEw@mail.gmail.com>
References: <1448129093-20722-1-git-send-email-robert.jarzmik@free.fr>
	<1448129093-20722-7-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33268 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753698AbbLJPO4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 10:14:56 -0500
Received: by oixx65 with SMTP id x65so47999021oix.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 07:14:56 -0800 (PST)
In-Reply-To: <1448129093-20722-7-git-send-email-robert.jarzmik@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Nov 21, 2015 at 7:04 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> As the pxa architecture, at least for pxa27x, supports pin control,
> activate it in the pinctrl tree.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

All 6 patches applied. I can see that you know what you're doing
so let's go ahead with this driver. Any issues can be patched
up later.

Yours,
Linus Walleij
