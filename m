From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin.hundeboll@prevas.dk>
Subject: Re: [PATCH] tools/gpio: add gpio util to get or set gpio lines
Date: Tue, 15 Aug 2017 14:54:05 +0200
Message-ID: <53785496-f20c-1c93-4487-737d0d92c9b6@prevas.dk>
References: <20170724143218.8510-1-mnhu@prevas.dk>
 <CACRpkdYMfaZDd3Tp-MfdtEpYLYWFJgGVKzwhjp1-swoufuzWrQ@mail.gmail.com>
 <B76AFF4C-51DC-4FC5-85C4-4F9D4404C8A5@prevas.dk>
 <CACRpkdbn5daKVUU7-5P_x==KmBQix7EQ667STKC8ncOhAySdYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail01.prevas.se ([62.95.78.3]:51597 "EHLO mail01.prevas.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750997AbdHONEQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Aug 2017 09:04:16 -0400
In-Reply-To: <CACRpkdbn5daKVUU7-5P_x==KmBQix7EQ667STKC8ncOhAySdYg@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>, Bartosz Golaszewski <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 2017-08-07 14:33, Linus Walleij wrote:
> On Thu, Aug 3, 2017 at 10:31 AM, Martin Hundebøll
> <martin.hundeboll@prevas.dk> wrote:
> 
>>> Maybe it should be two tools? One fo setting and one for getting a
>>> line?
>>
>> Correct. I can update the patch into two utils, but with libgpiod in the mix, we can just drop this?
> 
> I would like Bartosz library to be used widely so let's drop this.

Would you accept a patch updating the documentation with a hint about 
tools/gpio and libgpiod?

-- 
MARTIN HUNDEBØLL, Prevas A/S
Software Developer

Hedeager 3, DK-8200 Aarhus N
Phone +45 87438070
Mobile +45 25562438
Martin.Hundeboll@prevas.dk
www.prevas.com
