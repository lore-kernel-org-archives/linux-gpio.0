From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V5 2/7] MIPS: Cleanup Loongson-2F's gpio driver
Date: Sat, 29 Nov 2014 00:03:41 +0900
Message-ID: <CAAVeFuJZAxvVCpH0vQmYvF48F0XRoGNThFpDXjCPxQ_rrakHyg@mail.gmail.com>
References: <1416561389-1046-1-git-send-email-chenhc@lemote.com>
 <CAAVeFu+CUCja6jxb0XONj80-6te1t31A49F4owNkWkoy7PcHuQ@mail.gmail.com> <tencent_60EBDA3907E4C1985C37621B@qq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:39474 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212AbaK1PEC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Nov 2014 10:04:02 -0500
Received: by mail-ig0-f173.google.com with SMTP id r2so10027231igi.6
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2014 07:04:02 -0800 (PST)
In-Reply-To: <tencent_60EBDA3907E4C1985C37621B@qq.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, wuzhangjin <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 28, 2014 at 10:14 PM, =E9=99=88=E5=8D=8E=E6=89=8D <chenhc@l=
emote.com> wrote:
> I'm afraid that ARCH_HAVE_CUSTOM_GPIO_H cannot be simply removed, bec=
ause ARCH_HAVE_CUSTOM_GPIO_H is slected by CONFIG_MIPS, other MIPS CPU =
(not Loongson) may need it.

Mmm, but all the custom gpio.h are in the mach- subdirectories, so
shouldn't this option be selected by each individual machine instead
of CONFIG_MIPS? If the MIPS maintainers agree with that, please add
one patch to do this change - otherwise just ignore my comment.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
