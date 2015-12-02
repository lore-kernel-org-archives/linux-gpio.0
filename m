From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix initial value for direction_output
Date: Wed, 2 Dec 2015 15:26:33 +0100
Message-ID: <565EFF99.7020704@i2se.com>
References: <1447893147-9458-1-git-send-email-stefan.wahren@i2se.com>
 <565E6B22.3060808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:56091 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758028AbbLBO1I (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2015 09:27:08 -0500
In-Reply-To: <565E6B22.3060808@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org, Martin Sperl <kernel@martin.sperl.org>, linux-arm-kernel@lists.infradead.org

Am 02.12.2015 um 04:53 schrieb Stephen Warren:
> On 11/18/2015 05:32 PM, Stefan Wahren wrote:
>> Currently the provided initial value for bcm2835_gpio_direction_output
>> has no effect. So fix this issue by changing the value before
>> changing the GPIO direction. As a result we need to move the function below
>> bcm2835_gpio_set.
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
>

Should i resend the patch with

Suggested-by: Martin Sperl <kernel@martin.sperl.org>

?
