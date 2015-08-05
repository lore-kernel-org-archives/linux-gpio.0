From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] gpio/mxc: implement reading output gpio value
Date: Wed, 5 Aug 2015 15:11:40 -0300
Message-ID: <CAOMZO5DPYL43QNwYRiGJ_rd2eqm64wg+zACK6viWbC_aFH=qsQ@mail.gmail.com>
References: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
	<1438795388-22743-3-git-send-email-edubezval@gmail.com>
	<CAOMZO5C3mh+vYV_ZHA8hAq2UwY_TcO5sZxqLQDyNvs0VuVvJAg@mail.gmail.com>
	<20150805180215.GA4161@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:35073 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780AbbHESLm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2015 14:11:42 -0400
In-Reply-To: <20150805180215.GA4161@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ulises Brindis <ubrindis56@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>

Hi Eduardo,

On Wed, Aug 5, 2015 at 3:02 PM, Eduardo Valentin <edubezval@gmail.com> wrote:
>
> Hello Fabio,
>
> On Wed, Aug 05, 2015 at 02:43:05PM -0300, Fabio Estevam wrote:
>> Hi Eduardo,
>>
>> On Wed, Aug 5, 2015 at 2:23 PM, Eduardo Valentin <edubezval@gmail.com> wrote:
>> > In current implementation, reading the value of an output gpio
>> > always return 0. The reason is because when a gpio is configured
>>
>> Have you tried setting the SION bit for the pad?
>
> No, I haven't. From the bit description, it looks like it does a
> different thing of what we would achieve with this patch. The SION bit
> is a overwrite to the pad configuration. That is, the pin will be INPUT
> always.
>
> We don't want to force it to be input. We simply want to be able to read
> the value of an output GPIO. That is achievable by reading a different
> register. In case the GPIO is configured as output, the GPIO block
> documentation states its value can be read from GPIO_PSR.
> This approach works fine, as the GPIO will be output and we can still
> read its value.

Setting the SION bit allows you to do exactly that. Please see:
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/271774.html

Regards,

Fabio Estevam
