From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V8 3/8] MIPS: Cleanup Loongson-2F's gpio driver
Date: Wed, 25 Mar 2015 11:19:01 +0900
Message-ID: <CAAVeFuLF7tHgqXbX1MAikM67DwSu729eG0JcBiipSAG=AeBfOQ@mail.gmail.com>
References: <1426213595-28454-1-git-send-email-chenhc@lemote.com>
 <CAAVeFuLytDZwo-=Q3DSxS7jLWbr4Jgf8BsBr9VGptBBu4SzZZg@mail.gmail.com> <CAAhV-H5i+ysaJi1=6ftyY_82yGBZnCqpUmCV2ayMVMDFw0uWVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:36074 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752194AbbCYCTW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2015 22:19:22 -0400
Received: by igbud6 with SMTP id ud6so89507222igb.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2015 19:19:21 -0700 (PDT)
In-Reply-To: <CAAhV-H5i+ysaJi1=6ftyY_82yGBZnCqpUmCV2ayMVMDFw0uWVQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 25, 2015 at 10:15 AM, Huacai Chen <chenhc@lemote.com> wrote:
> I think these three patches can go to GPIO tree, because it has no
> relationship with others in this series.

In that case we would need a ack from the MIPS maintainers to move the
code into drivers/gpio/.

>
> Huacai
>
> On Mon, Mar 23, 2015 at 2:29 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
>> On Fri, Mar 13, 2015 at 11:26 AM, Huacai Chen <chenhc@lemote.com> wrote:
>>> This cleanup is prepare to move the driver to drivers/gpio. Custom
>>> definitions of gpio_get_value()/gpio_set_value() are dropped.
>>
>> I suppose this is starting to look ok, at least patches 3, 4 and 5
>> which are of interest for GPIO. I wonder which tree they should be
>> merged through, MIPS or GPIO? Not seeing the rest of the series, I
>> cannot make a suggestion.
>>
