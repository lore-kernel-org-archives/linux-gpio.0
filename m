From: Yong Li <sdliyong@gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Use correct u16 value for register word write
Date: Tue, 29 Mar 2016 20:53:58 +0800
Message-ID: <CADO9-pdhTOmg9OMgz+K++Gc3mCxbi7KF23kA8zsftVeDTR3SSw@mail.gmail.com>
References: <1459232852-15697-1-git-send-email-sdliyong@gmail.com> <56FA6FB6.4040003@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:38154 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751625AbcC2MyS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2016 08:54:18 -0400
Received: by mail-ig0-f177.google.com with SMTP id ui10so3998312igc.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Mar 2016 05:54:18 -0700 (PDT)
In-Reply-To: <56FA6FB6.4040003@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Thanks for your comment, I think I can change it to val[0] | (val[1]
<< 8), is it okay ?

2016-03-29 20:06 GMT+08:00 Phil Reid <preid@electromag.com.au>:
> G'day Yong,
>
> One comment below.
>
> On 29/03/2016 2:27 PM, Yong Li wrote:
>>
>> The current implementation only uses the first byte in *val,
>> the second data is always 0. Change it to *(u16 *)val
>> to write the two bytes into the register
>>
>> Signed-off-by: Yong Li <sdliyong@gmail.com>
>> ---
>>   drivers/gpio/gpio-pca953x.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
>> index d0d3065..cf3d410 100644
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -159,7 +159,7 @@ static int pca953x_write_regs(struct pca953x_chip
>> *chip, int reg, u8 *val)
>>                 switch (chip->chip_type) {
>>                 case PCA953X_TYPE:
>>                         ret = i2c_smbus_write_word_data(chip->client,
>> -                                                       reg << 1, (u16)
>> *val);
>> +                                                       reg << 1, *(u16
>> *)val);
>
> I don't think this is safe for systems that don't support unaligned memory
> access.
>
>
>>                         break;
>>                 case PCA957X_TYPE:
>>                         ret = i2c_smbus_write_byte_data(chip->client, reg
>> << 1,
>>
>
>
> --
> Regards
> Phil Reid
>
