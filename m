From: Dan O'Donovan <dan@emutex.com>
Subject: Re: [PATCH v2 1/3] pinctrl: cherryview: prevent concurrent access to
 GPIO controllers
Date: Mon, 13 Jun 2016 13:30:11 +0100
Message-ID: <575EA753.3020600@emutex.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1465561416-29732-1-git-send-email-dan@emutex.com>
 <1465561416-29732-2-git-send-email-dan@emutex.com>
 <CACRpkdaPHcooBkA4PtApQ=8NgQk4G8sZ-=FkRJ7nQOnyXKc5hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:32942 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965222AbcFMMaQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 13 Jun 2016 08:30:16 -0400
In-Reply-To: <CACRpkdaPHcooBkA4PtApQ=8NgQk4G8sZ-=FkRJ7nQOnyXKc5hQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>


On 06/13/2016 01:23 PM, Linus Walleij wrote:
> On Fri, Jun 10, 2016 at 2:23 PM, Dan O'Donovan <dan@emutex.com> wrote:
>
>> Due to a silicon issue on the Atom X5-Z8000 "Cherry Trail" processor
>> series, a common lock must be used to prevent concurrent accesses
>> across the 4 GPIO controllers managed by this driver.
>>
>> See Intel Atom Z8000 Processor Series Specification Update
>> (Rev. 005), errata #CHT34, for further information.
>>
>> Signed-off-by: Dan O'Donovan <dan@emutex.com>
>> Cc: stable <stable@vger.kernel.org>
> Patch applied.
>
> Does it *really* need to go into fixes right now or can it wait until
> the next merge window?
I have no objection to waiting until the next merge window for this.  Thanks Linus.
>
> Since the rest of the patches seem to depend on it it creates a problem
> where some apply to the fixes branch etc and need special care, that
> is why I'm asking. If it is super-important, I will fix it.
>
> Yours,
> Linus Walleij

