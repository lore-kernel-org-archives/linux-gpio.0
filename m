From: Oza Oza <oza.oza@broadcom.com>
Subject: [RFC] drivers/gpio/gpio-pca953x.c broken for PCA9505 ?
Date: Thu, 20 Jul 2017 15:37:10 +0530
Message-ID: <CAMSpPPdvrPfhSEMnzSntaUxt+VUhshYduE0EKvobeh_T1b7a1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f50.google.com ([74.125.83.50]:38660 "EHLO
        mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933887AbdGTKHK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2017 06:07:10 -0400
Received: by mail-pg0-f50.google.com with SMTP id s4so12715637pgr.5
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2017 03:07:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Hi,

Our SOC has PCA9505 IO expander,
Basically I was implementing PCI hotplug, e.g. PCI present lines got
to IO expander.

I had to fix the driver at some places.
but I am not sure, if driver was written considering 9505 chip ?
in fact it declares 9505 as PCA953X_TYPE.

some of the fixes which I have made are

1) #define PCAL953X_INT_MASK       36  (it was 37 before)
pca953x_write_regs_24  has very odd way of calculating register offset.

int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
i2c write to
reg << bank_shift

which was coming 37 << 3 as 0x128 and which is u8 data type.
will address 0x28 which is invalid locaiton.

36 << 3 as 0x120, which will address 0x20 correctly.
although again thsi is odd way of deriving offset.
I am following datasheet:
http://www.nxp.com/docs/en/data-sheet/PCA9505_9506.pdf

2) #define PCAL953X_IN_LATCH       34
above LATCH is not present.

3) #define PCAL953X_INT_STAT       38
above also points to indirect locaiton.

please suggest if this diver was written with 9505 in mind ?

Regards,
Oza.
