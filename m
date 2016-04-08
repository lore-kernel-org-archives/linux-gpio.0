From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 12/18] dt-bindings: Add PLX Technology OXNAS pinctrl
 and gpio bindings
Date: Fri, 8 Apr 2016 13:16:01 +0200
Message-ID: <CACRpkda75E+B=vsgouks4ei=jc=Q-Uj1fzQnhGR4sVJBOkMBnQ@mail.gmail.com>
References: <1458838215-23314-1-git-send-email-narmstrong@baylibre.com>
	<1458838215-23314-13-git-send-email-narmstrong@baylibre.com>
	<20160325144834.GA27177@rob-hp-laptop>
	<CACRpkdbem5a_aLTHErp0ZvanwvVPbGnDiWxM5e7iX_FdHtXprQ@mail.gmail.com>
	<CAL_JsqLsKEb+dWLg9VD3p=kjgEV84_r8z89p0QgMJWKqjrGNpw@mail.gmail.com>
	<56FE8602.8020405@baylibre.com>
	<CAL_JsqJS31gNS-dYXQvkLHb=qsVz4Vccztufnd08yfD+p52v_w@mail.gmail.com>
	<56FE984C.10807@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36380 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758043AbcDHLQD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Apr 2016 07:16:03 -0400
Received: by mail-ob0-f174.google.com with SMTP id j9so70586534obd.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Apr 2016 04:16:02 -0700 (PDT)
In-Reply-To: <56FE984C.10807@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Fri, Apr 1, 2016 at 5:48 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> On 04/01/2016 05:19 PM, Rob Herring wrote:
>> On Fri, Apr 1, 2016 at 9:30 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>
>>> What should I use ?
>>
>> Maybe gpio-ranges as you asked. Not really sure as I haven't used it.
>
> If I use gpio-ranges I can get rid of gpio-bank and ngpios properties.

I'm not super-happy about that but I see that it can be used
this way... hm.

Yours,
Linus Walleij
