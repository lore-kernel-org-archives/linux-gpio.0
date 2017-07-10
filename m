From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: gpio-crystalcove: Skip IRQ CTRL register
 update for virtual GPIOs
Date: Mon, 10 Jul 2017 16:35:33 -0700
Message-ID: <9fd783e9-3c53-582f-24f9-97901d63501b@linux.intel.com>
References: <5fabde8f9366fce42b5f361f3472bc91754ca7db.1497482431.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAHp75VdVmAPTP5k_U+=EvBqysGz0Jk9YoytFMTSA_1T-tmVvZw@mail.gmail.com>
 <167cd7bd-1e70-d44a-180c-da890a017110@linux.intel.com>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:4272 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754903AbdGJXfu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Jul 2017 19:35:50 -0400
In-Reply-To: <167cd7bd-1e70-d44a-180c-da890a017110@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

Hi Hans,

Do you have any comments on this patch ? It kind of fixes your patch, so 
would prefer to get your comments.


On 06/15/2017 02:45 PM, sathyanarayanan kuppuswamy wrote:
> Hi Andy,
>
>
> On 06/15/2017 02:19 AM, Andy Shevchenko wrote:
>> On Thu, Jun 15, 2017 at 2:21 AM,
>> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>>> From: Kuppuswamy Sathyanarayanan 
>>> <sathyanarayanan.kuppuswamy@linux.intel.com>
>>>
>>> Commit 9a752b4c9ab9 ("gpio: crystalcove: Do not write regular gpio
>>> registers for virtual GPIOs") added support to skip GPIO register
>>> update for virtual GPIOs, but it missed to add skip logic in
>>> crystalcove_update_irq_ctrl() function. This patch fixes it.
>>> @@ -134,6 +134,9 @@ static void crystalcove_update_irq_ctrl(struct 
>>> crystalcove_gpio *cg, int gpio)
>>>   {
>>>          int reg = to_reg(gpio, CTRL_IN);
>>>
>>> +       if (reg < 0)
>>> +               return;
>>> +
>>>          regmap_update_bits(cg->regmap, reg, CTLI_INTCNT_BE, 
>>> cg->intcnt_value);
>>>   }
>> Shouldn't it have been done using irq_valid_mask flag in the first 
>> place?
> Agree. Setting irq_valid_mask would be the proper approach to skip IRQ 
> for some GPIO pins. But commit 9a752b4c9ab9 added the GPIO index based 
> checks in other IRQ set/unset functions in this driver and missed to 
> add it only in this update_irq_ctrl() function. May be I can submit a 
> separate patch to clean it up and use logic based on setting 
> irq_valid_mask.
>
> Even if we do the cleanup patch, I would still prefer to have this 
> check. Since to_reg() can return value < 0, its good to check it 
> before passing it to regmap_* functions. Let me know your comments.
>
>>
>

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer

