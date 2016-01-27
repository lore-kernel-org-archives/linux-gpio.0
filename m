From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] pinctrl: mvebu: add 98dx1135-pinctrl
Date: Wed, 27 Jan 2016 19:48:08 +0000
Message-ID: <fe421151d8104b71a6fd603a95d6b904@svr-chch-ex1.atlnz.lc>
References: <1449794673-9461-1-git-send-email-chris.packham@alliedtelesis.co.nz>
 <CACRpkdbNPOCNLA+XgQ=J-z2PyTuh+2=uLBjhYoJix2cXsA_a2Q@mail.gmail.com>
 <56A8C901.9050508@gmail.com> <20160127144620.2ab67411@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42969 "EHLO
	gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933603AbcA0TsX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 14:48:23 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8F89E806F4
	for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 08:48:17 +1300 (NZDT)
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Maxime Coquelin <maxime.coquelin@st.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Patrice CHOTARD <patrice.chotard@st.com>, Fabian Frederick <fabf@skynet.be>, "valentin.longchamp@keymile.com" <valentin.longchamp@keymile.com>

On 01/28/2016 02:46 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 27 Jan 2016 14:41:21 +0100, Sebastian Hesselbarth wrote:
>> On 27.01.2016 14:10, Linus Walleij wrote:
>>> On Fri, Dec 11, 2015 at 1:44 AM, Chris Packham
>>> <chris.packham@alliedtelesis.co.nz> wrote:
>>>> The Marvell 98DX1135 is a switch chip with an integrated CPU,
>>>> similar to the MV98DX4122. From a pinctrl point of view the only
>>>> difference is that NF_REN, NF_WEN, NF_ALE and NF_CEN lines are
>>>> MPP pins instead of dedicated ones.
>>>>
>>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>>
>>> I guess this patch falls in your territory, please look at it if you can.
>>>
>>> If you don't have it, ask Chris to resend it.
>>
>> Yes, please resend and make sure you also include
>> linux-arm-kernel@lists.infradead.org which is the ARM Linux
>> mailing list.
>>
>>> I suspect the patch needs to be rebased anyway.
>>
>> We'll see. Usually 98dx-something are pretty much Kirkwoods
>> anyway.
>
> The one Chris is working on is actually more Armada XP similar as far
> as I remember (or maybe it's a different one Chris is working on now?).

This one is for a different product, and it's a variation of the 
98DX4122 which is indeed "pretty much Kirkwood".

>
> But yes, I've looked for Chris patch on LAKML and couldn't find it.

I'll rebase/resend. I still have an outstanding question about style but 
we can move that to the LAKML.

>
> Best regards,
>
> Thomas
>

