From: Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH v2] Documentation: gpio: consumer: describe the con_id
 parameter
Date: Sat, 25 Jul 2015 09:15:49 +0200
Message-ID: <55B337A5.4020207@gmail.com>
References: <1437200647-5138-1-git-send-email-dirk.behme@gmail.com> <CAAVeFuJZgiKu+8=Nugmsq9f70CLju2d=SJX6vHi8ismSHFh-Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:33787 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751513AbbGYHPw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2015 03:15:52 -0400
Received: by wicmv11 with SMTP id mv11so84401016wic.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2015 00:15:51 -0700 (PDT)
In-Reply-To: <CAAVeFuJZgiKu+8=Nugmsq9f70CLju2d=SJX6vHi8ismSHFh-Ag@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On 21.07.2015 07:12, Alexandre Courbot wrote:
> On Sat, Jul 18, 2015 at 3:24 PM, Dirk Behme <dirk.behme@gmail.com> wrote:
>> The con_id parameter has to match the GPIO description and is automatically
>> extended by the GPIO suffix if not NULL. I had to look into the code to
>> understand this and properly find the GPIO I've been looking for, so document
>> this.
>>
>> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
>> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> Changes in v2: Incorporate the review comments from Alexandre.
>>
>>   Documentation/gpio/consumer.txt | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
>> index 75542b9..5f7437b 100644
>> --- a/Documentation/gpio/consumer.txt
>> +++ b/Documentation/gpio/consumer.txt
>> @@ -39,6 +39,19 @@ device that displays digits), an additional index argument can be specified:
>>                                            const char *con_id, unsigned int idx,
>>                                            enum gpiod_flags flags)
>>
>> +The con_id string parameter has to be either NULL or the prefix of the GPIO
>> +suffixes ("gpios" or "gpio", automatically looked up by the gpiod functions
>> +internally):
>> +
>> +* If the GPIO description is just named with one of the GPIO suffixes
>> +  ("gpios" or "gpio"), use NULL.
>> +* If the GPIO description is prefixed with anything, e.g. "reset-gpios", use the
>> +  prefix without the "-" as con_id parameter (in this example "reset").
>> +
>> +In case con_id is not NULL, the GPIO subsystem prefixes the GPIO suffix
>> +("gpios" or "gpio") with the string passed in con_id to get the resulting string
>> +(snprintf(... "%s-%s", con_id, gpio_suffixes[]).
>
> Ah, there is still an issue with this description. It is correct as
> far as GPIOs are assigned by the device tree ; but it turns out that
> we have two other ways of assigning GPIOs: ACPI and platform data.
> Have a look at the board.txt file which describes how this works. And
> actually, instead of repeating the same stuff in consumer.txt, maybe
> we can just redirect the reader to the other file?


Please have a look to

http://article.gmane.org/gmane.linux.kernel.gpio/9816

http://article.gmane.org/gmane.linux.kernel.gpio/9815

They should replace this patch, then.

Best regards

Dirk

