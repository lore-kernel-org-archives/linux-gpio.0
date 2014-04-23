From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: rdc321x: Convert to use devm_kzalloc
Date: Wed, 23 Apr 2014 15:27:29 +0200
Message-ID: <CACRpkdYE-kCmHaX+SHXVWZQGodYoELEJ3pUfg=Ueq0p6v-_bhg@mail.gmail.com>
References: <1397196885.12922.2.camel@phoenix>
	<1397196961.12922.4.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:65123 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754017AbaDWN13 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 09:27:29 -0400
Received: by mail-ob0-f178.google.com with SMTP id wn1so997263obc.37
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 06:27:29 -0700 (PDT)
In-Reply-To: <1397196961.12922.4.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <florian@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 11, 2014 at 8:16 AM, Axel Lin <axel.lin@ingics.com> wrote:

> This saves a few unwind code.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Florian's ACK.

Yours,
Linus Walleij
