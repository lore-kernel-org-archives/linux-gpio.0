From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: remove gpio_descs global array
Date: Tue, 11 Nov 2014 11:31:35 +0100
Message-ID: <CACRpkdaA=F852HRhEYLYscCyTr5pYmNSAGw-dZU=oA4C6Qh2gA@mail.gmail.com>
References: <1414825380-15322-1-git-send-email-acourbot@nvidia.com>
	<CACRpkdaaXxXCm9===0zaKW5QJsHFBznnERdFrcbtKLQhxygzhA@mail.gmail.com>
	<CAAVeFu+fsgG86b8iYVeHNmGqtb2m_P6esF1QFrbsMhwTh+P7Aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:59583 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751437AbaKKKbg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Nov 2014 05:31:36 -0500
Received: by mail-ie0-f173.google.com with SMTP id tr6so11139043ieb.32
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2014 02:31:36 -0800 (PST)
In-Reply-To: <CAAVeFu+fsgG86b8iYVeHNmGqtb2m_P6esF1QFrbsMhwTh+P7Aw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Nov 4, 2014 at 10:10 AM, Alexandre Courbot <gnurou@gmail.com> w=
rote:
> On Mon, Nov 3, 2014 at 11:11 PM, Linus Walleij <linus.walleij@linaro.=
org> wrote:
>> On Sat, Nov 1, 2014 at 8:03 AM, Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>>
>>> The issue with this patch is its use of kzalloc() in gpiochip_add()=
, a
>>> function potentially called during early boot, before kzalloc() bec=
omes
>>> usable. Hence its [RFC] status until we can find a solution for thi=
s or
>>> agree that this issue is actually never ran into (from which point =
can
>>> one use kzalloc()?)
>>
>> So which driver requires that the gpiochip be statically defined...
>> I heard about early call but not *that* early.
>
> Let me know if you feel adventurous - in that case I will submit a
> proper version of this patch to put in -next, and we'll see if people
> complain... :)

=D0=BB=D0=B5=D1=81 =D1=80=D1=83=D0=B1=D1=8F=D1=82 =E2=80=94 =D1=89=D0=B5=
=D0=BF=D0=BA=D0=B8 =D0=BB=D0=B5=D1=82=D1=8F=D1=82 as the russians say.

Let us have the patch.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
