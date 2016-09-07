From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] soc: fsl/qe: fix gpio save_regs functions
Date: Thu, 8 Sep 2016 00:05:42 +0200
Message-ID: <CACRpkda1vj_BGYP2-4aSS=hcY2jkaaJuY59DOjiSt0JUSgBcBw@mail.gmail.com>
References: <20160905225217.C34571A245A@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20160905225217.C34571A245A@localhost.localdomain>
Sender: stable-owner@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Scott Wood <oss@buserror.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 6, 2016 at 12:52 AM, Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> of_mm_gpiochip_add_data() calls mm_gc->save_regs() before
> setting the data. Therefore ->save_regs() cannot use
> gpiochip_get_data()
>
> An Oops is encountered without this fix.
>
> fixes: 1e714e54b5ca5 ("powerpc: qe_lib-gpio: use gpiochip data pointer")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: <stable@vger.kernel.org>

Aha sorry for my regular screwups. :(
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
