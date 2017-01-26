From: Jean Delvare <jdelvare@suse.de>
Subject: Suspicious debounce handling code in pintctrl-baytrail
Date: Thu, 26 Jan 2017 14:20:20 +0100
Message-ID: <20170126142020.7bfd1229@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42504 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752140AbdAZNUr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Jan 2017 08:20:47 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org

Hi Cristina,

In this commit:

commit 658b476c742fe379e7020309fd590a27b457a4c1
Date:   Fri Apr 1 14:00:07 2016 +0300

    pinctrl: baytrail: Add debounce configuration

you added support for getting and setting debounce configuration for
the Baytrail pins. Now gcc complains about the following:

  CC [M]  drivers/pinctrl/intel/pinctrl-baytrail.o
drivers/pinctrl/intel/pinctrl-baytrail.c: In function ‘byt_pin_config_set’:
drivers/pinctrl/intel/pinctrl-baytrail.c:1181:17: warning: variable ‘debounce’ set but not used [-Wunused-but-set-variable]
  u32 conf, val, debounce;
                 ^

I looked at the code, and it indeed looks wrong. You are reading the
BYT_DEBOUNCE_REG register, clearing the debounce time bits from it, and
then writing the debounce time bits to the *BYT_CONF0_REG* register.
This is certainly corrupting the chip configuration, as the
configuration register bits 2-0 have a completely different meaning
(mux configuration.)

Did you ever test that code?

Additionally, I suspect that in the "get" path, the following is wrong:

	case PIN_CONFIG_INPUT_DEBOUNCE:
		if (!(conf & BYT_DEBOUNCE_EN))
			return -EINVAL;

I'm not familiar with the pinctrl interface but my understanding of
the PIN_CONFIG_INPUT_DEBOUNCE documentation is that the driver must
return 0 if debouncing is disabled. The "set" path would also need to
handle this case properly (setting BYT_DEBOUNCE_EN if debounce timing is
non-zero, clearing it if value is zero.)

-- 
Jean Delvare
SUSE L3 Support
