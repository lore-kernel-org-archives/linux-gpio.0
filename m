From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: Query about Open drain flag with active LOW
Date: Tue, 28 Mar 2017 19:28:46 +0530
Message-ID: <58DA6C16.2000307@nvidia.com>
References: <58D92DE0.3000907@nvidia.com> <CACRpkdYVdUyueSFsSi5SG6nfRn_s4tqfhHSkK3jhQov+9y2koA@mail.gmail.com> <58DA26F2.6040108@nvidia.com> <CACRpkda5jFraJsd5CtjQkxo_nUYLnhsfSwMfacPnJYenwCP=VA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10674 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755387AbdC1ORT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2017 10:17:19 -0400
In-Reply-To: <CACRpkda5jFraJsd5CtjQkxo_nUYLnhsfSwMfacPnJYenwCP=VA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


On Tuesday 28 March 2017 06:38 PM, Linus Walleij wrote:
> On Tue, Mar 28, 2017 at 11:03 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>
>
> I think it should be
>          if (of_flags & OF_GPIO_SINGLE_ENDED) {
>                  if (of_flags & OF_GPIO_ACTIVE_LOW)
>                          *flags |= GPIO_OPEN_SOURCE;
>                  else
>                          *flags |= GPIO_OPEN_DRAIN;
>          }
>
>
> Similar change is needed in the dtbinding gpio header also to invert the
> ACTIVE state with open drain/source.
> OK I think there are no real users of this feature yet, so it would be great if
> you could send a patch, especially if you also have hardware so you can test it.
>

Thinking more, active low/high for line is independent of the open 
drain/source behavior.
Per my understanding, Active low/high depends on the how external device 
provides signal or glue logic designed. Open drain/source is kind of 
setting pin state between GND or VDD or high impedance.

Let me send patch on decoupling the active HIGH/LOW with open 
drain/source and discuss more in the patch.


Thanks,
Laxman




-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
