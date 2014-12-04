From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: Requesting different interrupt triggers for the same device type
Date: Thu, 04 Dec 2014 09:27:19 +0100
Message-ID: <1646345.4akWfRNnkY@ws-stein>
References: <4282463.CMMRv84cbI@ws-stein> <547EEEAA.4040605@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:50233 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752493AbaLDIZP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Dec 2014 03:25:15 -0500
In-Reply-To: <547EEEAA.4040605@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-gpio@vger.kernel.org

Hello Grygorii,

On Wednesday 03 December 2014 13:06:18, Grygorii Strashko wrote:
> On 12/02/2014 06:45 PM, Alexander Stein wrote:
> > Hi,
> >
> > I have a board which has two PCA9555 attached. Due to hardware wirings each has a different interrupt trigger. One is active low and one is active high and each has a different interrupt parent.
> > How can I specify this in the device tree? Do I need to set IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_LEVEL_HIGH approriately? How can this work, when the driver requests the interrupt like this?
> >> ret = devm_request_threaded_irq(&client->dev,
> >> 			client->irq,
> >> 			NULL,
> >> 			pca953x_irq_handler,
> >> 			IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> >> 			IRQF_SHARED,
> >> 			dev_name(&client->dev), chip);
> >
> > The interrupt flags seem rather fixed. Any comments/hints?
> 
> See, http://www.spinics.net/lists/linux-gpio/msg02731.html
> It may help.

Well, removing that trigger here (and in another driver where INT line is shared) it "works". It seems that each (DT-) driver should remove those explicit flags, no?

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein

SYS TEC electronic GmbH
Am Windrad 2
08468 Heinsdorfergrund
Tel.: 03765 38600-1156
Fax: 03765 38600-4100
Email: alexander.stein@systec-electronic.com
Website: www.systec-electronic.com
 
Managing Director: Dipl.-Phys. Siegmar Schmidt
Commercial registry: Amtsgericht Chemnitz, HRB 28082

