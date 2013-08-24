From: Daniel Santos <danielfsantos@att.net>
Subject: Re: [PATCH] gpiolib: Fix crash when exporting non-existant gpio
Date: Sat, 24 Aug 2013 15:31:59 -0500
Message-ID: <5219183F.8080300@att.net>
References: <1377370108-2867-1-git-send-email-daniel.santos@pobox.com> <52191041.7040505@roeck-us.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nm23-vm5.access.bullet.mail.gq1.yahoo.com ([216.39.63.141]:47848
	"EHLO nm23-vm5.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755578Ab3HXUhf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sat, 24 Aug 2013 16:37:35 -0400
In-Reply-To: <52191041.7040505@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>


On 08/24/2013 02:57 PM, Guenter Roeck wrote:
>
> Looking into calling code, desc_to_gpio() is clearly not supposed to 
> return an error,
> and it will result in odd behavior if it returns -1. For example, the 
> resulting debug
> message of "gpio--1 (...) status ..." is not very useful.
>
> It would make more sense to fix the calling code. You could for example
> validate in affected functions if the gpio pin exists by not only
> checking for desc but also for desc->chip. Another option might be
> to have gpio_to_desc() return NULL if desc->chip is NULL.

Yes, you are correct of course.  I guess I was just being lazy. :) I'll 
re-submit.

