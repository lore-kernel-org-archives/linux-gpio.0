From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH gpio v1 2/2] gpio: ks8695: fix 'else should follow close
 brace '}''
Date: Sat, 27 Sep 2014 18:48:18 +0530
Message-ID: <5426B91A.7080409@gmail.com>
References: <1411226071-11625-1-git-send-email-varkab@cdac.in> <1411226071-11625-2-git-send-email-varkab@cdac.in> <CAAVeFu+NVmV+MqPXBUD3+3Zio44AZF5-YPV_p4KRzOHLrRFB2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:39218 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783AbaI0NSV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Sep 2014 09:18:21 -0400
Received: by mail-pa0-f53.google.com with SMTP id kq14so2792022pab.26
        for <linux-gpio@vger.kernel.org>; Sat, 27 Sep 2014 06:18:21 -0700 (PDT)
In-Reply-To: <CAAVeFu+NVmV+MqPXBUD3+3Zio44AZF5-YPV_p4KRzOHLrRFB2Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Varka Bhadram <varkab@cdac.in>


On Monday 22 September 2014 03:18 PM, Alexandre Courbot wrote:
> On Sun, Sep 21, 2014 at 12:14 AM, Varka Bhadram <varkabhadram@gmail.com> wrote:
>> Signed-off-by: Varka Bhadram <varkab@cdac.in>
>> ---
>>   drivers/gpio/gpio-ks8695.c |    9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-ks8695.c b/drivers/gpio/gpio-ks8695.c
>> index ba2d2f1..10c7377 100644
>> --- a/drivers/gpio/gpio-ks8695.c
>> +++ b/drivers/gpio/gpio-ks8695.c
>> @@ -276,17 +276,14 @@ static int ks8695_gpio_show(struct seq_file *s, void *unused)
>>                                  case IOPC_TM_EDGE:
>>                                          seq_printf(s, "(Edges)");       break;
>>                                  }
>> -                       }
>> -                       else
>> +                       } else
>>                                  seq_printf(s, "GPIO\t");
> According to the kernel code formatting guidelines, this should actually be
>
>          } else {
>                  seq_printf(s, "GPIO\t");
>          }

Ok i will change it . Thanks...

--
Regards,
Varka Bhadram

