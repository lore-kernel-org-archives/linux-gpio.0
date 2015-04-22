From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] Documentation: gpiolib: sysfs: high can be any nonzero
 value
Date: Thu, 23 Apr 2015 00:12:46 +0300
Message-ID: <55380ECE.4040805@mentor.com>
References: <1429720786-6277-1-git-send-email-dirk.behme@gmail.com> <20150422171024.GF16828@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:37732 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753411AbbDVVNR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2015 17:13:17 -0400
In-Reply-To: <20150422171024.GF16828@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

Hi Greg,

On 22.04.2015 20:10, Johan Hovold wrote:
> On Wed, Apr 22, 2015 at 06:39:46PM +0200, Dirk Behme wrote:
>> With the commit 79a9becda8940d ("gpiolib: export descriptor-based
>> GPIO interface") the gpiolib can return any nonzero value for high.
>> Not only 1. Correct this in the documentation.
> 
> As _gpiod_get_raw_value returns a bool, I fail to see how that could
> happen.
> 
> Ah, that was fixed by commit 23600969ff13 ("gpio: clamp returned values
> to the boolean range") in 3.15.
> 
> Looks like that one should be backported to 3.14 instead.
> 

I tested that 23600969ff13 clearly applies to 3.14.y and I confirm that
it fixes the problem.

Would it be possible for you to backport this commit to LTS 3.14.y,
since it fixes quite critical sysfs API regression? Or should I send the
patch to stable@vger.kernel.org ?

Thank you in advance!

--
With best wishes,
Vladimir
