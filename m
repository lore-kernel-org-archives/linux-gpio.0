From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: ipq4019: add remaining pin definitions
Date: Wed, 17 May 2017 12:24:20 -0700
Message-ID: <20170517192420.GE12920@tuxbook>
References: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey@googlemail.com>
 <3dac044cd9a879cad145f9a04dcc3d225721aa3c.1494415174.git.chunkeey@googlemail.com>
 <20170510222328.GD45273@Bjorns-MacBook-Pro-2.local>
 <2990002.PvbIJhg18q@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f48.google.com ([74.125.83.48]:35761 "EHLO
        mail-pg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbdEQTYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2017 15:24:19 -0400
Received: by mail-pg0-f48.google.com with SMTP id q125so11461256pgq.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2017 12:24:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <2990002.PvbIJhg18q@debian64>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: John Crispin <john@phrozen.org>, linux-gpio@vger.kernel.org, Ram Chandra Jangir <rjangir@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, chrisrblake93@gmail.com

On Wed 17 May 08:44 PDT 2017, Christian Lamparter wrote:

> On Wednesday, May 10, 2017 3:23:28 PM CEST Bjorn Andersson wrote:
> > On Wed 10 May 04:27 PDT 2017, Christian Lamparter wrote:
> > 
> > > From: Ram Chandra Jangir <rjangir@codeaurora.org>
> > > 
> > > Populate default values for various GPIO functions.
> > > 
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: John Crispin <john@phrozen.org>
> > > Signed-off-by: Ram Chandra Jangir <rjangir@codeaurora.org>
> > 
> > Thanks Christian for attempting to forward this, when doing so you
> > should add your sob here.
> Ok, will do that.
> 
> > I do however have some comments and requests for changes. @Ram would you
> > be interested in this feedback and be willing to work on getting these
> > additions upstream? Or do you have the ability to do this Christian?
> I think this was enough time for Ram to comment.
> 
> @Bjorn, can you tell me what you want to see changed? 

I just wanted to make sure that someone was willing to follow up on my
code review before spending the time looking through it.

> I didn't see any commments in the reply. As for my ability: I can do
> development on my two customer routers: IPQ4018 (AVM FB4040) and IPQ4019
> (Asus RT-AC58U). Furthermore, I can ask Chris Blake, he owns a IPQ4029
> (Meraki MR33).
>  
> This should cover Ethernet (RMGII, PSGMII, MDIO and MDC), NAND,
> PCIe, SPI0, UART0/1, I2C0/1. If John is willing to join, he could
> verify emmc/sdio.
> 

I'm happy with this, will take a look at your patch!

> Thanks,
> Christian
> 
> PS.: Last week, Ram has posted a update to pinctrl:
> <http://www.mail-archive.com/lede-dev@lists.infradead.org/msg07387.html>
> |From e77af7de404eb464f7da9e0daeb8b362cc66a7ba Mon Sep 17 00:00:00 2001
> |From: Ram Chandra Jangir <rjan...@codeaurora.org>
> |Date: Tue, 9 May 2017 11:45:00 +0530
> |Subject: [PATCH] msm: pinctrl: Add support to configure ipq40xx GPIO_PULL bits
> |
> |GPIO_PULL bits configurations in TLMM_GPIO_CFG register
> |differs for IPQ40xx from rest of the other qcom SoC's.
> |This change add support to configure the msm_gpio_pull
> |bits for ipq40xx, It is required to fix the proper
> |configurations of gpio-pull bits for nand pins mux.
> |
> |IPQ40xx SoC:
> |2'b10: Internal pull up enable.
> |2'b11: Unsupport
> |
> |For other SoC's:
> |2'b10: Keeper
> |2'b11: Pull-Up
> |[...]
> I'll add this to the series as well.
> 

I will give this some more thought, but initially I think the proposed
solution is too verbose for my taste- so far this is the only platform
I've seen having this.

I think I would prefer if we extend the msm_pinctrl_soc_data with a
single

  bool pull_no_keeper;

and then check if this is set in the four places that matters
pinctrl-msm.

Regards,
Bjorn
