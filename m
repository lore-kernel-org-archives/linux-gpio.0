From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/3] gpio: gpio-rz: GPIO driver for Renesas RZ series
Date: Thu, 12 Jan 2017 20:13:35 +0100
Message-ID: <446d1be5-03f5-41ac-2b3e-8061a3b6ceec@jmondi.org>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <1483990318-26927-3-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdbMVu1pe9fYf+DRsnm7Uy_S3T+TONs5qKYWXOLfLDJzwQ@mail.gmail.com>
 <a837aa4e-4f77-b29f-2032-c4005f984261@jmondi.org>
 <SG2PR06MB11655053AB845CD1BD8B61FE8A790@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:58045 "EHLO
        slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750860AbdALTZ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2017 14:25:29 -0500
In-Reply-To: <SG2PR06MB11655053AB845CD1BD8B61FE8A790@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Chris,

On 12/01/2017 15:39, Chris Brandt wrote:
> Hi Jacopo,
>
> On Thursday, January 12, 2017, jacopo mondi wrote:
>> To read the pin direction I would need to add one more register to the
>> "reg" property range provided in the DTS.
>> This is of course doable, but I would have two questions here:
>> - why did you chose to use PMSR register instead of reading/writing
>> directly to PM? Am I missing something?
>
>
> I guess you can still use the PMSR register to get the current direction
> of the I/O pin. According to the HW manual:
>
> "When reading, the higher 16 bits are read as 0000H. The lower 16 bits
>  are read as the value of the PMn register."
>

Oh! That's weird I don't have that statement in my manual (public 
version R01UH0403EJ0060 Rev.0.60)

The only description for PMSR I have is:

"This register provides an alternative method for writing data to the 
PMn register.
The higher 16 bits of the PMSRn register specify whether data can be 
written to the PMn.PMnm bit specified by the
lower 16 bits of the PMSRn register."

So I assumed it was one direction only

>
> While the PMSR register is a cool idea of having a special register that
> can change a single port pin direction without doing a read-modify-write
> by the CPU, it doesn't seem to be a standard option in Renesas SoCs (well,
> except for the older NEC V850 parts where this PFC HW came from).
> So a more traditional method of just using the Pmn register seems to be
> more compatible across Renesas SoCs.
>
>
> Chris
>

