From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix up device tree bindings
Date: Fri, 16 Jan 2015 13:28:20 +0100
Message-ID: <CACRpkda9YXi2MJnC_r_CWcfHM7i10oZ2d6VZUQnkix9r_M8fhg@mail.gmail.com>
References: <1420924457-12730-1-git-send-email-linus.walleij@linaro.org>
	<CAL_JsqKQJzUOWE2oJsABH3Aa1cCD+526L0G7-WRH=LbKFxesyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:59901 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751595AbbAPM2V (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jan 2015 07:28:21 -0500
Received: by mail-ig0-f180.google.com with SMTP id h15so2998281igd.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2015 04:28:20 -0800 (PST)
In-Reply-To: <CAL_JsqKQJzUOWE2oJsABH3Aa1cCD+526L0G7-WRH=LbKFxesyQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 13, 2015 at 9:06 PM, Rob Herring <robherring2@gmail.com> wrote:
> On Sat, Jan 10, 2015 at 3:14 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> After the Nomadik pin controller was force migrated to generic pin
>> control bindings, some leftovers in the documentation need to be
>> cleaned up. The code and device trees are already migrated.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Applied for 3.20. Thanks.

Oh thanks! :)

I was thinking I'd take it through the pinctrl tree but the
DT tree is even better.

Yours,
Linus Walleij
