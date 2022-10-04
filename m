Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB237C433FE
	for <linux-gpio@archiver.kernel.org>; Tue,  4 Oct 2022 07:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiJDHpg (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 4 Oct 2022 03:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiJDHpe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 03:45:34 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16CE22BC5
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 00:45:32 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id f1so9529888ejw.7
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dEKMgKTBl4A3pP4kKEL9qEFFZNZP/ek6muw2I56Mj9U=;
        b=W0S9VwDzs4n/ewPMTIVFI0DJE+9CaTsuhqfWJKtb6XnCrhPQ79EbyEq+nVXeqg5LuN
         JwHL+gJPs+FF1wqt9t04IMVpbfUiwUDEy/ivZPk2UaAdp597eS6MugwORxIm2jgG9ORg
         U/J0aRuk2Q01zvU/lFxU2UNdyVRPOSt1hEs0ZgeNyMi4ype+440ze3C82MhaSyBp5V35
         U3ZmYOLVN/sgvD6PJOP+mfI8N0yskv4ZfSCmjkwUO8wjjuJ9p8NklCdGyzXTVUUWUG9a
         uobCSBtyg9RrX3YkQwF53fA8gas1f8anYCV2AKPS1Xee5M0ELZd/X1kwF+k2q8KK7eOt
         CqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dEKMgKTBl4A3pP4kKEL9qEFFZNZP/ek6muw2I56Mj9U=;
        b=JjRh+8viLzwbvP8d1ly08rsTfXwLcVYmP4T9NX2dgFKvq77Cd8a0GHGlfqVrLRf9vQ
         W7fWtE32M+0YydTs0Q9SrDQG1ZwW2irEu//QoPoHBY7KoNKnQNHkTpCw162zdhhAacsI
         BFa4sTSmUarlA12tx7AKo7ZE97rTCQvSJgrQsXPGphJ3y6SnAheZQOznzXFDqDTQ8iQq
         mrIV9AOfNHPn38WcSJkTnNuAvoQC7+4S7mSQUxFqJprM/MLxI5MpxebgUv+0avhmbzEs
         njEYfORAioNd/4l2qTO4nX0OBZvXd7J0N23HZVeMDUF4Q1Z1GnyrbPRLKf4CAMwfxWys
         mNuA==
X-Gm-Message-State: ACrzQf13XV/1soqgiH9qXY8AJh50aUqwq3Tl20qy3Shz/WZlunwdg0Ta
        cJU4bOuH/71EJli5a0+n91tpf+Fc/gAHYQ6oi00rRA==
X-Google-Smtp-Source: AMsMyM6ZaA9sSj93fKwqMRRMNd1lgsDORY6G8HCgFU5dqNaEHX3TC2z9gjgTF/W6gs1cdiYAMihH7+UuEcnthdCPhdY=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr18124729ejc.440.1664869531260; Tue, 04
 Oct 2022 00:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220928092937.27120-1-zhang.lyra@gmail.com> <20220928092937.27120-3-zhang.lyra@gmail.com>
In-Reply-To: <20220928092937.27120-3-zhang.lyra@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 09:45:20 +0200
Message-ID: <CACRpkdar4-xPyVCtUoZQv=RERBhMV3Zi__y0deSgOTFkh8Y5xA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: gpio: Add compatible string for Unisoc UMS512
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 28, 2022 at 11:29 AM Chunyan Zhang <zhang.lyra@gmail.com> wrote:

> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
>
> UMS512 use the same GPIO and EIC controller with SC9860, so this
> patch adds compatible string for UMS512 directly.
>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
