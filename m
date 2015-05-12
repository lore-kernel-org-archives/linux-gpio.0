From: Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>
Subject: Re: [PATCH] gpio: pinctrl: Initialize Armada-XP GPIO/Pinctrl
 drivers at arch_initcall
Date: Tue, 12 May 2015 22:29:54 +0000
Message-ID: <55527EE1.7010008@alliedtelesis.co.nz>
References: <1431398382-1894-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
 <20150512091815.62249e70@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:40349 "EHLO
	gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753914AbbELWaD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 18:30:03 -0400
In-Reply-To: <20150512091815.62249e70@free-electrons.com>
Content-Language: en-US
Content-ID: <F760180A680DB24C8E78FFA074201665@atlnz.lc>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Fabian Frederick <fabf@skynet.be>, Wolfram Sang <wsa@the-dreams.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>

Hi Thomas,

The driver I'm using that requires access to the GPIO pins is one that 
I've been working on. It doesn't do much, just drives a single reset 
line to take other hardware out of reset.

The hardware that gets taken out of reset includes a few i2c GPIO 
expanders. The GPIO expanders use the gpio-pca953x.c driver, which uses 
subsys_initcall.

One of the things that we found strange: With the code the way it 
currently is, we have access to external GPIO expanders before we were 
able to access the CPUs own built-in GPIO pins.


Thank you,
Joshua Scott

On 12/05/15 19:18, Thomas Petazzoni wrote:
> Dear Joshua Scott,
>
> On Tue, 12 May 2015 14:39:42 +1200, Joshua Scott wrote:
>> The Armada-XP contains a set of GPIO pins. These pins may be used to take
>> other hardware out of reset. However, the drivers used are currently not
>> initialized until quite late in the boot process (module_platform_driver).
>>
>> This patch replaces the use of module_platform_driver with arch_initcall
>> in the two drivers that are used to control the GPIO pins. This allows for
>> drivers using subsys_initcall or later to access to the pins.
>>
>>
>> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
> Thanks for the patch. However, this goes exactly in the opposite
> direction of commit dd640039e8de4135fd59d4d963487d1239d6fabe ("gpio:
> mvebu: Remove initcall-based driver initialization"), which switched
> from postcore_initcall() to module_platform_driver().
>
> Can you describe which drivers registered at subsys_initcall() need
> those GPIOs? We should be able to get around by using deferred probing.
>
> Thanks,
>
> Thomas
