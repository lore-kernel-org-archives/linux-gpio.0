From: Kun Yi <kunyi@google.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: modify NPCM7xx pin configuration function
Date: Wed, 7 Nov 2018 11:51:37 -0800
Message-ID: <CAGMNF6Vn1J3eo529zPqAHeD+CfZFUHE2T8ZJK71EA2EN=j7mnQ@mail.gmail.com>
References: <20181107134434.354795-1-tmaimon77@gmail.com> <20181107134434.354795-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107134434.354795-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tmaimon77@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Benjamin Fair <benjaminfair@google.com>, Brendan Higgins <brendanhiggins@google.com>, avifishman70@gmail.com, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 7, 2018 at 5:44 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Modify GPIO direction setting in pin configuration function by using
> generic GPIO functions to set the GPIO direction instead of direct
> access to the GPIO direction register.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Tested-by: Kun Yi <kunyi@google.com>

Thanks for sending the patch Tomer!
> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> index 7ad50d9268aa..b455209382a5 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -1799,19 +1799,12 @@ static int npcm7xx_config_set_one(struct npcm7xx_pinctrl *npcm,
>                 npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_PU, gpio);
>                 break;
>         case PIN_CONFIG_INPUT_ENABLE:
> -               if (arg) {
> -                       iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
> -                       npcm_gpio_set(&bank->gc, bank->base + NPCM7XX_GP_N_IEM,
> -                                     gpio);
> -               } else
> -                       npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_IEM,
> -                                     gpio);
> +               iowrite32(gpio, bank->base + NPCM7XX_GP_N_OEC);
> +               bank->direction_input(&bank->gc, pin % bank->gc.ngpio);
>                 break;
>         case PIN_CONFIG_OUTPUT:
> -               npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_IEM, gpio);
> -               iowrite32(gpio, arg ? bank->base + NPCM7XX_GP_N_DOS :
> -                         bank->base + NPCM7XX_GP_N_DOC);
>                 iowrite32(gpio, bank->base + NPCM7XX_GP_N_OES);
> +               bank->direction_output(&bank->gc, pin % bank->gc.ngpio, arg);
>                 break;
>         case PIN_CONFIG_DRIVE_PUSH_PULL:
>                 npcm_gpio_clr(&bank->gc, bank->base + NPCM7XX_GP_N_OTYP, gpio);
> --
> 2.14.1
>


--
Regards,
Kun
