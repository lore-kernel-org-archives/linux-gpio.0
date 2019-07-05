Return-Path: <SRS0=+c2y=VC=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF63CC0650E
	for <linux-gpio@archiver.kernel.org>; Fri,  5 Jul 2019 01:44:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5CF02189E
	for <linux-gpio@archiver.kernel.org>; Fri,  5 Jul 2019 01:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="m4FzD/dy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Um6GqYrv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfGEBoW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 4 Jul 2019 21:44:22 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55359 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726871AbfGEBoV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 21:44:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 45FEF4E3;
        Thu,  4 Jul 2019 21:44:20 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Thu, 04 Jul 2019 21:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=AC9iklpKIwYXIcd/uqSiNNW7KAX/fNS
        eGhQ1Hz/1+6s=; b=m4FzD/dyhZWL1rW8gSYdlRqfpBBXuzRLKF/2SV3d2CFkVki
        xT4NAWi/Vxg4aLNmV7bCm9Om1oBRHrKrC7j3GL7gvh46inDGEBp2Qp2yRq0Syx97
        zT3TCMrkrCTeuXdfyJ20TNqmvZdYw9nNl0bGCKiOy7QtQslsb8AalX+t+xfrMOL0
        Muan/4vtv0LfE6BNlfgOEQJcJ3OEGBw+24qIWZSvxZXnRpMqePtZLkQ2nAbZfuf3
        BosE5I2CVdKZKp7NRqcEpS/5MNeVDyJHVSb0UjiAP76obhG4ixWL747WVXHHxjB8
        +Sm+feXrVGWq4A4BVkzIiv+i19OAVPErPf1uugA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AC9ikl
        pKIwYXIcd/uqSiNNW7KAX/fNSeGhQ1Hz/1+6s=; b=Um6GqYrv5Ys3AdNcB0mMjY
        z6qiIw230NNPSVYt4UgvI2fHfkPdi6AafATzx/ZqQgt2PFFFrb8ap9jeI+LDKLlb
        JI+PQw6x8JYn0UbUX1ZkxsY7lh6REK1rQxgEbRPRmFUkO16NaEnnZY6dc/SdhZIY
        pSR4KQakV/OJA2c7HfxVkQIgItGGMxSGgR8k2hdTPwFm295gu6IOhgsJNvMFarfY
        CBlxY5+mx6IIFhakl/Lu13ImK9gpmDQeE57JDcYElHD2yHNwtAKikO9kyfQpLmMK
        ZGYYh3l1jf6k3nCsYkXZyB2T1YgOL93ehR2wd33rBuYUb1nnoi9wZw3Y5HwtD5yg
        ==
X-ME-Sender: <xms:cqseXWvG2Lxn5MKyZfi9o3Gm9VGDky7BeXbYHpjWdsYzXm_Lb3xH6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeefgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgpdhgohhoghhlvghsohhurhgtvgdrtghomhdpghhithhh
    uhgsuhhsvghrtghonhhtvghnthdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprg
    hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:cqseXdX1-Aldm5Jfo7AJj2CQ4tsKjHC0T8Xs2JqjBDiWDuCOMDTwNg>
    <xmx:cqseXW47mDPqSEqgRJPDbB4xWdeVz4wMt6TAnyd9uLlshxUAFWir3g>
    <xmx:cqseXRaLbzTCCKKucTtAXUQT14zErQ6f7lwG3vKZsJoFZ5dzKjY2eA>
    <xmx:c6seXV5ubfpdG_LnEC6CufQ0Y-iyh-BoA2QF4wk3c7mATwel8bXSyw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CEA41E00A2; Thu,  4 Jul 2019 21:44:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <2b5ceaf5-211b-4f7c-ab81-90a35de0aac6@www.fastmail.com>
In-Reply-To: <201907042014.2WXYWvdg%lkp@intel.com>
References: <201907042014.2WXYWvdg%lkp@intel.com>
Date:   Fri, 05 Jul 2019 11:44:14 +1000
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org,
        "kbuild test robot" <lkp@intel.com>
Subject: =?UTF-8?Q?Re:_[pinctrl:devel_72/79]_drivers/pinctrl/aspeed/pinctrl-aspee?=
 =?UTF-8?Q?d.h:547:28:_error:_field_'pinmux'_has_incomplete_type?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

On Thu, 4 Jul 2019, at 22:11, kbuild test robot wrote:
> tree:   
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> head:   eb0a2daa45b83d67b69a620243ed844e9dfa671b
> commit: efa5623981b72f6b5f95933d1c36ed2518c2ee4e [72/79] pinctrl: 
> aspeed: Split out pinmux from general pinctrl
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.4.0
> reproduce:
>         wget 
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout efa5623981b72f6b5f95933d1c36ed2518c2ee4e
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>

It looks like in fixing the SPDX churn you dropped the include from this hunk:

```
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index c5918c4a087c..11cc0eb6666b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -1,514 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2016 IBM Corp.
- */
+/* Copyright (C) 2016,2019 IBM Corp. */
 
 #ifndef PINCTRL_ASPEED
 #define PINCTRL_ASPEED
 
+#include "pinmux-aspeed.h"
+
```

It's missing here: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/diff/drivers/pinctrl/aspeed/pinctrl-aspeed.h?h=devel&id=efa5623981b72f6b5f95933d1c36ed2518c2ee4e

Should I send a fixup? Or do you want me to re-spin the series on top of
v5.2-rc1 and resend?

Andrew
