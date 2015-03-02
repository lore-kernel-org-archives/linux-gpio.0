From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] pinctrl: imx: do not implicitly set pin regs to -1
Date: Mon, 02 Mar 2015 14:42:01 +0100
Message-ID: <43491e2cb2c520d8f15d90ae99a82f28@agner.ch>
References: <1423240256-27210-1-git-send-email-stefan@agner.ch>
 <20150302114516.GC3040@dragon> <20150302125935.GC7865@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:37339 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690AbbCBNmF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 08:42:05 -0500
In-Reply-To: <20150302125935.GC7865@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org

On 2015-03-02 13:59, Uwe Kleine-K=C3=B6nig wrote:
> Hello Shawn
>=20
> On Mon, Mar 02, 2015 at 07:45:17PM +0800, Shawn Guo wrote:
>> On Fri, Feb 06, 2015 at 05:30:56PM +0100, Stefan Agner wrote:
>> > Commit 3dac1918a491 ("pinctrl: imx: detect uninitialized pins") ne=
eds
>> > the values in struct imx_pin_reg to be -1. This has been done in a
>> > rather unorthodox way by setting the memory to 0xff using memset..=
=2E
>> > Use a proper for loop to initialize the whole array with -1.
>> >
>> > Signed-off-by: Stefan Agner <stefan@agner.ch>
>>
>> Acked-by: Shawn Guo <shawn.guo@linaro.org>
> too late. This patch is part of 4.0-rc1 (4ff0f034e95d).

This is not the same patch. The patch you are mentioning is actually
fixing a bug introduce in the change where we set -1 for uninitialized
pins. This patch is solving the weird assignment of the initial value..=
=2E

--
Stefan

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
