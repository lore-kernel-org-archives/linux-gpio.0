From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2] pinctrl: sunxi: H3 requires irq_read_needs_mux
Date: Fri, 5 Feb 2016 21:51:56 +0800
Message-ID: <CAGb2v65ZTBQZhFvesHPdwXDbwuVWcOQ+KUu82DWae6K8ycAxMA@mail.gmail.com>
References: <20160203075713.GA23312@box2.japko.eu> <CACRpkdbVtLYRku03bbnT=f7Ex1FoJqBv4Z6nY7pWkHy6wvHUfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:46606 "EHLO
	smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753266AbcBENwU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2016 08:52:20 -0500
In-Reply-To: <CACRpkdbVtLYRku03bbnT=f7Ex1FoJqBv4Z6nY7pWkHy6wvHUfg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Adamski <k@japko.eu>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Fabian Frederick <fabf@skynet.be>, Vishnu Patekar <vishnupatekar0510@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>

On Fri, Feb 5, 2016 at 9:39 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Feb 3, 2016 at 8:57 AM, Krzysztof Adamski <k@japko.eu> wrote:
>
>> It seems that on H3, just like on A10, when GPIOs are configured as
>> external interrupt data registers does not contain their value.  When
>> value is read, GPIO function must be temporary switched to input for
>> reads.
>>
>> Signed-off-by: Krzysztof Adamski <k@japko.eu>
>
> 1. Waiting for Maxime's ACK on this patch.

Maxime already acked v1.

Acked-by: Chen-Yu Tsai <wens@csie.org>

> 2. Is this a regression that need to go in to fixes?

This driver was introduced in 4.5-rc1. It'd be nice if this fix could make
it in 4.5. :)


Thanks
ChenYu
