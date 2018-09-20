From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] pinctrl: mediatek: add eint support to MT8183 pinctrl
 driver
Date: Thu, 20 Sep 2018 22:53:38 +0300
Message-ID: <20180920195338.GA31947@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hello Sean Wang,

The patch 6561859b067f: "pinctrl: mediatek: add eint support to
MT8183 pinctrl driver" from Sep 8, 2018, leads to the following
static checker warning:

	drivers/pinctrl/mediatek/pinctrl-paris.c:732 mtk_gpio_to_irq()
	warn: impossible condition '(desc->eint.eint_n == -1) => (0-u16max == (-1))'

drivers/pinctrl/mediatek/pinctrl-paris.c
   722  static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
   723  {
   724          struct mtk_pinctrl *hw = gpiochip_get_data(chip);
   725          const struct mtk_pin_desc *desc;
   726  
   727          if (!hw->eint)
   728                  return -ENOTSUPP;
   729  
   730          desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
   731  
   732          if (desc->eint.eint_n == EINT_NA)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Do you want to define EINT_NA as 0xffff maybe?

   733                  return -ENOTSUPP;
   734  
   735          return mtk_eint_find_irq(hw->eint, desc->eint.eint_n);
   736  }

See also:

drivers/pinctrl/mediatek/pinctrl-paris.c:749 mtk_gpio_set_config() warn: impossible condition '(desc->eint.eint_n == -1) => (0-u16max == (-1))'
drivers/pinctrl/mediatek/pinctrl-moore.c:479 mtk_gpio_to_irq() warn: impossible condition '(desc->eint.eint_n == -1) => (0-u16max == (-1))'
drivers/pinctrl/mediatek/pinctrl-moore.c:496 mtk_gpio_set_config() warn: impossible condition '(desc->eint.eint_n == -1) => (0-u16max == (-1))'

regards,
dan carpenter
