From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH] gpio: Mark xtensa gpio driver as BROKEN
Date: Tue, 25 Feb 2014 08:34:52 +0400
Message-ID: <CAMo8BfKVuKh11xa6+Aom3OP8BPYWjp_yJhV-bGpwkjEK4rDS7g@mail.gmail.com>
References: <1393301148-5167-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:39142 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752314AbaBYEex (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 23:34:53 -0500
Received: by mail-oa0-f47.google.com with SMTP id h16so3058549oag.34
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 20:34:52 -0800 (PST)
In-Reply-To: <1393301148-5167-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chris Zankel <chris@zankel.net>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

On Tue, Feb 25, 2014 at 8:05 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> xtensa:allmodconfig build fails with
>
> drivers/gpio/gpio-xtensa.c: Assembler messages:
> drivers/gpio/gpio-xtensa.c:87: Error: unknown opcode or format name 'read_impwire'
> drivers/gpio/gpio-xtensa.c:110: Error: unknown opcode or format name 'rur.expstate'
> drivers/gpio/gpio-xtensa.c:124: Error: unknown opcode or format name 'wrmsk_expstate'
>
> Tests with various compiler versions was unsuccessful, suggesting that the
> assembler instructions may only be available with some unspecified xtensa
> variant. Until that is resolved, mark the driver as broken to enable test
> builds.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I know this is likely controversial, but it seems to be better than letting
> builds fail. And maybe it causes a real fix to be submitted.

The fix is on the way:
http://lists.linux-xtensa.org/pipermail/linux-xtensa/Week-of-Mon-20140203/001584.html

-- 
Thanks.
-- Max
