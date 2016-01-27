From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] pinctrl: mvebu: add 98dx1135-pinctrl
Date: Wed, 27 Jan 2016 14:41:21 +0100
Message-ID: <56A8C901.9050508@gmail.com>
References: <1449794673-9461-1-git-send-email-chris.packham@alliedtelesis.co.nz>
 <CACRpkdbNPOCNLA+XgQ=J-z2PyTuh+2=uLBjhYoJix2cXsA_a2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37920 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752792AbcA0Nl0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 08:41:26 -0500
Received: by mail-wm0-f53.google.com with SMTP id p63so26940103wmp.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 05:41:26 -0800 (PST)
In-Reply-To: <CACRpkdbNPOCNLA+XgQ=J-z2PyTuh+2=uLBjhYoJix2cXsA_a2Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Maxime Coquelin <maxime.coquelin@st.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Patrice CHOTARD <patrice.chotard@st.com>, Fabian Frederick <fabf@skynet.be>, valentin.longchamp@keymile.com

On 27.01.2016 14:10, Linus Walleij wrote:
> On Fri, Dec 11, 2015 at 1:44 AM, Chris Packham
> <chris.packham@alliedtelesis.co.nz> wrote:
>> The Marvell 98DX1135 is a switch chip with an integrated CPU,
>> similar to the MV98DX4122. From a pinctrl point of view the only
>> difference is that NF_REN, NF_WEN, NF_ALE and NF_CEN lines are
>> MPP pins instead of dedicated ones.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>
> I guess this patch falls in your territory, please look at it if you can.
>
> If you don't have it, ask Chris to resend it.

Yes, please resend and make sure you also include
linux-arm-kernel@lists.infradead.org which is the ARM Linux
mailing list.

> I suspect the patch needs to be rebased anyway.

We'll see. Usually 98dx-something are pretty much Kirkwoods
anyway.

Sebastian

