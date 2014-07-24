From: Harini Katakam <harinikatakamlinux@gmail.com>
Subject: Re: [PATCH 2/3] gpio: zynq: Clear pending interrupt when enabling a IRQ
Date: Thu, 24 Jul 2014 13:06:16 +0530
Message-ID: <CAFcVECKD6KyZsrMsym-2mmpgLCMZmriGJwDJFSZz65=9XKp2Tw@mail.gmail.com>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
	<1405677133-8706-2-git-send-email-lars@metafoo.de>
	<CACRpkda3p3v7o2itkTPRPr6KFhrUO3M8fvn_2S8oYsd_2oaXaw@mail.gmail.com>
	<c1290e0f-b2db-48fb-bc32-aabe1e4ce9ff@BN1BFFO11FD023.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:63922 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934061AbaGXHgR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jul 2014 03:36:17 -0400
Received: by mail-yk0-f181.google.com with SMTP id q200so1530838ykb.40
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2014 00:36:16 -0700 (PDT)
In-Reply-To: <c1290e0f-b2db-48fb-bc32-aabe1e4ce9ff@BN1BFFO11FD023.protection.gbl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Lars-Peter,

On Wed, Jul 23, 2014 at 11:12 PM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> On Wed, 2014-07-23 at 04:31PM +0200, Linus Walleij wrote:
>> On Fri, Jul 18, 2014 at 11:52 AM, Lars-Peter Clausen <lars@metafoo.d=
e> wrote:
>>
>> > The Zynq GPIO controller does not disable the interrupt detection =
when the
>> > interrupt is masked and only disables the propagation of the inter=
rupt. This
>> > means when the controller detects an interrupt condition while the=
 interrupt is
>> > logically disabled (and masked) it will propagate the recorded int=
errupt event
>> > once the interrupt is enabled. This will cause the interrupt consu=
mer to see
>> > spurious interrupts to prevent this first make sure that the inter=
rupt is not
>> > asserted and then enable it.
>> >
>> > E.g. when a interrupt is requested with request_irq() it will be c=
onfigured
>> > according to the requested type (edge/level triggered, etc.) after=
 that it will
>> > be enabled. But the detection circuit might have already registere=
d a false
>> > interrupt before the interrupt type was correctly configured and o=
nce the
>> > interrupt is unmasked this false interrupt will be propagated and =
the interrupt
>> > handler for the just request interrupt will called.
>> >
>> > Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>>
>> Seems like you know what you're doing.
>>
>> Patch tentatively applied unless Harini or Soren protests...
>
> All these things look good to me, though I thought I had tested
> interrupts on banks other than zero, but it might have slipped throug=
h.
>

Sorry for the delay - I was away for a few days.
The change looks OK to me.

Regards,
Harini
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
