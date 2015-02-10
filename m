From: Tyler Hall <tylerwhall@gmail.com>
Subject: Re: [PATCH] gpiolib: of: allow of_gpiochip_find_and_xlate to find
 more than one chip per node
Date: Tue, 10 Feb 2015 15:30:56 -0500
Message-ID: <CAOjnSCaLY1HM+DLPQ4H6Xd6wfrvvzpJe1DEE2kjX0eNX7AMDBQ@mail.gmail.com>
References: <1423558107-23264-1-git-send-email-hans.holmberg@intel.com>
 <CAAVeFu+F1oy4AZqWmMkGqiVxz5YF1y-qMxyHObWjjVXp8PuGcg@mail.gmail.com> <87a90l7kz9.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:55852 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750763AbbBJUbR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Feb 2015 15:31:17 -0500
In-Reply-To: <87a90l7kz9.fsf@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Hans Holmberg <hans.holmberg@intel.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Howard Cochran <cochran@lexmark.com>, Daniel Mack <zonque@gmail.com>

On Tue, Feb 10, 2015 at 12:08 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Alexandre Courbot <gnurou@gmail.com> writes:
>
>> On Tue, Feb 10, 2015 at 5:48 PM, Hans Holmberg <hans.holmberg@intel.com> wrote:
>>> The change:
>>>
>>> 7b8792bbdffdff3abda704f89c6a45ea97afdc62
>>> gpiolib: of: Correct error handling in of_get_named_gpiod_flags
>>>
>>> assumed that only one gpio-chip is registred per of-node.
>>> Some drivers register more than one chip per of-node, so
>>> adjust the matching function of_gpiochip_find_and_xlate to
>>> not stop looking for chips if a node-match is found and
>>> the translation fails.
>>>
>>> Signed-off-by: Hans Holmberg <hans.holmberg@intel.com>
>>
>> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>
>   (on arm pxa architecture)
Tested-by: Tyler Hall <tylerwhall@gmail.com>

With gpio-pxa (multiple chips per of node) and on arm-mvebu with
mvebu-gpio (one chip per of-node).
