From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mpc8xxx: Correct irq handler function
Date: Tue, 25 Oct 2016 11:16:04 +0200
Message-ID: <CACRpkdas+xK=Stoa+dbuQky6i4P3UqFbQcj4XawKmKjgw_thBg@mail.gmail.com>
References: <1477035088-20587-1-git-send-email-Gang.Liu@nxp.com>
 <CACRpkdbRdfybOPX6WNjH9R90Z1vJE9L0dRDg8HTSvF4kAapdbg@mail.gmail.com> <HE1PR0401MB241247DDF05D79E061EAEC2982A90@HE1PR0401MB2412.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:37245 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755903AbcJYJQF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 05:16:05 -0400
Received: by mail-qk0-f175.google.com with SMTP id w69so15977321qka.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2016 02:16:05 -0700 (PDT)
In-Reply-To: <HE1PR0401MB241247DDF05D79E061EAEC2982A90@HE1PR0401MB2412.eurprd04.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gang Liu <gang.liu@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mingkai Hu <mingkai.hu@nxp.com>, Leo Li <leoyang.li@nxp.com>

On Mon, Oct 24, 2016 at 5:46 AM, Gang Liu <gang.liu@nxp.com> wrote:
>> On Fri, Oct 21, 2016 at 9:31 AM, Liu Gang <Gang.Liu@nxp.com> wrote:
>>
>> > From the beginning of the gpio-mpc8xxx.c, the "handle_level_irq"
>> > has being used to handle GPIO interrupts in the PowerPC/Layerscape
>> > platforms. But actually, almost all PowerPC/Layerscape platforms
>> > assert an interrupt request upon either a high-to-low change or any
>> > change on the state of the signal.
>> >
>> > So the "handle_level_irq" is not reasonable for PowerPC/Layerscape
>> > GPIO interrupt, it should be "handle_edge_irq". Otherwise the system
>> > may lost some interrupts from the PIN's state changes.
>> >
>> > Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
>>
>> Yes and especially so since this irqchip implements .irq_ack() and unless you
>> use the edge handler it will never be called.
>>
>> Patch applied for fixes, tell me if it also needs to go into stable.
>>
> [Liu Gang] yes, please also put it into stable. Thanks!

Ooops too late. Will tell Greg to pick this separately.

Yours,
Linus Walleij
