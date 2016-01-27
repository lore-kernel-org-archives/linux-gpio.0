From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] pinctrl: mvebu: add 98dx1135-pinctrl
Date: Wed, 27 Jan 2016 14:46:20 +0100
Message-ID: <20160127144620.2ab67411@free-electrons.com>
References: <1449794673-9461-1-git-send-email-chris.packham@alliedtelesis.co.nz>
	<CACRpkdbNPOCNLA+XgQ=J-z2PyTuh+2=uLBjhYoJix2cXsA_a2Q@mail.gmail.com>
	<56A8C901.9050508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:53943 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932469AbcA0NqX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 08:46:23 -0500
In-Reply-To: <56A8C901.9050508@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Maxime Coquelin <maxime.coquelin@st.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Patrice CHOTARD <patrice.chotard@st.com>, Fabian Frederick <fabf@skynet.be>, valentin.longchamp@keymile.com

Hello,

On Wed, 27 Jan 2016 14:41:21 +0100, Sebastian Hesselbarth wrote:
> On 27.01.2016 14:10, Linus Walleij wrote:
> > On Fri, Dec 11, 2015 at 1:44 AM, Chris Packham
> > <chris.packham@alliedtelesis.co.nz> wrote:
> >> The Marvell 98DX1135 is a switch chip with an integrated CPU,
> >> similar to the MV98DX4122. From a pinctrl point of view the only
> >> difference is that NF_REN, NF_WEN, NF_ALE and NF_CEN lines are
> >> MPP pins instead of dedicated ones.
> >>
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >
> > I guess this patch falls in your territory, please look at it if you can.
> >
> > If you don't have it, ask Chris to resend it.
> 
> Yes, please resend and make sure you also include
> linux-arm-kernel@lists.infradead.org which is the ARM Linux
> mailing list.
> 
> > I suspect the patch needs to be rebased anyway.
> 
> We'll see. Usually 98dx-something are pretty much Kirkwoods
> anyway.

The one Chris is working on is actually more Armada XP similar as far
as I remember (or maybe it's a different one Chris is working on now?).

But yes, I've looked for Chris patch on LAKML and couldn't find it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
