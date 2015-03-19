From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Fw: [3.18.3] poll() on gpio pins broken
Date: Thu, 19 Mar 2015 09:30:19 +0100
Message-ID: <CACRpkdbjoK_fQrWSL5S2L9sjdTU3MUogSJt5qdeL8QgxGqifNQ@mail.gmail.com>
References: <CAAVeFuKbgFqHKR5F_VeF9Ti=FvijK2CScNsUeapSpNde9OJqSA@mail.gmail.com>
	<CACRpkdajCuob668o_9oF+4pomjaAkLz58Kg4Hx-ibbkBQv=h3w@mail.gmail.com>
	<CAAVeFuJxki5mqY91ugumpDEuq9BMbBin4ypr1H2qcA_uzWGT9Q@mail.gmail.com>
	<20150302072655.GA17089@deathray>
	<CAAVeFu+J0toG+3Yzncw+c11Fk_FK0oQeHBB=0MmExCX3z9Sh0g@mail.gmail.com>
	<CACRpkdZRXAokttK7uc6PtfOGvRa74ydQRo6Kn1V1ofGUcGbSiQ@mail.gmail.com>
	<CAAVeFuJ+T-4ew+ACJpestMtH4D+ggcwOD3SumAwYNO5yGT=jiQ@mail.gmail.com>
	<CACRpkdZBc3ry_0sOVRpwnTHNZ1M7CmHw9Us_XPen3pQQP0OazA@mail.gmail.com>
	<20150309202258.GA3398@deathray>
	<CACRpkdaC6A1D-rOeCywR9QHRc9wdKTcHVjEMfYCHrg0Jz0vwxg@mail.gmail.com>
	<20150317164724.GA3610@deathray>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33813 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbbCSIaU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2015 04:30:20 -0400
Received: by oier21 with SMTP id r21so59005097oie.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2015 01:30:19 -0700 (PDT)
In-Reply-To: <20150317164724.GA3610@deathray>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, folkert <folkert@vanheusden.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 17, 2015 at 5:47 PM, Michael Welling <mwelling@ieee.org> wrote:
> On Tue, Mar 17, 2015 at 05:39:01PM +0100, Linus Walleij wrote:

>> I would more think about deprecating the sysfs in favor of the dev
>> node.
>
> What happens to all of the users of the sysfs interface when this happens?

They keep using a deprecated interface instead of an encouraged
interface.

>> But this is getting terribly academic since we're just talking, noone is
>> really implementing anything.
>
> Without a specification nothing is ever going to be implemented.

This is not a case of either/or but a case of both/and.

Yours,
Linus Walleij
