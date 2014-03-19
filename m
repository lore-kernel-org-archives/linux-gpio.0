From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] gpiolib: check if gpio_desc pointer is error or NULL
Date: Wed, 19 Mar 2014 09:33:24 +0100
Message-ID: <53295654.5080009@codethink.co.uk>
References: <1395139290-4207-1-git-send-email-ben.dooks@codethink.co.uk> <CAAVeFuLJOSikb3pXffbC7Y4LDKXd-PQ_cadtT1q=TLCyWVh=MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([185.25.241.215]:44695 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757060AbaCSIda (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 19 Mar 2014 04:33:30 -0400
In-Reply-To: <CAAVeFuLJOSikb3pXffbC7Y4LDKXd-PQ_cadtT1q=TLCyWVh=MA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-kernel@lists.codethink.co.uk, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 19/03/14 02:48, Alexandre Courbot wrote:
> On Tue, Mar 18, 2014 at 7:41 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>> Some of the gpiod_ calls take a pointer to a gpio_desc as their
>> argument but only check to see if it is NULL to validate the
>> input.
>>
>> Calls such as devm_gpiod_get() return an error-pointer if they
>> fail, so doing the following will not work:
>>
>>          gpio = devm_gpiod_get(...);
>>          gpiod_direction_output(gpio, 0);
>>
>> The sequence produces an OOPS like:
>>
>>          Unable to handle kernel paging request at virtual address fffffffe
>>
>> Change all calls that check for !desc to use IS_ERR_OR_NULL() to
>> avoid these issues.
>
> This change is certainly correct from a semantics point of view. Maybe
> I'd argue that the burden is on the caller to check that gpiod_get()
> returns a valid GPIO descriptor, but having extra security doesn't
> hurt. However my problem with this change in its current form is that
> it will hide such forgetfulnesses by making functions like
> gpiod_get_value() fail silently instead of triggering a oops.

On the other hand, it means that we do not have to keep checking
the validity of the pointer in the caller.

> Could you make sure that any call of a gpiolib function on a non-valid
> descriptor raises at least a message in the console, and while you are
> at it harmonize the way these messages are output? Right now we are
> using pr_debug(), pr_warn() or WARN_ON() depending on the location. I
> would say that using an invalid GPIO descriptor is offending enough
> that it should trigger a stack dump at every attempt.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
