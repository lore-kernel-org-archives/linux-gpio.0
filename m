From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH 3/4] gpio: moxart: get value of output gpio from generic
 driver
Date: Mon, 11 May 2015 16:17:52 +0300
Message-ID: <5550AC00.8060609@mentor.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>	<1430321701-13758-4-git-send-email-vladimir_zapolskiy@mentor.com>	<CACRpkdaQc4Udg6mbzF23sapnPDRvRhLX_=4hjvtJpbmXO4_g-A@mail.gmail.com> <CACmBeS0n4EcNpKfVZM4AypjJVqXeq+5jNqx2chyp5yPX6cBY0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:60284 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751183AbbEKNR5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2015 09:17:57 -0400
In-Reply-To: <CACmBeS0n4EcNpKfVZM4AypjJVqXeq+5jNqx2chyp5yPX6cBY0Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Jensen <jonas.jensen@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jonas, Linus,

On 11.05.2015 15:17, Jonas Jensen wrote:
> On 11 May 2015 at 11:52, Linus Walleij <linus.walleij@linaro.org> wrote:
>> Patch applied, unless Jonas has a problem with it.
>> Always CC: Jonas Jensen whenever patching Moxart stuff pls.

will do, I got a list of addressees using scripts/get_maintainer.pl,
probably updating MAINTAINERS record may be a good option here.

> Thanks!
> 
> I just figured out I never completed my linux-gpio subscription though
> I would have found this eventually.
> 
> Unfortunately my tree is not rebased since 3.17 so merged manually and
> tested (verified OK on UC-7112-LX):
> 
> https://bitbucket.org/Kasreyn/linux-next/commits/5da653347ed802f5cdfd785d1dbaab2aa7432c1d
> 
> 
>    Jonas
> 

--
With best wishes,
Vladimir
