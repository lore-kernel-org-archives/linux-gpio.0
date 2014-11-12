From: Naitik Amin <naitik.amin@ametek.com>
Subject: gpio-pca953x.c
Date: Wed, 12 Nov 2014 14:54:18 +0000 (UTC)
Message-ID: <loom.20141112T153203-751@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:51299 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752832AbaKLPKI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 12 Nov 2014 10:10:08 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glg-linux-gpio@m.gmane.org>)
	id 1XoZYa-0000BF-95
	for linux-gpio@vger.kernel.org; Wed, 12 Nov 2014 16:10:07 +0100
Received: from adsl-070-147-034-178.sip.bct.bellsouth.net ([70.147.34.178])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2014 16:10:04 +0100
Received: from naitik.amin by adsl-070-147-034-178.sip.bct.bellsouth.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2014 16:10:04 +0100
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

HI there,

I am trying to use the gpio driver for pca953x with IRQ enabled config. When 
the device gets probbed, I gives me an error saying :
"failed to set trigger mode 8"

The probe called,
ret = devm_request_threaded_irq(&client->dev,
					client->irq,
					   NULL,
					   pca953x_irq_handler,
					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
					   dev_name(&client->dev), chip);

with IRQF_TRIGGER_LOW as a flag

I did some tracing and found out, irq set type, went to gic_set_type in irq-
gic.c ( http://lxr.free-electrons.com/source/drivers/irqchip/irq-gic.c#L187 )

But gic_set_type, only wants to see either IRQF_TRIGGER_HIGH OR 
IRQF_TRIGGER_LOW, thats why it returned.

Questions
1. Is it correct that irq set type went to gic_set_type, bcoz pca953x does 
provide one of itself.




