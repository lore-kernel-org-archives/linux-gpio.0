From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 0/3] Add Fintek F71869 and F71869A gpio support
Date: Mon, 2 Mar 2015 14:51:34 +0900
Message-ID: <CAAVeFuK4K5z2MaedUTMKXBNcbFsPWYaeObnA1w3LE-EDg8B6_g@mail.gmail.com>
References: <1422206179-11464-1-git-send-email-andreas@gazonk.org>
 <CAAVeFuLgnLquniryQYV3VJfyV5JMOQimhzLsJjV4DcWNhUaDoQ@mail.gmail.com> <alpine.LNX.2.20.1502272332400.22486@gazonk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:36588 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbbCBFvz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 00:51:55 -0500
Received: by ierx19 with SMTP id x19so45272566ier.3
        for <linux-gpio@vger.kernel.org>; Sun, 01 Mar 2015 21:51:54 -0800 (PST)
In-Reply-To: <alpine.LNX.2.20.1502272332400.22486@gazonk.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Andreas_Bofj=C3=A4ll?= <andreas@gazonk.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Feb 28, 2015 at 7:33 AM, Andreas Bofj=C3=A4ll <andreas@gazonk.o=
rg> wrote:
> On Thu, 26 Feb 2015, Alexandre Courbot wrote:
>>
>> On Mon, Jan 26, 2015 at 2:16 AM, Andreas Bofjall <andreas@gazonk.org=
>
>> wrote:
>>>
>>> this series adds support for the gpio pins on the Fintek F71869 and
>>> F71869A
>>> SuperI/O chips to the gpio-f7188x driver. The chips are used on for
>>> example
>>> Jetway motherboards.
>>>
>>> The driver has been tested on two different boards: a JNF99-525 wit=
h
>>> F71869A,
>>> and by Les Schaffer on a Jetway NF96u-525 with F71869.
>>
>>
>> The series,
>>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> Apologies for taking so long to check it out!
>
>
> Hi and thanks!
>
> How do you normally handle this, would you like me to re-spin the pat=
chset
> with the Reviewed-by set?

No, the maintainer will add the tags you received when applying the
patches. Unless you are explicitly asked to re-send a version for
other reasons, then it is a good idea to append the tags yourself or
they might get lost.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
