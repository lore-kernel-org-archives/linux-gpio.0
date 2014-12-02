From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Requesting different interrupt triggers for the same device type
Date: Tue, 02 Dec 2014 17:45:53 +0100
Message-ID: <4282463.CMMRv84cbI@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:50051 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932436AbaLBQnv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Dec 2014 11:43:51 -0500
Received: from imapserver.systec-electronic.com (unknown [212.185.67.148])
	by webbox1416.server-home.net (Postfix) with ESMTPA id 1239E27A580
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2014 17:43:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by imapserver.systec-electronic.com (Postfix) with ESMTP id 19245DA0C51
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2014 17:43:50 +0100 (CET)
Received: from imapserver.systec-electronic.com ([127.0.0.1])
	by localhost (imapserver.systec-electronic.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Esw6zbMWO5K for <linux-gpio@vger.kernel.org>;
	Tue,  2 Dec 2014 17:43:48 +0100 (CET)
Received: from ws-stein.localnet (unknown [192.168.10.109])
	by imapserver.systec-electronic.com (Postfix) with ESMTPA id 07BE1DA0AD2
	for <linux-gpio@vger.kernel.org>; Tue,  2 Dec 2014 17:43:48 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,

I have a board which has two PCA9555 attached. Due to hardware wirings each has a different interrupt trigger. One is active low and one is active high and each has a different interrupt parent.
How can I specify this in the device tree? Do I need to set IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_LEVEL_HIGH approriately? How can this work, when the driver requests the interrupt like this?
> ret = devm_request_threaded_irq(&client->dev,
> 			client->irq,
> 			NULL,
> 			pca953x_irq_handler,
> 			IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> 			IRQF_SHARED,
> 			dev_name(&client->dev), chip);

The interrupt flags seem rather fixed. Any comments/hints?

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
