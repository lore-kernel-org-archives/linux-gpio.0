From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 1/2] gpio: altera-a10sr: Set proper output level for direction_output
Date: Wed, 23 Jan 2019 17:16:31 +0100
Message-ID: <CAMpxmJXQKvbOMaSBzgr-4bv4fO-ObDwZAjexc84-uHvOB2aj1g@mail.gmail.com>
References: <20190123000058.28317-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190123000058.28317-1-axel.lin@ingics.com>
Sender: stable-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thor Thayer <thor.thayer@linux.intel.com>, linux-gpio <linux-gpio@vger.kernel.org>, "Stable # 4 . 20+" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 23 sty 2019 o 01:01 Axel Lin <axel.lin@ingics.com> napisa=C5=82(a=
):
>
> The altr_a10sr_gpio_direction_output should set proper output level
> based on the value argument.
>
> Fixes: 26a48c4cc2f1 ("gpio: altera-a10sr: Add A10 System Resource Chip GP=
IO support.")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> Tested by: Thor Thayer <thor.thayer@linux.intel.com>
> Reviewed by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
> v3: Add Fixes tag and cc stable
> v2: Based on Bartosz's comment to split the patch.
>     1/2 is bug fix
>     2/2 is coding style fix and fix checkpatch warning
>  drivers/gpio/gpio-altera-a10sr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-=
a10sr.c
> index 6b11f1314248..7f9e0304b510 100644
> --- a/drivers/gpio/gpio-altera-a10sr.c
> +++ b/drivers/gpio/gpio-altera-a10sr.c
> @@ -66,8 +66,10 @@ static int altr_a10sr_gpio_direction_input(struct gpio=
_chip *gc,
>  static int altr_a10sr_gpio_direction_output(struct gpio_chip *gc,
>                                             unsigned int nr, int value)
>  {
> -       if (nr <=3D (ALTR_A10SR_OUT_VALID_RANGE_HI - ALTR_A10SR_LED_VALID=
_SHIFT))
> +       if (nr <=3D (ALTR_A10SR_OUT_VALID_RANGE_HI - ALTR_A10SR_LED_VALID=
_SHIFT)) {
> +               altr_a10sr_gpio_set(gc, nr, value);
>                 return 0;
> +       }
>         return -EINVAL;
>  }
>
> --
> 2.17.1
>

Both applied, thanks!

Bart
