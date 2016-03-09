From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/3] pinctrl: ns2: add pinmux driver support for Broadcom
 NS2 SoC
Date: Wed, 9 Mar 2016 10:50:09 -0700
Message-ID: <56E06251.3020502@wwwdotorg.org>
References: <1457005303-26829-1-git-send-email-yendapally.reddy@broadcom.com>
 <1457005303-26829-3-git-send-email-yendapally.reddy@broadcom.com>
 <CACRpkdaKn4puDsZBPSbfkmHW4KHqBW8q1T2vpyNk_0Yb7C0AXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:43956 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752020AbcCIRuN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 12:50:13 -0500
In-Reply-To: <CACRpkdaKn4puDsZBPSbfkmHW4KHqBW8q1T2vpyNk_0Yb7C0AXQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>, Jonathan Bell <jonathan@raspberrypi.org>, Scott Branden <sbranden@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 03/09/2016 04:04 AM, Linus Walleij wrote:
> On Thu, Mar 3, 2016 at 6:41 PM, Yendapally Reddy Dhananjaya Reddy
> <yendapally.reddy@broadcom.com> wrote:
>
>> This adds the initial support of the Broadcom NS2 pinmux driver
>>
>> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
>
> Now yet another Broadcom driver!
>
> Can I get the help of the maintainers of the other
> Broadcom drivers to say:
>
> - If this looks sane
>
> - If this hardware looks suspiciously similar to one of the
>    other drivers and should rather me a subdriver of one of
>    the existing ones

Based on this patch, I don't quickly see any obvious relation between 
this HW and bcm2835. I don't know anything about other bcm pinmux, so 
didn't check those.
