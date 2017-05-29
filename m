From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] powerpc: sysdev: simple_gpio: fix Oops in gpio save_regs function
Date: Mon, 29 May 2017 11:37:48 +0200
Message-ID: <CACRpkdY4Y=Z7BVpeUxhYNdj815HQORo+TzfhbQATtbRMsurQLA@mail.gmail.com>
References: <20170524080156.1C4936EB78@pc13941vm.idsi0.si.c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:36762 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750846AbdE2Jht (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 05:37:49 -0400
Received: by mail-it0-f53.google.com with SMTP id o5so24317420ith.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 02:37:49 -0700 (PDT)
In-Reply-To: <20170524080156.1C4936EB78@pc13941vm.idsi0.si.c-s.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Scott Wood <oss@buserror.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>

On Wed, May 24, 2017 at 10:01 AM, Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> of_mm_gpiochip_add_data() generates an Oops for NULL pointer dereference.
>
> of_mm_gpiochip_add_data() calls mm_gc->save_regs() before
> setting the data, therefore ->save_regs() cannot use gpiochip_get_data()
>
> Fixes: 937daafca774b ("powerpc: simple-gpio: use gpiochip data pointer")
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Sorry for any screwups I've caused...

Yours,
Linus Walleij
