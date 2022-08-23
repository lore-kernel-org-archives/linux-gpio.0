Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD7EC32772
	for <linux-gpio@archiver.kernel.org>; Tue, 23 Aug 2022 21:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiHWVLX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 23 Aug 2022 17:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiHWVLV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Aug 2022 17:11:21 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B826327;
        Tue, 23 Aug 2022 14:11:20 -0700 (PDT)
Received: from notapiano (unknown [194.36.25.10])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B87756601E70;
        Tue, 23 Aug 2022 22:11:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1661289079;
        bh=lLnMaZZflBxCYdoKWtTlOD8pDUrS+qFNIuEnJudAl7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fKGcXcLUGm9OpaNnHVYXblbNVLHKqpXKQ4HYpuQOYiQhe0zZfuM7yBz78B6kMpuva
         MEyrhO/RnO3E87SVhpJhHqd5qLt7LTo69EDkRNFLKg6Nb3P3zl5Xu+U0LgradLoWsf
         sk+6X0Ol+vtT4jnHKjNfAHOWS75Le0aJLNrJrKVYdWljAUKUqH6FPiMywHlTok4HW7
         0YpUUdD14TaearV9knf09rFY7fqbdO+Zf8zBk4Z+LJZbFaN/i3NictTM7hFyRMZA8s
         /nfXRBtbj9odaeR+mq4KY1vUvd/dC8uSUDWZXPLHrgwI1VTpLYzy05Pit0aMifhnYU
         tr5Div+4yA/tg==
Date:   Tue, 23 Aug 2022 17:11:11 -0400
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Hui Liu <hui.liu@mediatek.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@google.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com,
        sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] pinctrl: mediatek: add mt8188 driver
Message-ID: <20220823211111.k2ve5yceie7knyi7@notapiano>
References: <20220818075012.20880-1-hui.liu@mediatek.com>
 <20220818075012.20880-3-hui.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220818075012.20880-3-hui.liu@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 18, 2022 at 03:50:12PM +0800, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add pinctrl driver support for MediaTek SoC mt8188.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
