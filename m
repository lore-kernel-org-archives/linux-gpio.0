From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] gpiolib: of: allow of_gpiochip_find_and_xlate to find more than one chip per node
Date: Tue, 10 Feb 2015 18:08:26 +0100
Message-ID: <87a90l7kz9.fsf@free.fr>
References: <1423558107-23264-1-git-send-email-hans.holmberg@intel.com>
	<CAAVeFu+F1oy4AZqWmMkGqiVxz5YF1y-qMxyHObWjjVXp8PuGcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:49376 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751609AbbBJRIa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Feb 2015 12:08:30 -0500
In-Reply-To: <CAAVeFu+F1oy4AZqWmMkGqiVxz5YF1y-qMxyHObWjjVXp8PuGcg@mail.gmail.com>
	(Alexandre Courbot's message of "Tue, 10 Feb 2015 17:50:22 +0900")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Hans Holmberg <hans.holmberg@intel.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Howard Cochran <cochran@lexmark.com>, Daniel Mack <zonque@gmail.com>, Tyler Hall <tylerwhall@gmail.com>

Alexandre Courbot <gnurou@gmail.com> writes:

> On Tue, Feb 10, 2015 at 5:48 PM, Hans Holmberg <hans.holmberg@intel.com> wrote:
>> The change:
>>
>> 7b8792bbdffdff3abda704f89c6a45ea97afdc62
>> gpiolib: of: Correct error handling in of_get_named_gpiod_flags
>>
>> assumed that only one gpio-chip is registred per of-node.
>> Some drivers register more than one chip per of-node, so
>> adjust the matching function of_gpiochip_find_and_xlate to
>> not stop looking for chips if a node-match is found and
>> the translation fails.
>>
>> Signed-off-by: Hans Holmberg <hans.holmberg@intel.com>
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>
  (on arm pxa architecture)

Cheers.

-- 
Robert
