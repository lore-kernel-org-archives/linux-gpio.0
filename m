From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mcp23s08: Add support for level triggered interrupts
Date: Fri, 1 Apr 2016 15:29:21 +0200
Message-ID: <CACRpkdYJD+U9LSSZKdUR0Ax+cZZN_kbdhaOUsKp=wgcfzPXZgA@mail.gmail.com>
References: <1458752487-32767-1-git-send-email-alexander.stein@systec-electronic.com>
	<CACRpkdZKX28G_MvvNhGB7v0Mwsfhbq3gnkmNiCM9UzRsmdJCxw@mail.gmail.com>
	<5801670.ZsrEAbzXnC@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:36338 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753506AbcDAN3W convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 09:29:22 -0400
Received: by mail-oi0-f45.google.com with SMTP id r187so105007504oih.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2016 06:29:22 -0700 (PDT)
In-Reply-To: <5801670.ZsrEAbzXnC@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 31, 2016 at 10:58 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> On Thursday 31 March 2016 10:41:24, Linus Walleij wrote:

> From the reference manual:
>> The INTCAP register captures the GPIO port value at
>> the time the interrupt occurred. The register is =E2=80=98read
>> only=E2=80=99 and is updated only when an interrupt occurs. The
>> register will remain unchanged until the interrupt is
>> cleared via a read of INTCAP or GPIO.
>
> So, i guess you're right. Although currently I don't know why
> handle_simple_irq would not work if this would not be the case.

The usual construction is that for edge triggered interrupts
there is an ACK register where a bit goes to "1" whenever it
triggers on an edge, and this must be taken down by an explicit
read or even write of the ACK registers.

Level triggered interrupts by contrast, are just a register
reflecting the value of the interrupt line: it only remains set
to "1" as long as the external source holds it high, and will
go low as soon as the device causing he interrupt releases
it.

Therefor level triggered interrupts often do not need any
explicit ACK at all.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
