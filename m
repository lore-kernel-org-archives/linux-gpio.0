From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: gpio-pca953x.c
Date: Fri, 21 Nov 2014 17:39:52 +0200
Message-ID: <546F5CC8.6010503@ti.com>
References: <loom.20141112T153203-751@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:47571 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758654AbaKUPj7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 21 Nov 2014 10:39:59 -0500
In-Reply-To: <loom.20141112T153203-751@post.gmane.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Naitik Amin <naitik.amin@ametek.com>, linux-gpio@vger.kernel.org

On 11/12/2014 04:54 PM, Naitik Amin wrote:
> HI there,
>
> I am trying to use the gpio driver for pca953x with IRQ enabled config. When
> the device gets probbed, I gives me an error saying :
> "failed to set trigger mode 8"
>
> The probe called,
> ret = devm_request_threaded_irq(&client->dev,
> 					client->irq,
> 					   NULL,
> 					   pca953x_irq_handler,
> 					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> 					   dev_name(&client->dev), chip);
>
> with IRQF_TRIGGER_LOW as a flag

try to remove IRQF_TRIGGER_LOW

>
> I did some tracing and found out, irq set type, went to gic_set_type in irq-
> gic.c ( http://lxr.free-electrons.com/source/drivers/irqchip/irq-gic.c#L187 )
>
> But gic_set_type, only wants to see either IRQF_TRIGGER_HIGH OR
> IRQF_TRIGGER_LOW, thats why it returned.
if (type != IRQ_TYPE_LEVEL_HIGH && type != IRQ_TYPE_EDGE_RISING)

>
> Questions
> 1. Is it correct that irq set type went to gic_set_type, bcoz pca953x does
> provide one of itself.

Valid IRQ types are IRQ controller specific values.

You don't need all this magic in code any more if you are using DT,
which should provide valid configuration of IRQ type.

if not-DT - res.flags should be used.


regards,
-grygorii



