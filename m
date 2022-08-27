Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD98ECAAD2
	for <linux-gpio@archiver.kernel.org>; Sat, 27 Aug 2022 12:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbiH0Mfq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 27 Aug 2022 08:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbiH0Mfo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Aug 2022 08:35:44 -0400
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr [80.12.242.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622C411159
        for <linux-gpio@vger.kernel.org>; Sat, 27 Aug 2022 05:35:43 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id Rv2JoJciNXFXxRv2KoYu3k; Sat, 27 Aug 2022 14:35:41 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 27 Aug 2022 14:35:41 +0200
X-ME-IP: 90.11.190.129
Message-ID: <06339802-8c3e-2a40-e4fd-6a8a774676fe@wanadoo.fr>
Date:   Sat, 27 Aug 2022 14:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] gpio: pxa: use devres for the clock struct
Content-Language: en-US
From:   Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>, Yuan Can <yuancan@huawei.com>,
        Kernel Janitors <kernel-janitors@vger.kernel.org>
References: <20220815091929.130547-1-brgl@bgdev.pl>
 <CAHp75Vc3dazcM1MLzjzPUmgMGNACUsOZ8aK4uauAJk0hzj9q-w@mail.gmail.com>
 <CACRpkdZEcTD1A3tR=d4fDF89ECMDfchVPW921v6X6ARiPXHEMQ@mail.gmail.com>
 <e9991ab5-cb55-789a-dfa1-de10acb37842@wanadoo.fr>
In-Reply-To: <e9991ab5-cb55-789a-dfa1-de10acb37842@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Le 26/08/2022 à 14:18, Christophe JAILLET a écrit :
> Le 26/08/2022 à 10:20, Linus Walleij a écrit :
>> On Sat, Aug 20, 2022 at 12:15 AM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Mon, Aug 15, 2022 at 12:26 PM Bartosz Golaszewski <brgl@bgdev.pl> 
>>> wrote:
>>>>
>>>> The clock is never released after probe(). Use devres to not leak
>>>> resources.
>>>
>>> ...
>>>
>>>> -       clk = clk_get(&pdev->dev, NULL);
>>>> +       clk = devm_clk_get_enabled(&pdev->dev, NULL);
>>>>          if (IS_ERR(clk)) {
>>>>                  dev_err(&pdev->dev, "Error %ld to get gpio clock\n",
>>>>                          PTR_ERR(clk));
>>>>                  return PTR_ERR(clk);
>>>
>>> Shouldn't we fix a potential log saturation issue first (by switching
>>> to use dev_err_probe() helper)?
>>
>> Can be a separate patch, the clock mem leak is a bigger problem
>> IMO so this should be applied first.
>>
>> Hm isn't it possible to toss the task of fixing a gazillion
>> dev_err_probe() messages on Cocinelle scripts/coccinelle/? I bet it's 
>> something
>> the kernel janitors could fix all over the place.
>>
>> Yours,
>> Linus Walleij
>>
>
> // Both rules: 316 files changed, 1321 insertions(+), 1774 deletions(-)
> 


With an updated script, I spot:
    503 files changed, 1962 insertions(+), 2622 deletions(-)

(and 150-200 still needs some manual check or script adjustment)


Does this really make sense to send SO many patches for it?

If yes, should it be done on a per-system basis, or by driver basis?

CJ
