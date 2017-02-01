From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Wed, 01 Feb 2017 14:47:29 +0200
Message-ID: <2049686.qZKl7DmctL@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <fd107367-caf5-0817-6a02-352f5af0dbb8@jmondi.org> <SG2PR06MB1165749A38E25572B7B548D18A4A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:42766 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751352AbdBAMrK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 07:47:10 -0500
In-Reply-To: <SG2PR06MB1165749A38E25572B7B548D18A4A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: jacopo mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Chris,

On Tuesday 31 Jan 2017 13:48:57 Chris Brandt wrote:
> On  Tuesday, January 31, 2017, Jacopo Mondi wrote:
> >> Since one of the benefits of using devm_kzalloc is that if the probe
> >> fails and returns an error, all the memory associated with that device
> >> will automatically get freed, you 'might' not need this code to free
> >> memory.
> >> 
> >> I say might because I'm not sure if returning an error here will kill
> >> the driver or not. But, might be interesting to look into.
> > 
> > No, returning an error here would not kill the driver BUT if
> > dt_node_to_map fails, dt_free_map is called immediately later [1]
> > 
> > So here we maybe should not use device managed memory as it does not bring
> > anything, do not free *map as it is freed later in dt_free_map, but
> > release fngrps mux_modes and grpins, as we lose reference to them outside
> > the scope of this function.
> > 
> > Do you agree?
> 
> Like you said, there is no benefit one way of the other.
> 
> But, doing a grep of the pinctrl directory, devm_kzalloc is used more by
> the other drivers than kzalloc, so maybe we just stick with devm_kzalloc
> 
>    (baah goes the sheep)

Given that the devm_*() functions incur an overhead, let's use kzalloc/kfree 
directly.

-- 
Regards,

Laurent Pinchart

