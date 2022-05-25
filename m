Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D5DC433FE
	for <linux-gpio@archiver.kernel.org>; Wed, 25 May 2022 15:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242262AbiEYP50 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 25 May 2022 11:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbiEYP5X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 11:57:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7755F8F5;
        Wed, 25 May 2022 08:57:22 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id 0D3EB1F45155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1653494241;
        bh=keaPZajLO694U70uhGq8U44vTxGJZt9Iw2KHBP80PJU=;
        h=From:To:Cc:Subject:Date:From;
        b=Vyu0Qh5cZGMhgqCtx+m2WgNsyFLV54cPirMXvdq4Afp+0U5utq+wV8xhpJETIszPQ
         C4pJo3oOuJGsoJxNVMpGKqobUHkRBlpunN5X+A8E9wzBo26ntiMBxEAvg1QtBa2f/B
         iLTJ5wi1cwGM+HGNqAR6bWqcQ3zsNUnZnpWdyTQfYLFu2s2ilTMV7WAKrSLnOXyW5O
         8KO82ixXX5tbR04/wCnWwjqJowhgLS872Qae7yawfxSFAE2q2tPOE/9gtiZ0ulFlel
         voT1OJX9nYhDOpUcbgchLH7ErffAhmd/b5eRMno7FXmk0j+0Mee/qYFATuolKfYsRv
         NC9IK9KZAbqBA==
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/2] MT8192 pinctrl properties adjustments
Date:   Wed, 25 May 2022 11:57:12 -0400
Message-Id: <20220525155714.1837360-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


The two patches in this series substitute properties in the mt8192
pinctrl dt-binding for ones which have a clearer meaning and are more
standardized. At this point there's no DT using the mt8192 pinctrl
binding, so if such changes are to be made, they need to happen now.


Nícolas F. R. A. Prado (2):
  dt-bindings: pinctrl: mt8192: Add drive-strength-microamp
  dt-bindings: pinctrl: mt8192: Use generic bias instead of pull-*-adv

 .../bindings/pinctrl/pinctrl-mt8192.yaml      | 58 ++++++-------------
 1 file changed, 18 insertions(+), 40 deletions(-)

-- 
2.36.1

