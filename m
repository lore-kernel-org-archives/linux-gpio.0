From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 2/2] gpiolib: assign chip owner to dev->driver->owner
 if not set
Date: Thu, 16 Jul 2015 14:53:17 +0300
Message-ID: <55A79B2D.2080900@ti.com>
References: <1435253451-19817-1-git-send-email-grygorii.strashko@ti.com>	<1435253451-19817-2-git-send-email-grygorii.strashko@ti.com>	<CACRpkdYbVros042MPKx4eYv4RiMM30KUh8ej3Ouwbn2LE+9EDA@mail.gmail.com> <CACRpkdbiLmx6EuL8o1=RgrbMMfagbXHPK2VjrkNons6E=mm8bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:47090 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163AbbGPLxX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 07:53:23 -0400
In-Reply-To: <CACRpkdbiLmx6EuL8o1=RgrbMMfagbXHPK2VjrkNons6E=mm8bA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On 07/16/2015 02:25 PM, Linus Walleij wrote:
> On Thu, Jul 16, 2015 at 1:22 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Jun 25, 2015 at 7:30 PM, Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>
>>> Assign GPIO chip owner field to chip->dev->driver->owner if it was not
>>> configured by GPIO driver.
>>>
>>> Cc: Johan Hovold <johan@kernel.org>
>>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>>
>> Patch applied with Alex' review tag.
>>
>>>   There is also one positive additional side effect:
>>>   lines like below can be removed from a lot of GPIO
>>>   drivers
>>>          rdc321x_gpio_dev->chip.owner = THIS_MODULE;
>>
>> Yes let's do this :)
>
> Or actually, I have had some second thought to why gpio_chip
> is duplicating struct members from struct device at all.
>
> Why should it even have "owner" and "of_node"?
>
> Should we not just rewrite this code to follow the struct device *dev
> pointer in gpio_chip and use "owner" and "of_node" from there?
>

Seems not all drivers implemented using Dev/Driver approach,
so they don't have dev at all ;)

gpio-samsung.c for example (non-DT driver).


-- 
regards,
-grygorii
