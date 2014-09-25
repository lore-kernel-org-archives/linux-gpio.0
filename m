From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: only enable kona driver on BCM_MOBILE or for
 compile testing
Date: Thu, 25 Sep 2014 09:51:35 +0200
Message-ID: <CACRpkdarku3XYSJ+-cUmd-FdK8sqd6=XBC6NJ9RL4V4hHh0vmA@mail.gmail.com>
References: <1392990146-18916-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<CACRpkdZg5uoP5LurL5vOPCaKQu2B=neybuo=gwM_JT7UAhRkjg@mail.gmail.com>
	<530FB808.5050802@broadcom.com>
	<20140924080625.GE3755@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:64386 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751505AbaIYHvg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Sep 2014 03:51:36 -0400
Received: by mail-ie0-f173.google.com with SMTP id tr6so13325100ieb.32
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2014 00:51:35 -0700 (PDT)
In-Reply-To: <20140924080625.GE3755@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Markus Mayer <mmayer@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Sep 24, 2014 at 10:06 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Thu, Feb 27, 2014 at 02:11:20PM -0800, Markus Mayer wrote:
>> On 14-02-27 01:16 AM, Linus Walleij wrote:
>> >On Fri, Feb 21, 2014 at 2:42 PM, Uwe Kleine-K=C3=B6nig
>> ><u.kleine-koenig@pengutronix.de> wrote:
>> >
>> >>This change makes it easier to configure a kernel for a real machi=
ne by
>> >>not showing the option to enable it at all if COMPILE_TEST is off.
>> >>
>> >>Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.=
de>
>> >
>> >Markus: can you ACK this patch?
>>
>> Acked-by: Markus Mayer <mmayer@broadcom.com>
> ping!

Patch applied with Markus' ACK!

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
