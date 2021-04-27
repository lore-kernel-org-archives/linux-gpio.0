Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D27FC433B4
	for <linux-gpio@archiver.kernel.org>; Tue, 27 Apr 2021 11:50:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D016613E8
	for <linux-gpio@archiver.kernel.org>; Tue, 27 Apr 2021 11:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235913AbhD0Lu7 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 27 Apr 2021 07:50:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:32785 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhD0Lu6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 07:50:58 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lbMEI-0001uB-Sh; Tue, 27 Apr 2021 11:50:14 +0000
Subject: Re: [PATCH][next] gpio: sim: Fix dereference of free'd pointer config
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20210427102427.11066-1-colin.king@canonical.com>
 <CAMpxmJX-Qkn_REScDJqHvBL6J8veFmzM5o2hmZVOu=iTAu1PUg@mail.gmail.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <a5359f24-28e8-ebd6-4451-18027e82814d@canonical.com>
Date:   Tue, 27 Apr 2021 12:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMpxmJX-Qkn_REScDJqHvBL6J8veFmzM5o2hmZVOu=iTAu1PUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/04/2021 12:33, Bartosz Golaszewski wrote:
> On Tue, Apr 27, 2021 at 12:24 PM Colin King <colin.king@canonical.com> wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The error return of config->id dereferences the kfree'd object config.
>> Fix this by using a temporary variable for the id to avoid this issue.
>>
>> Addresses-Coverity: ("Read from pointer aftyer free")
>> Fixes: a49d14276ac4 ("gpio: sim: allocate IDA numbers earlier")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpio/gpio-sim.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
>> index 2e2e6399e453..7bba5783a043 100644
>> --- a/drivers/gpio/gpio-sim.c
>> +++ b/drivers/gpio/gpio-sim.c
>> @@ -751,8 +751,10 @@ gpio_sim_config_make_item(struct config_group *group, const char *name)
>>
>>         config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
>>         if (config->id < 0) {
>> +               int id = config->id;
>> +
>>                 kfree(config);
>> -               return ERR_PTR(config->id);
>> +               return ERR_PTR(id);
>>         }
>>
>>         config_item_init_type_name(&config->item, name,
>> --
>> 2.30.2
>>
> 
> Thanks! Can you do something like this:
> 
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 2e2e6399e453..b21541c0b700 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -744,20 +744,22 @@ static struct config_item *
>  gpio_sim_config_make_item(struct config_group *group, const char *name)
>  {
>   struct gpio_sim_chip_config *config;
> + int id;
> 
>   config = kzalloc(sizeof(*config), GFP_KERNEL);
>   if (!config)
>   return ERR_PTR(-ENOMEM);
> 
> - config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> - if (config->id < 0) {
> + id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> + if (id < 0) {
>   kfree(config);
> - return ERR_PTR(config->id);
> + return ERR_PTR(id);
>   }
> 
>   config_item_init_type_name(&config->item, name,
>      &gpio_sim_chip_config_type);
>   config->num_lines = 1;
> + config->id = id;
>   mutex_init(&config->lock);
> 
>   return &config->item;
> 
> 
> I think this looks more elegant without the local variable inside the if.

OK, good idea, V2 sent.
> 
> Bart
> 

