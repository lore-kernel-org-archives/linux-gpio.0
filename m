From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: f7188x: add GPIO support for F71869
Date: Sun, 25 Jan 2015 18:37:28 +0900
Message-ID: <CAAVeFuLELreD-f7NPkRAr_+p_7ycZF6uYGJ_Q396VfS4zseGHQ@mail.gmail.com>
References: <1419467255-9658-1-git-send-email-andreas@gazonk.org>
 <alpine.LNX.2.11.1501151810310.25141@gazonk.org> <alpine.LNX.2.11.1501191807420.23468@gazonk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:55193 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752539AbbAYJht convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Jan 2015 04:37:49 -0500
Received: by mail-ie0-f182.google.com with SMTP id ar1so4208603iec.13
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2015 01:37:49 -0800 (PST)
In-Reply-To: <alpine.LNX.2.11.1501191807420.23468@gazonk.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Andreas_Bofj=C3=A4ll?= <andreas@gazonk.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 20, 2015 at 2:14 AM, Andreas Bofj=C3=A4ll <andreas@gazonk.o=
rg> wrote:
> Hi,
>
> On Thu, 15 Jan 2015, Andreas Bofj=C3=A4ll wrote:
>
>> On Thu, 25 Dec 2014, Andreas Bofjall wrote:
>>
>>> Add support for the GPIOs found on the Fintek SuperI/O chip F71869,=
 such
>>> as the one found on the Jetway JNF99-525 motherboard, to the f7188x=
 gpio
>>> driver.
>>>
>>> Signed-off-by: Andreas Bofjall <andreas@gazonk.org>
>
>
> Les Schaffer nicely noted the chip ID in the patch is not for the F71=
869 (ID
> 0x0814) but for the F71869A (ID 0x1007). They differ somewhat in thei=
r pin
> configurations, so the patch as-is is broken. It worked for me on the
> JNF99-525 because the few registers that didn't match are for pins th=
at
> aren't exposed.
>
> Unfortunately, I don't have a F71869 to test with, so this patch shou=
ldn't
> be merged. I'll see if the patch can be rewritten for the F71869A.

Nonetheless, sorry for lack of reaction on this patch - we are
sometimes slow to react. :(
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
