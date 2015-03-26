From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V8 3/8] MIPS: Cleanup Loongson-2F's gpio driver
Date: Thu, 26 Mar 2015 11:12:12 +0900
Message-ID: <CAAVeFuLb7TOYfG_L7PBmAVAFEVeybCSU19W+_j2WZLF-Q5qNow@mail.gmail.com>
References: <1426213595-28454-1-git-send-email-chenhc@lemote.com>
 <CAAVeFuLytDZwo-=Q3DSxS7jLWbr4Jgf8BsBr9VGptBBu4SzZZg@mail.gmail.com>
 <CAAhV-H5i+ysaJi1=6ftyY_82yGBZnCqpUmCV2ayMVMDFw0uWVQ@mail.gmail.com>
 <CAAVeFuLF7tHgqXbX1MAikM67DwSu729eG0JcBiipSAG=AeBfOQ@mail.gmail.com> <20150325180927.GI1385@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:35610 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819AbbCZCMc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2015 22:12:32 -0400
Received: by ieclw3 with SMTP id lw3so36563617iec.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2015 19:12:32 -0700 (PDT)
In-Reply-To: <20150325180927.GI1385@linux-mips.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Huacai Chen <chenhc@lemote.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Thanks Ralf!

Huacai, since these 3 patches are standalone, would you mind
re-sending them in their own series to Linus Walleij, myself and the
linux-gpio list along with Ralf's ack? It will improve their
visibility and make it easier to merge them. I will give my ack/review
tag on this new series.

Thanks!

On Thu, Mar 26, 2015 at 3:09 AM, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Wed, Mar 25, 2015 at 11:19:01AM +0900, Alexandre Courbot wrote:
>
>> On Wed, Mar 25, 2015 at 10:15 AM, Huacai Chen <chenhc@lemote.com> wrote:
>> > I think these three patches can go to GPIO tree, because it has no
>> > relationship with others in this series.
>>
>> In that case we would need a ack from the MIPS maintainers to move the
>> code into drivers/gpio/.
>
> Yes, please.  For all three patches:
>
> Acked-by: Ralf Baechle <ralf@linux-mips.org>
>
>   Ralf
