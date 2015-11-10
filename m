From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 4/7] ARM: at91/dt: sama5d2: add pio controller node
Date: Mon, 9 Nov 2015 16:30:34 -0800
Message-ID: <CAOesGMhXtACRaTurWfQgHNr_mU+VF9TjQJz5wQ4RsSVS+WZ0cA@mail.gmail.com>
References: <1442417823-15850-1-git-send-email-ludovic.desroches@atmel.com>
	<1442417823-15850-5-git-send-email-ludovic.desroches@atmel.com>
	<CACRpkdapS-Vi_F-MqOFOPTHa2+zbrsPfPsbQA-Eks+tR3Wjg2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f182.google.com ([209.85.160.182]:33916 "EHLO
	mail-yk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751078AbbKJAae (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2015 19:30:34 -0500
Received: by ykfs79 with SMTP id s79so64171767ykf.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2015 16:30:34 -0800 (PST)
In-Reply-To: <CACRpkdapS-Vi_F-MqOFOPTHa2+zbrsPfPsbQA-Eks+tR3Wjg2A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>

Hi Linus,

On Mon, Sep 21, 2015 at 11:24 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Sep 16, 2015 at 8:37 AM, Ludovic Desroches
> <ludovic.desroches@atmel.com> wrote:
>
>> Add pio4 controller node to enable pinmux and gpio.
>>
>> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>
> Patch applied.

Please don't merge DT changes through driver trees unless there's a
very specific reason to do so, since it introduces random conflicts.


Thanks!

-Olof
