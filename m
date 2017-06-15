From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: gpio-crystalcove: Skip IRQ CTRL register
 update for virtual GPIOs
Date: Thu, 15 Jun 2017 12:19:46 +0300
Message-ID: <CAHp75VdVmAPTP5k_U+=EvBqysGz0Jk9YoytFMTSA_1T-tmVvZw@mail.gmail.com>
References: <5fabde8f9366fce42b5f361f3472bc91754ca7db.1497482431.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5fabde8f9366fce42b5f361f3472bc91754ca7db.1497482431.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2017 at 2:21 AM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> Commit 9a752b4c9ab9 ("gpio: crystalcove: Do not write regular gpio
> registers for virtual GPIOs") added support to skip GPIO register
> update for virtual GPIOs, but it missed to add skip logic in
> crystalcove_update_irq_ctrl() function. This patch fixes it.

> @@ -134,6 +134,9 @@ static void crystalcove_update_irq_ctrl(struct crystalcove_gpio *cg, int gpio)
>  {
>         int reg = to_reg(gpio, CTRL_IN);
>
> +       if (reg < 0)
> +               return;
> +
>         regmap_update_bits(cg->regmap, reg, CTLI_INTCNT_BE, cg->intcnt_value);
>  }

Shouldn't it have been done using irq_valid_mask flag in the first place?

-- 
With Best Regards,
Andy Shevchenko
