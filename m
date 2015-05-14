From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a73a4: Remove obsolete
 multi-platform check
Date: Thu, 14 May 2015 12:23:48 +0200
Message-ID: <CACRpkdaRZB_JAtt0uhS7ad3+Rvh3gg0RebZHE3Z_pp2guy0QHA@mail.gmail.com>
References: <1430216072-31412-1-git-send-email-geert+renesas@glider.be>
	<CACRpkdZZ_=x7=2Ae9VPAo6dPvD2D_2MUDwNjCF-jxSp075X1hA@mail.gmail.com>
	<20150514004927.GI9781@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33318 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932490AbbENKXt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2015 06:23:49 -0400
Received: by oica37 with SMTP id a37so52123044oic.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2015 03:23:49 -0700 (PDT)
In-Reply-To: <20150514004927.GI9781@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, May 14, 2015 at 2:49 AM, Simon Horman <horms@verge.net.au> wrote:
> Hi Linus,
>
> On Tue, May 12, 2015 at 09:26:53AM +0200, Linus Walleij wrote:
>> On Tue, Apr 28, 2015 at 12:14 PM, Geert Uytterhoeven
>> <geert+renesas@glider.be> wrote:
>>
>> > As of commit 9d07d414d4c33d86 ("ARM: shmobile: r8a73a4: ape6evm: Remove
>> > legacy platform"), r8a73a4 is only supported in generic ARM
>> > multi-platform builds.  Hence CONFIG_ARCH_MULTIPLATFORM is always set,
>> > and the check can be removed.
>> >
>> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > ---
>> > This depends on Simon's branch r8a73a4-ccf-and-multiplatform-for-v4.1
>>
>> I guess I can't merge it to pinctrl then and Simon will take it?
>>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> I am happy to take this with your ack, however, the above mentioned branch
> is present in v4.1-rc1 so if it is practical for you to use that as a base
> then you can take the patch yourself.

Yeah I took it. Thanks Simon.

Yours,
Linus Walleij
