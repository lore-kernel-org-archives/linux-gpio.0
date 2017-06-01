From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: powerpc: sysdev: simple_gpio: fix Oops in gpio save_regs function
Date: Thu,  1 Jun 2017 23:31:08 +1000 (AEST)
Message-ID: <3wdpC036qdz9sCX@ozlabs.org>
References: <20170524080156.1C4936EB78@pc13941vm.idsi0.si.c-s.fr>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20170524080156.1C4936EB78@pc13941vm.idsi0.si.c-s.fr>
Sender: stable-owner@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 2017-05-24 at 08:01:55 UTC, Christophe Leroy wrote:
> of_mm_gpiochip_add_data() generates an Oops for NULL pointer dereference.
> 
> of_mm_gpiochip_add_data() calls mm_gc->save_regs() before
> setting the data, therefore ->save_regs() cannot use gpiochip_get_data()
> 
> Fixes: 937daafca774b ("powerpc: simple-gpio: use gpiochip data pointer")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/6f553912eedafae13ff20b322a65e4

cheers
