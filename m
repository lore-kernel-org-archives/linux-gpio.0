From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [REGRESSION] gpio: pxa: change initcall level second attempt
Date: Tue, 26 Jan 2016 21:41:25 +0100
Message-ID: <87y4bc845m.fsf@belgarion.home>
References: <1453598314.3178.12.camel@ziswiler.com>
	<87oac9ag32.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:41354 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751024AbcAZUl2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2016 15:41:28 -0500
In-Reply-To: <87oac9ag32.fsf@belgarion.home> (Robert Jarzmik's message of
	"Mon, 25 Jan 2016 15:28:33 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

>> Have you seen this as well or do you know how exactly that should be
>> worked around?
> Hi Marcel,
>
> I haven't seen that before on my devicetree boards, I will try this evening on
> top of next-20160125.
>
> Could you activate the debug logs in drivers/of/irq.c please, and send me
> privately your boot dmesg ? And I'd like to see your board .dts file and your
> .config also, to compare with mine for the mioa701.
>
> I think in your dm9000 case we have this callstack :
>  - of_irq_get()
>      of_irq_parse_one() => fails, for an unknown reason to me
>                         => I would have expected it return 0
>                         => the following irq_find_host() would return
>                            -EPROBE_DEFER, that's what I'd expect
>      irq_create_of_mapping()
>        irq_create_fwspec_mapping()
>          => error message
>
> What is probable is that gpio-pxa was not probed yet, and this triggers the
> error. What I don't understand is why you don't end up with -EPROBE_DEFER,
> that's why I'd like to have your logs.

BTW, would you try also with the patch at the end of this mail applied ? Just to
verify a wild guess.

Cheers.

-- 
Robert

---8<---
diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
index cf94b72dbacd..2c532011ae8e 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -1509,6 +1509,10 @@ dm9000_probe(struct platform_device *pdev)
 		goto out;
 	}
 
+	ndev->irq = platform_get_irq(pdev, 0);
+	if (ndev->irq < 0)
+		return ndev->irq;
+
 	db->irq_wake = platform_get_irq(pdev, 1);
 	if (db->irq_wake >= 0) {
 		dev_dbg(db->dev, "wakeup irq %d\n", db->irq_wake);
@@ -1570,7 +1574,6 @@ dm9000_probe(struct platform_device *pdev)
 
 	/* fill in parameters for net-dev structure */
 	ndev->base_addr = (unsigned long)db->io_addr;
-	ndev->irq	= db->irq_res->start;
 
 	/* ensure at least we have a default set of IO routines */
 	dm9000_set_io(db, iosize);
