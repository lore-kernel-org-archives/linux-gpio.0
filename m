From: Dmitry Mastykin <mastichi@gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: fix irq setup order
Date: Wed, 3 Jan 2018 15:49:31 +0300
Message-ID: <CALieaedb1+ZRZYq7EmB_68W65dXVYXZ8QO1t6EE-L0jO6XJmsw@mail.gmail.com>
References: <1514474364-32169-1-git-send-email-mastichi@gmail.com> <CACRpkdZp0kp6vTAOj11Tc2mGD4MvWwpMGTQgEhQiQAdUgapcGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:46484 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752051AbeACMtd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jan 2018 07:49:33 -0500
In-Reply-To: <CACRpkdZp0kp6vTAOj11Tc2mGD4MvWwpMGTQgEhQiQAdUgapcGw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Phil Reid <preid@electromag.com.au>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 2, 2018 at 12:10 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Patch applied, albeit for devel.
>
> Should it be tagged for stable or go into fixes?
>
Thank you very much, Linus!
About tags, please do as it convenient for you.

Kind regards,
Dmitry

> On Thu, Dec 28, 2017 at 4:19 PM, Dmitry Mastykin <mastichi@gmail.com> wrote:
>
>> When using mcp23s08 module with gpio-keys, often (50% of boots)
>> it fails to get irq numbers with message:
>> "gpio-keys keys: Unable to get irq number for GPIO 0, error -6".
>> Seems that irqs must be setup before devm_gpiochip_add_data().
>>
>> Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
