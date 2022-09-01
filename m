Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E5DC67868
	for <linux-gpio@archiver.kernel.org>; Thu,  1 Sep 2022 01:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbiIABaT (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 Aug 2022 21:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbiIAB3z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 21:29:55 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B352678
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 18:29:48 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id EA12890049B;
        Thu,  1 Sep 2022 09:29:45 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 0/2] gpio clock-names
Date:   Thu,  1 Sep 2022 09:29:39 +0800
Message-Id: <20220901012944.2634398-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaShpPVh5OTExCTRkYTx9MSFUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRg6Cjo*MT0zCU1RMQ8vFioK
        TClPCQFVSlVKTU1KQkJOTENNT0NMVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpJSkM3Bg++
X-HM-Tid: 0a82f6ab1f8c2eafkusnea12890049b
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add 'clock-names' for gpio dt nodes.

Jianqun Xu (2):
  dt-bindings: gpio: rockchip: add clock-names
  arm64: dts: rockchip: rk356x add 'clock-names' for gpio nodes

 .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml        | 6 ++++++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi                    | 5 +++++
 2 files changed, 11 insertions(+)

-- 
2.25.1

