From: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH][V2] pinctrl: ti-iodelay: remove redundant pin < 0 check
 on unsigned int
Date: Mon, 16 Jan 2017 15:52:04 +0000
Message-ID: <7cc8f5f0-7899-ca16-2bbb-8869abfda650@canonical.com>
References: <20170113210636.5173-1-colin.king@canonical.com>
 <CAL_JsqKoRr+VrtgNNHCTH5492N9k+sgiGhX778OEAmsYT7wYjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:49199 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750938AbdAPPxK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2017 10:53:10 -0500
In-Reply-To: <CAL_JsqKoRr+VrtgNNHCTH5492N9k+sgiGhX778OEAmsYT7wYjw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 16/01/17 15:45, Rob Herring wrote:
> On Fri, Jan 13, 2017 at 3:06 PM, Colin King <colin.king@canonical.com> wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> pin is an unsigned int and therefore can never be < 0 so
>> this check is redundant. Remove the check and the associated
>> dev_err error message.
> 
> Not sure why I got copied on this...
> 
>> Fixes CoverityScan CID#1396438 ("Unsigned compared against 0")
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 6 ------
> 
> This file doesn't exist in mainline.
> 
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
>> index 3b86d3d..a345166 100644
>> --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
>> +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
>> @@ -665,12 +665,6 @@ static void ti_iodelay_pin_dbg_show(struct pinctrl_dev *pctldev,
>>         r = iod->reg_data;
>>
>>         offset = ti_iodelay_pin_to_offset(iod, pin);
>> -       if (pin < 0) {
> 
> Shouldn't this be "if (offset < 0)"?

Yep. However if the code was correct and using offset:

	if (offset < 0) {
		...
	
then we still get the same issue, that is, offset is unsigned so that
comparison is redundant since it can't be < 0.  Perhaps I should re-send
a V3 with an updated commit message.


> 
> 
>> -               dev_err(iod->dev, "invalid pin offset for pin%i\n", pin);
>> -
>> -               return;
>> -       }
>> -
>>         pd = &iod->pa[pin];
>>         cfg = pd->drv_data;
>>
>> --
>> 2.10.2
>>

