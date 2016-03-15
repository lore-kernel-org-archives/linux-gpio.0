From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 00/50] pinctrl: Add and use devm_ apis for pinctrl_{register,
 unregister}
Date: Tue, 15 Mar 2016 18:55:19 +0530
Message-ID: <56E80D3F.3090300@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>	<CACRpkdZjv2KZ0AtC9oBytmSdS+=T+kC8PoJVt-RawE8Np8p40w@mail.gmail.com>	<56D307CC.2050202@nvidia.com>	<56E031CA.9010204@nvidia.com> <CACRpkdYQL0HUWuz882RRsSu5hLoS5VcVvpm1LeL1aeJkE_Y0tA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:9843 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754106AbcCONi4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2016 09:38:56 -0400
In-Reply-To: <CACRpkdYQL0HUWuz882RRsSu5hLoS5VcVvpm1LeL1aeJkE_Y0tA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jon Corbet <corbet@lwn.net>, Lee Jones <lee@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>


On Tuesday 15 March 2016 02:01 PM, Linus Walleij wrote:
> On Wed, Mar 9, 2016 at 3:23 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>>> Pushed the change at:
>>> Branch "devm_pinctrl_register" of
>>> https://github.com/ldewangan/linux-upstream.git.
>>>
>>> Base repo is
>>> for-next of
>>> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
>>>
>>>
>>> If required, I can send the V2 version of list with acks.
>> Let me know if I need to send full series (V2 with collected ack) again or
>> fine to pull it from above location.
> Please collect the ACKs on your branch and ask me to pull it after v4.6-rc1.
> No need to resend the patches.
>
> Unfortunately it arrived too late for the merge window, but hey: we got the
> devm gpiochip in for v4.6.

Thanks for taking the GPIO patches.

Ok, We will do pincontrol post v4.6 and probably, we will have some more 
chnages for using devm_gpio in pincontrol subsystem  as these APIs will 
be available  publicly.

Thanks,
Laxman



