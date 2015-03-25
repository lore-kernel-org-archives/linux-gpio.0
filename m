From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH V8 3/8] MIPS: Cleanup Loongson-2F's gpio driver
Date: Wed, 25 Mar 2015 19:09:27 +0100
Message-ID: <20150325180927.GI1385@linux-mips.org>
References: <1426213595-28454-1-git-send-email-chenhc@lemote.com>
 <CAAVeFuLytDZwo-=Q3DSxS7jLWbr4Jgf8BsBr9VGptBBu4SzZZg@mail.gmail.com>
 <CAAhV-H5i+ysaJi1=6ftyY_82yGBZnCqpUmCV2ayMVMDFw0uWVQ@mail.gmail.com>
 <CAAVeFuLF7tHgqXbX1MAikM67DwSu729eG0JcBiipSAG=AeBfOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:53899 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755042AbbCYSJg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2015 14:09:36 -0400
Received: from localhost.localdomain ([127.0.0.1]:53041 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27009490AbbCYSJdmIwC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2015 19:09:33 +0100
Content-Disposition: inline
In-Reply-To: <CAAVeFuLF7tHgqXbX1MAikM67DwSu729eG0JcBiipSAG=AeBfOQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Huacai Chen <chenhc@lemote.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 25, 2015 at 11:19:01AM +0900, Alexandre Courbot wrote:

> On Wed, Mar 25, 2015 at 10:15 AM, Huacai Chen <chenhc@lemote.com> wrote:
> > I think these three patches can go to GPIO tree, because it has no
> > relationship with others in this series.
> 
> In that case we would need a ack from the MIPS maintainers to move the
> code into drivers/gpio/.

Yes, please.  For all three patches:

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
