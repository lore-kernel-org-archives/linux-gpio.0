From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [linux-sunxi] Re: [PATCH] clk: sunxi: Add missing H3 apb0 clock
 documentation
Date: Thu, 18 Feb 2016 20:42:56 +0100
Message-ID: <20160218194255.GD18745@box2.japko.eu>
References: <CACRpkdbfNeh7_=3ReQtJc7OxkkQEn+BUhZ0O0SKnFsRD=WZiUQ@mail.gmail.com>
 <1455807809-30827-1-git-send-email-k@japko.eu>
 <CAGb2v67PiQHVQfhbsk2f3aQFOaDXHy3P+NJDoTw-+GshubWaYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from box2.japko.eu ([91.121.152.53]:35984 "EHLO box2.japko.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1946652AbcBRToB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 18 Feb 2016 14:44:01 -0500
Content-Disposition: inline
In-Reply-To: <CAGb2v67PiQHVQfhbsk2f3aQFOaDXHy3P+NJDoTw-+GshubWaYQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Krzysztof Adamski <krzysztof.adamski@tieto.com>, Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Jens Kuske <jenskuske@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>

On Thu, Feb 18, 2016 at 09:07:16AM -0800, Chen-Yu Tsai wrote:
>On Thu, Feb 18, 2016 at 7:03 AM, Krzysztof Adamski
><krzysztof.adamski@tieto.com> wrote:
>> allwinner,sun8i-h3-apb0-gates-clk was added by
>> commit ba83a11104ae ("pinctrl: sunxi: Add H3 R_PIO controller support")
>> but the patch was missing proper binding documentation. This patch fixes
>> this issue.
>
>What are you talking about? The commit you mentioned only adds the pinctrl
>driver. Your H3 PRCM related clock and reset patches are still pending.
>No need for this patch as your earlier patches includes this.

Damn, I messed up patches, I must have been tired or something. It was 
documentation for "allwinner,sun8i-h3-r-pinctrl" that was missing. I'm 
sending a new patch. Sorry for confusion.

Best regards,
Krzysztof Adamski
