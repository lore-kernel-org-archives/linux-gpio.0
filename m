From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [linux-sunxi] Re: [PATCH v2 3/5] pinctrl: sunxi: Add H3 R_PIO
 controller support
Date: Mon, 15 Feb 2016 09:08:17 +0100
Message-ID: <20160215080816.GA6426@box2.japko.eu>
References: <1454448113-18810-1-git-send-email-k@japko.eu>
 <1454448113-18810-4-git-send-email-k@japko.eu>
 <CACRpkdZkSzcb0fmghkvsfRHpsU-SsSGPP6YvstAW7387HS0xJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from box2.japko.eu ([91.121.152.53]:54578 "EHLO box2.japko.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751944AbcBOIJJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 15 Feb 2016 03:09:09 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZkSzcb0fmghkvsfRHpsU-SsSGPP6YvstAW7387HS0xJw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Jens Kuske <jenskuske@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>

On Thu, Feb 11, 2016 at 02:21:15PM +0100, Linus Walleij wrote:
>On Tue, Feb 2, 2016 at 10:21 PM, Krzysztof Adamski <k@japko.eu> wrote:
>
>> H3 has additional PIO controller similar to what we can find on A23.
>> It's a 12 pin port, described in H3 Datasheet rev 1.1, pages 345-350.
>>
>> Signed-off-by: Krzysztof Adamski <k@japko.eu>
>
>Patch applied with Maxime's ACK.

Hi Linus,

You took v2 which does not add documentation for 
allwinner,sun8i-h3-r-pinctrl compatible that is added in this patch.  
This was fixed in v3. Should I prepare a patch for you that only adds 
this to the documentation or you can handle this by taking v3/v4 instead 
of this patch?

Best regards,
Krzysztof Adamski
