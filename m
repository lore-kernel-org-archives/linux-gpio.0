From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: 104-idio-16: Use lowercase symbol names for const variables
Date: Mon, 9 Nov 2015 15:09:56 +0900
Message-ID: <CAAVeFuKpu3gtTwS6OMZiFEE7vrKEjrgnptXFbq+JqYKP0aBmDg@mail.gmail.com>
References: <20151104123008.GA15302@sophia> <CAAVeFuJT7uxbQ_rf2o=6w4Ub3aW4Lhn_ED_JQZ+TNpORAVom8A@mail.gmail.com>
 <563FF6C3.4000009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:35375 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751068AbbKIGKR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2015 01:10:17 -0500
In-Reply-To: <563FF6C3.4000009@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Nov 9, 2015 at 10:28 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
> On 11/08/2015 06:53 PM, Alexandre Courbot wrote:
>> Apart from that this patch seems harmless and the repositioning of
>> some constant declarations is also welcome.
>
> I'll create a separate patch to reposition the constant declarations. Where in
> particular do you believe would be best for them to be positioned?

I was talking about what you did here:

@@ -109,24 +109,23 @@ static int __init idio_16_probe(struct
platform_device *pdev)
 {
        struct device *dev = &pdev->dev;
        struct idio_16_gpio *idio16gpio;
+       const unsigned base = idio_16_base;
+       const unsigned extent = 8;
+       const char *const name = dev_name(dev);
        int err;

-       const unsigned BASE = idio_16_base;
-       const unsigned EXTENT = 8;
-       const char *const NAME = dev_name(dev);

So this is already done - sorry for not having been clear.
