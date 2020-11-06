Return-Path: <SRS0=N38l=EM=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ABFC388F2
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Nov 2020 09:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B66621734
	for <linux-gpio@archiver.kernel.org>; Fri,  6 Nov 2020 09:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgKFJrv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 6 Nov 2020 04:47:51 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:46902 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgKFJrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 04:47:41 -0500
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id B5EED3AB9BF
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 09:31:43 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4CF1C240013;
        Fri,  6 Nov 2020 09:31:20 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/4] Extend pinctrl ocelot driver to support other SoCs
Date:   Fri,  6 Nov 2020 10:31:14 +0100
Message-Id: <20201106093118.965152-1-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Ocelot SoC belongs to a larger family of SoCs which use the same
interrupt controller with a few variation.

This series of patches add support for Luton and Serval, they are all
MIPS based.

The first patches of the series also updates the binding documentation
with the new compatible strings.

Gregory

Gregory CLEMENT (2):
  dt-bindings: pinctrl: ocelot: Add Luton SoC support
  dt-bindings: pinctrl: ocelot: Add Serval SoC support

Lars Povlsen (2):
  pinctrl: ocelot: Add support for Luton platforms
  pinctrl: ocelot: Add support for Serval platforms

 .../bindings/pinctrl/mscc,ocelot-pinctrl.txt  |   3 +-
 drivers/pinctrl/pinctrl-ocelot.c              | 184 ++++++++++++++++++
 2 files changed, 186 insertions(+), 1 deletion(-)

-- 
2.28.0

