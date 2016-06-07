From: Markus Mayer <markus.mayer@broadcom.com>
Subject: Re: [PATCH] gpio: bcm-kona: fix bcm_kona_gpio_reset() warnings
Date: Tue, 7 Jun 2016 09:33:36 -0700
Message-ID: <CAGt4E5tg_e7QD-9X+eCeHhLxovcrs3htWa+Uvb_RXRY7VhAC3Q@mail.gmail.com>
References: <1465316537-8403-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1465316537-8403-1-git-send-email-ben.dooks@codethink.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, Alexandre Courbot <gnurou@gmail.com>, Ray Jui <rjui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On 7 June 2016 at 09:22, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> The bcm_kona_gpio_reset() calls bcm_kona_gpio_write_lock_regs()
> with what looks like the wrong parameter. The write_lock_regs
> function takes a pointer to the registers, not the bcm_kona_gpio
> structure.
>
> Fix the warning, and probably bug by changing the function to
> pass reg_base instead of kona_gpio, fixing the following warning:
>
> drivers/gpio/gpio-bcm-kona.c:550:47: warning: incorrect type in argument 1 (different address spaces)
> drivers/gpio/gpio-bcm-kona.c:550:47:    expected void [noderef] <asn:2>*reg_base
> drivers/gpio/gpio-bcm-kona.c:550:47:    got struct bcm_kona_gpio *kona_gpio
> drivers/gpio/gpio-bcm-kona.c:554:47: warning: incorrect type in argument 1 (different address spaces)
> drivers/gpio/gpio-bcm-kona.c:554:47:    expected void [noderef] <asn:2>*reg_base
> drivers/gpio/gpio-bcm-kona.c:554:47:    got struct bcm_kona_gpio *kona_gpio
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Markus Mayer <mmayer@broadcom.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpio/gpio-bcm-kona.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index 9aabc48..953e4b8 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -547,11 +547,11 @@ static void bcm_kona_gpio_reset(struct bcm_kona_gpio *kona_gpio)
>         /* disable interrupts and clear status */
>         for (i = 0; i < kona_gpio->num_bank; i++) {
>                 /* Unlock the entire bank first */
> -               bcm_kona_gpio_write_lock_regs(kona_gpio, i, UNLOCK_CODE);
> +               bcm_kona_gpio_write_lock_regs(reg_base, i, UNLOCK_CODE);
>                 writel(0xffffffff, reg_base + GPIO_INT_MASK(i));
>                 writel(0xffffffff, reg_base + GPIO_INT_STATUS(i));
>                 /* Now re-lock the bank */
> -               bcm_kona_gpio_write_lock_regs(kona_gpio, i, LOCK_CODE);
> +               bcm_kona_gpio_write_lock_regs(reg_base, i, LOCK_CODE);
>         }
>  }
>
> --
> 2.8.1
>

Looks good. Thanks for fixing this.

Reviewed-by: Markus Mayer <mmayer@broadcom.com>
