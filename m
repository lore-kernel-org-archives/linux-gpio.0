From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [RFC v1 0/9] gpio: davinci: reuse for keystone arch
Date: Mon, 2 Dec 2013 12:41:29 +0200
Message-ID: <529C63D9.6090207@ti.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com> <CACRpkdYKRWZJm8nRGSHV8DUehd9d0rh6y8R4HMvkimKhWezD2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:39297 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753254Ab3LBKp3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2013 05:45:29 -0500
In-Reply-To: <CACRpkdYKRWZJm8nRGSHV8DUehd9d0rh6y8R4HMvkimKhWezD2g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>

Hi All,

On 11/29/2013 10:37 AM, Linus Walleij wrote:
> On Tue, Nov 26, 2013 at 8:40 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>
>> [1] Depends on patch:
>> "[PATCH 1/2] gpio: davinci: Fix a check for unbanked gpio"
>> https://lkml.org/lkml/2013/11/8/22
>>
>> [2] and depends on series from Prabhakar Lad:
>> "[PATCH v6 0/6] gpio: daVinci: cleanup and feature enhancement"
>> https://www.mail-archive.com/devicetree@vger.kernel.org/msg05970.html
>
> So this needs to go through the same tree as these patches.
>
> And I suggested that Sekhar queue them and either take them
> directly up to ARM SoC or send me a pull request to take it through
> the GPIO tree.
>
> I'm going to go in and review these now...


Thanks for you review.

I'll update, rebase and repost patches once the "Depends On" series
will be accepted.

Regards,
- grygorii
