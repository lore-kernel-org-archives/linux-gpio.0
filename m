From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Documentation: power: reset: move gpio-{poweroff|restart}
 to proper place
Date: Tue, 19 Apr 2016 10:19:38 +0200
Message-ID: <CACRpkdZKS77CQpf5xQ4aA++jg6SH32BptoSbDCg0yugF4O0Jtw@mail.gmail.com>
References: <1460476853-3306-1-git-send-email-wsa@the-dreams.de>
	<CACRpkdaUj5w3zkjWVf1GML3reeDnRpT8avOPkRB6_qFXB6EGjw@mail.gmail.com>
	<CAL_JsqKK1QmGdyae-P9SoP2-7JiLK1XCyskxbd-wrn+7CidMJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36551 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752625AbcDSITj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2016 04:19:39 -0400
Received: by mail-ob0-f173.google.com with SMTP id j9so6441034obd.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2016 01:19:39 -0700 (PDT)
In-Reply-To: <CAL_JsqKK1QmGdyae-P9SoP2-7JiLK1XCyskxbd-wrn+7CidMJw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org

On Fri, Apr 15, 2016 at 6:53 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Apr 15, 2016 at 2:48 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Apr 12, 2016 at 6:00 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>
>>> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>
>>> I did only find them after a fuzzy search, so let them be where one
>>> would expect them.
>>>
>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> I saw this the other day too I agree.
>> Sebastian: are you OK that I move this by committing the patch to the GPIO tree?
>> DT maintainers: OK?
>
> Acked-by: Rob Herring <robh@kernel.org>
>
> Seems like this should go thru my tree though, but I don't have the patch.

I have it merged in my tree, is is OK or shall I extract it and send
it to you?

Yours,
Linus Walleij
