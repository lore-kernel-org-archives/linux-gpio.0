From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6] Fix sun7i pin assignment for IRQ's
Date: Thu, 25 Feb 2016 15:16:46 +0100
Message-ID: <CACRpkdYmf8-ZPV5q9H3cdZtQDUkbx=bcrVg9a8M3zEAifXxF9A@mail.gmail.com>
References: <1456161251-2303-1-git-send-email-henry@nitronetworks.nl>
	<20160225005412.GB4736@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34248 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932951AbcBYOQr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 09:16:47 -0500
Received: by mail-ob0-f176.google.com with SMTP id ts10so49542309obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 06:16:47 -0800 (PST)
In-Reply-To: <20160225005412.GB4736@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Henry Paulissen <draakje197@gmail.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Maxime Coquelin <maxime.coquelin@st.com>, Lee Jones <lee@kernel.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabian Frederick <fabf@skynet.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Feb 25, 2016 at 1:54 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
>
> Usually, the patch title should be prefixed by the subsystem it
> applies to so that maintainer and reviewers can spot it more
> easily. In this case, it would be something like
>
> pinctrl: sunxi: Fix sun7i pin assignment for IRQ's
>
> On Mon, Feb 22, 2016 at 06:14:07PM +0100, Henry Paulissen wrote:
>> After testing IRQ pins we found some bugs in the pinctrl declaration.
>> Both PI* and PC* pins didn't work. PI* pins seemed to be connected
>> to the wrong mux and PC* pins waren't working at all.
>>
>> Please note that the A20 soc manual is contradicting between version
>> and even within the same document for both the PI and PC pins.
>
> Which sections are in contradiction?
>
>> Patch is based on testing with the hardware itself.
>
> How did you test it? Using the sysfs API, or did you have any hardware
> connected to it?

I'm taking this patch out of my tree now following Maxime's comments.

I'm a bit annoyed that it is iterating too quickly as well, I will
wait and see for a while.

Yours,
Linus Walleij
