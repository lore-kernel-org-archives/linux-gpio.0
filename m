From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Subject: Use of pinctrl-single for external device over I2C
Date: Tue, 23 Jun 2015 16:25:40 +0530
Message-ID: <55893B2C.1070800@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:34978 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932469AbbFWK4E (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2015 06:56:04 -0400
Received: by pdbci14 with SMTP id ci14so4967045pdb.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2015 03:56:04 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

I am working on enabling support for PMIC 88PM860 device in the
mainline.

In 88PM860 (and family of devices) few pins are labelled as GPIO's, to
be precise, in 88PM860, we have 8 GPIO's (ana & dig).


I was looking at pinctrl-single driver, as it seems it can not handle
pinmux configuration of external device (in this case its over I2C), as
it uses raw read/write api's.

I see below lines in the driver,


/*
  * REVISIT: Reads and writes could eventually use regmap or something
  * generic. But at least on omaps, some mux registers are performance
  * critical as they may need to be remuxed every time before and after
  * idle. Adding tests for register access width for every read and
  * write like regmap is doing is not desired, and caching the registers
  * does not help in this case.
  */


Should be not have flag for this and use regmap_ variants? If we
implement flag based approach then same driver can be reused for pinmux
configuration of external device.


Just to give more clarity, Let me describe my use-case below,

The platform which I have is based on PXA1928 and 88PM860 chipsets,
where 88PM860.GPIO_0 is connected back to PXA1928.EXT_32K_IN.

GPIO_0 need to configured in mode '4'.

As per spec, 88PM860.GPIO_0 can be configured to

  000 = GPIO input mode
  001 = GPIO output mode
  010 = SLEEPOUTN mirror mode
  011 = Buck4 FPWM enable
  100 = 32 Khz output buffer mode
  101 = PMICINTN output mode
  110 = HW_RESET1 mode
  111 = HW_RESET2 mode


Please let me know if there is already an alternative for this, which I
missed.

Thanks,
Vaibhav



Thanks,
Vaibhav
