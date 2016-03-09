From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 00/50] pinctrl: Add and use devm_ apis for pinctrl_{register,
 unregister}
Date: Wed, 9 Mar 2016 19:53:06 +0530
Message-ID: <56E031CA.9010204@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com> <CACRpkdZjv2KZ0AtC9oBytmSdS+=T+kC8PoJVt-RawE8Np8p40w@mail.gmail.com> <56D307CC.2050202@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:17232 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803AbcCIOgE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 09:36:04 -0500
In-Reply-To: <56D307CC.2050202@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jon Corbet <corbet@lwn.net>, Lee Jones <lee@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>

Hi Linus,

On Sunday 28 February 2016 08:14 PM, Laxman Dewangan wrote:
>
> On Thursday 25 February 2016 07:43 PM, Linus Walleij wrote:
>> On Wed, Feb 24, 2016 at 2:15 PM, Laxman Dewangan 
>> <ldewangan@nvidia.com> wrote:
>>
>>> Add resource manageemnt APIs fro pinctrl_register() and 
>>> pinctrl_unregister()
>>> and use these new APIs on hw driver to reduce the error path code and
>>> remove callback for driver.
>> As you can probably guess I like this too, so wait a while, collect ACKs
>> and send me a branch to pull for this too.
>>
> Got lots of ack/reviewed by and captured all. Also did code changes 
> per review:
> - Optimizing in devm_ apis.
> - Correcting the description of devm_ apis.
> - Simplifying probe in digicolor.
> - Removing unwanted pfc->pinctrl in ish.
>
> Pushed the change at:
> Branch "devm_pinctrl_register" of 
> https://github.com/ldewangan/linux-upstream.git.
>
> Base repo is
> for-next of 
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
>
>
> If required, I can send the V2 version of list with acks.
>

Let me know if I need to send full series (V2 with collected ack) again 
or fine to pull it from above location.


Thanks,
Laxman


