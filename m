From: Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH V3 2/5] MIPS: Loongson: Add Loongson-3A/3B GPIO support
Date: Thu, 13 Nov 2014 22:01:47 +0800
Message-ID: <CAAhV-H5ePQ8m5U_UvpDjMb2wS3cAK3ua+jLA_2A8XE=JfVyE7A@mail.gmail.com>
References: <1415794700-7579-1-git-send-email-chenhc@lemote.com>
	<CAAVeFuJ1+y8wooVAHMST9zC4_Z8SE6x=VASsFkUwCVFcA8xuLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:43580 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932756AbaKMOBs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Nov 2014 09:01:48 -0500
Received: by mail-ig0-f179.google.com with SMTP id r10so4990666igi.6
        for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2014 06:01:47 -0800 (PST)
In-Reply-To: <CAAVeFuJ1+y8wooVAHMST9zC4_Z8SE6x=VASsFkUwCVFcA8xuLg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hongbing Hu <huhb@lemote.com>

OK, I'll split.

Huacai

On Thu, Nov 13, 2014 at 2:26 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Wed, Nov 12, 2014 at 9:18 PM, Huacai Chen <chenhc@lemote.com> wrote:
>> Improve Loongson-2's GPIO driver to support Loongson-3A/3B, and move it
>> to drivers/gpio directory.
>
> Could you split this in two patches:
> 1/2: move GPIO driver to drivers/gpio
> 2/2: support new devices in GPIO driver
>
> and add the "-C" option to git format-patch so that file renaming gets
> detected. This will make the changes easier to evaluate.
>
> Thanks,
> Alex.
>
