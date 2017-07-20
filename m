From: Phil Reid <preid@electromag.com.au>
Subject: Re: [RFC] drivers/gpio/gpio-pca953x.c broken for PCA9505 ?
Date: Thu, 20 Jul 2017 20:46:30 +0800
Message-ID: <31ff335a-5ca4-4893-543f-16a7be743230@electromag.com.au>
References: <CAMSpPPdvrPfhSEMnzSntaUxt+VUhshYduE0EKvobeh_T1b7a1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:60356 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S933994AbdGTMqf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2017 08:46:35 -0400
In-Reply-To: <CAMSpPPdvrPfhSEMnzSntaUxt+VUhshYduE0EKvobeh_T1b7a1Q@mail.gmail.com>
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Oza Oza <oza.oza@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

G'day Oza,

On 20/07/2017 18:07, Oza Oza wrote:
> Hi,
> 
> Our SOC has PCA9505 IO expander,
> Basically I was implementing PCI hotplug, e.g. PCI present lines got
> to IO expander.
> 
> I had to fix the driver at some places.
> but I am not sure, if driver was written considering 9505 chip ?
> in fact it declares 9505 as PCA953X_TYPE.
> 
> some of the fixes which I have made are
> 
> 1) #define PCAL953X_INT_MASK       36  (it was 37 before)
This looks to be for PCA_PCAL flaged devices only.
The pca9505 is not one of these.

The following address calcs are for the wrong chip type.

> pca953x_write_regs_24  has very odd way of calculating register offset.
> 
> int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> i2c write to
> reg << bank_shift
> 
> which was coming 37 << 3 as 0x128 and which is u8 data type.
> will address 0x28 which is invalid locaiton.
> 
> 36 << 3 as 0x120, which will address 0x20 correctly.
> although again thsi is odd way of deriving offset.
> I am following datasheet:
> http://www.nxp.com/docs/en/data-sheet/PCA9505_9506.pdf
> 
> 2) #define PCAL953X_IN_LATCH       34
> above LATCH is not present.
> 
> 3) #define PCAL953X_INT_STAT       38
> above also points to indirect locaiton.
> 
> please suggest if this diver was written with 9505 in mind ?

The driver looks fine for pca9505 without interrupt support.
I think it needs modification to enable irq's for the 9505.
Which would new define like
#define PCA953X_MASK	4

and some logic to set it pca953x_irq_bus_sync_unlock() I think.



-- 
Regards
Phil Reid
