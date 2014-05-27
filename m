From: "Zhu, Lejun" <lejun.zhu@linux.intel.com>
Subject: Re: [PATCH v4] gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Tue, 27 May 2014 16:56:39 +0800
Message-ID: <53845347.5020205@linux.intel.com>
References: <1400810423-14067-1-git-send-email-lejun.zhu@linux.intel.com> <CAAVeFu+F=nHDCpL6Vfmq26QNr74mfRD5p9at_osB3R97v7xBSA@mail.gmail.com> <538459E8.6010701@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:10850 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751705AbaE0I4o (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 27 May 2014 04:56:44 -0400
In-Reply-To: <538459E8.6010701@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jacob.jun.pan@linux.intel.com, bin.yang@intel.com



On 5/27/2014 5:24 PM, Grygorii Strashko wrote:
> Hi Lejun,
> 
> On 05/27/2014 08:38 AM, Alexandre Courbot wrote:
>> On Fri, May 23, 2014 at 11:00 AM, Zhu, Lejun <lejun.zhu@linux.intel.com> wrote:
>>> +static int crystalcove_gpio_probe(struct platform_device *pdev)
>>> +{
>>> +       int irq = platform_get_irq(pdev, 0);
> 
> Pls note, that platform_get_irq() may return error code.

Thank you. I'll fix it.

> 
> devm_gpiochip_add? ;)
> 

Huh? Can't find the API...

>>> +
>>> +       if (retval) {
>>> +               dev_warn(&pdev->dev, "request irq failed: %d\n", retval);
>>> +               goto out;
>>> +       }
>>> +
>>> +       retval = gpiochip_add(&cg->chip);
>>> +       if (retval) {
>>> +               dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
>>> +               goto out_free_irq;
>>> +       }
> 
> As to my mind, It'll be better to setup IRQ as last probing step and
> free it as the first step of driver removing.

Mika suggested this order. Please see his mail for the reason. Is there
anything bad might happen if I setup IRQ first then do gpiochip_add?

Best Regards
Lejun
