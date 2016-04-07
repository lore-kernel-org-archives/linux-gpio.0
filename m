From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: Problems with commit a770d946371e ("gpio: pxa: add pin control gpio direction and request")
Date: Thu, 07 Apr 2016 20:20:21 +0200
Message-ID: <871t6huvq2.fsf@belgarion.home>
References: <56F730DF.9080307@roeck-us.net> <87oa9zr7g3.fsf@belgarion.home>
	<570673FA.4020200@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:19296 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932233AbcDGSU0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Apr 2016 14:20:26 -0400
In-Reply-To: <570673FA.4020200@roeck-us.net> (Guenter Roeck's message of "Thu,
	7 Apr 2016 07:51:38 -0700")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <guenter@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Guenter Roeck <guenter@roeck-us.net> writes:

>> But no more poor excuses, would you try the patch at the end of this mail, while
>> I'm doing the same on my Jenkins, on both device-tree and legacy platform-data
>> builds, to see if we can fix this ?
>>
>> Cheers.
> Any updates ? I still see the problem in mainline.

Please be patient, it's scheduled for this kernel version, see here :
 - Linus fixes tree
 - and more specifically here :
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/?h=fixes&id=c32f4fd558e1b278addc9514578dd98e20218e00

Cheers.

-- 
Robert
