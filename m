From: Harini Katakam <harinikatakamlinux@gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: zynq: Take bank offset into account when
 reporting a IRQ
Date: Tue, 19 Aug 2014 00:34:44 +0530
Message-ID: <CAFcVECKejNNaMykB3nDY6zos1_NEezmK-MDJfmVauSHpLoW09A@mail.gmail.com>
References: <1408355696-9998-1-git-send-email-lars@metafoo.de>
	<1408355696-9998-2-git-send-email-lars@metafoo.de>
	<CAAVeFu+DnWGjsu0t+e5zEkNDG2O5dXs-BHX=BX4RgcpHvTg7=w@mail.gmail.com>
	<ba183934-971e-47b1-997e-b9634e8bc27a@BN1BFFO11FD002.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:61888 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751817AbaHRTEp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Aug 2014 15:04:45 -0400
Received: by mail-yk0-f174.google.com with SMTP id q9so4573787ykb.5
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2014 12:04:44 -0700 (PDT)
In-Reply-To: <ba183934-971e-47b1-997e-b9634e8bc27a@BN1BFFO11FD002.protection.gbl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Aug 19, 2014 at 12:24 AM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> On Mon, 2014-08-18 at 09:28AM -0700, Alexandre Courbot wrote:
>> On Mon, Aug 18, 2014 at 2:54 AM, Lars-Peter Clausen <lars@metafoo.de=
> wrote:
>> > When looking up the IRQ the bank offset needs to be taken into acc=
ount.
>> > Otherwise interrupts for banks other than bank 0 get incorrectly r=
eported as
>> > interrupts for bank 0.
>> >
>> > Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>> > ---
>> > Changes since v1:
>> >         * Use lookup table instead of switch-case.
>> > ---
>> >  drivers/gpio/gpio-zynq.c | 10 +++++++++-
>> >  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> Yep, you saved 16 lines compared to the first version of this patch.=
 :)
>>
>> I assume overflows over this array cannot happen (otherwise a quick
>> check against ARRAY_SIZE(zynq_gpio_bank_offset) would do the trick),
>> if so:
> I think that overflow is impossible since we are in a for-loop that r=
uns
> from 0..(ZYNQ_GPIO_MAX_BANK - 1).
>
>>
>> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>
> For the series:
> Acked-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

Acked-by: Harini Katakam <harinik@xilinx.com>

Regards,
Harini
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
