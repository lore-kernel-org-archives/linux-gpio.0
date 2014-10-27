From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] MIPS: ralink: we require gpiolib
Date: Mon, 27 Oct 2014 17:42:33 +0100
Message-ID: <CACRpkdZmf6q5apZAYGtjO_GeG-BRBzTOKa53vi3J_5riqrN-zQ@mail.gmail.com>
References: <1412972930-16777-1-git-send-email-blogic@openwrt.org>
	<1412972930-16777-5-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:64820 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362AbaJ0Qme (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Oct 2014 12:42:34 -0400
Received: by mail-ie0-f173.google.com with SMTP id tr6so4686910ieb.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2014 09:42:33 -0700 (PDT)
In-Reply-To: <1412972930-16777-5-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Oct 10, 2014 at 10:28 PM, John Crispin <blogic@openwrt.org> wrote:

> Select ARCH_REQUIRE_GPIOLIB by default when building a kernel for RALINK.
>
> Signed-off-by: John Crispin <blogic@openwrt.org>

Happy with selecting this, but don't think you need the altered
mach gpio.h header. Do like x86 does.

Yours,
Linus Walleij
