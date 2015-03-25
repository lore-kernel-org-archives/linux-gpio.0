From: Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH V8 3/8] MIPS: Cleanup Loongson-2F's gpio driver
Date: Wed, 25 Mar 2015 09:15:33 +0800
Message-ID: <CAAhV-H5i+ysaJi1=6ftyY_82yGBZnCqpUmCV2ayMVMDFw0uWVQ@mail.gmail.com>
References: <1426213595-28454-1-git-send-email-chenhc@lemote.com>
	<CAAVeFuLytDZwo-=Q3DSxS7jLWbr4Jgf8BsBr9VGptBBu4SzZZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:34458 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751830AbbCYBPe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2015 21:15:34 -0400
Received: by wgs2 with SMTP id 2so9745017wgs.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2015 18:15:33 -0700 (PDT)
In-Reply-To: <CAAVeFuLytDZwo-=Q3DSxS7jLWbr4Jgf8BsBr9VGptBBu4SzZZg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

I think these three patches can go to GPIO tree, because it has no
relationship with others in this series.

Huacai

On Mon, Mar 23, 2015 at 2:29 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Fri, Mar 13, 2015 at 11:26 AM, Huacai Chen <chenhc@lemote.com> wrote:
>> This cleanup is prepare to move the driver to drivers/gpio. Custom
>> definitions of gpio_get_value()/gpio_set_value() are dropped.
>
> I suppose this is starting to look ok, at least patches 3, 4 and 5
> which are of interest for GPIO. I wonder which tree they should be
> merged through, MIPS or GPIO? Not seeing the rest of the series, I
> cannot make a suggestion.
>
