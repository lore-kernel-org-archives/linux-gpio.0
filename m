From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] pinctrl: Add STM32 MCUs support
Date: Thu, 4 May 2017 09:54:16 +0300
Message-ID: <20170504065416.kpz3xt5lsnxydl6y@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:43178 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751303AbdEDGyb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2017 02:54:31 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mcoquelin.stm32@gmail.com
Cc: linux-gpio@vger.kernel.org, Alexandre TORGUE <alexandre.torgue@st.com>

Hello Maxime Coquelin,

The patch aceb16dc2da5: "pinctrl: Add STM32 MCUs support" from Jan
14, 2016, leads to the following static checker warning:

	drivers/pinctrl/stm32/pinctrl-stm32.c:801 stm32_pconf_parse_conf()
	error: NULL dereference inside function.

drivers/pinctrl/stm32/pinctrl-stm32.c
   615  static int stm32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
   616                          struct pinctrl_gpio_range *range, unsigned gpio,
   617                          bool input)
   618  {
   619          struct stm32_gpio_bank *bank = gpiochip_get_data(range->gc);
                                                                 ^^^^^^^^^
This warning only showed up recently because we changed this line to a
dereference, but it was never valid to pass a NULL range.

   620          int pin = stm32_gpio_pin(gpio);
   621  
   622          stm32_pmx_set_mode(bank, pin, !input, 0);
   623  
   624          return 0;
   625  }

[ snip ]

   768  static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
   769                  unsigned int pin, enum pin_config_param param,
   770                  enum pin_config_param arg)
   771  {
   772          struct pinctrl_gpio_range *range;
   773          struct stm32_gpio_bank *bank;
   774          int offset, ret = 0;
   775  
   776          range = pinctrl_find_gpio_range_from_pin(pctldev, pin);
   777          bank = gpiochip_get_data(range->gc);
   778          offset = stm32_gpio_pin(pin);
   779  
   780          switch (param) {
   781          case PIN_CONFIG_DRIVE_PUSH_PULL:
   782                  stm32_pconf_set_driving(bank, offset, 0);
   783                  break;
   784          case PIN_CONFIG_DRIVE_OPEN_DRAIN:
   785                  stm32_pconf_set_driving(bank, offset, 1);
   786                  break;
   787          case PIN_CONFIG_SLEW_RATE:
   788                  stm32_pconf_set_speed(bank, offset, arg);
   789                  break;
   790          case PIN_CONFIG_BIAS_DISABLE:
   791                  stm32_pconf_set_bias(bank, offset, 0);
   792                  break;
   793          case PIN_CONFIG_BIAS_PULL_UP:
   794                  stm32_pconf_set_bias(bank, offset, 1);
   795                  break;
   796          case PIN_CONFIG_BIAS_PULL_DOWN:
   797                  stm32_pconf_set_bias(bank, offset, 2);
   798                  break;
   799          case PIN_CONFIG_OUTPUT:
   800                  __stm32_gpio_set(bank, offset, arg);
   801                  ret = stm32_pmx_gpio_set_direction(pctldev, NULL, pin, false);
                                                                    ^^^^
A NULL range will Oops.

   802                  break;
   803          default:
   804                  ret = -EINVAL;
   805          }
   806  
   807          return ret;
   808  }

regards,
dan carpenter
