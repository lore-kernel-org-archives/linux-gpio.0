Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAF0C54E94
	for <linux-gpio@archiver.kernel.org>; Thu, 26 Jan 2023 12:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237060AbjAZMl2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 26 Jan 2023 07:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236748AbjAZMl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 07:41:28 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D69126F1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 04:41:26 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-50112511ba7so21221267b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 04:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf5mwNyIhAmS7BcanhkZNeHv5W1oOYm/mfJbebJe4X0=;
        b=hAVlauBJdtqKIV8Q1qPegeXm+Bf6/qwZoOzNQZ0x9qS2rqCqX5spRM2mBMIoGwMYwJ
         E8k4iqm+1uEfBu0HNEdesxlx2TI/8dhrlcTTTdFHpyKDK1JAdq5Wn4eb3uQAEHkCpzdt
         +AFlgDv2iliaoomJwzHBZ4pyM80oFBXjWEDk8oL7bTMn15hZeAx0ZVCHdSbM8fyS4M4Y
         1kEv0h1gG7quwzQqDdwFNx86PfzSXmXuH4CVvP5pgwky/T2vhannKw2IQrsGx91MkO3X
         l0KPxllZuUB4ryDBhz4X/8+aQEuGiUORlVNpnkVclIt+H/8Ubh9+FZrOaSPWayjpwNOD
         /oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nf5mwNyIhAmS7BcanhkZNeHv5W1oOYm/mfJbebJe4X0=;
        b=iNBAIAN0J27IP70737AV9U0gAW41cKah8jNls7KPbMplFsNWp6OZZJdBWqHgRdyeqM
         bDjDLdUfBww0t2mJHXEm+CzXwNTVhv6mQ0DKSehsBgF2g2d7V6mEa1ZWln9gjrI1HZQk
         q+lH/qIARQhJyVistx5ATWnMAeXj4vc1RwVNAmtvG5dONmhxAcSWbUPNBeaNn2IdDeK8
         Vl7JfOaZvahYJ/W3camIwIqwJnoxcjGlmcNGSDpqDR7kPACHaDvBqfv73KUV7Zj930Bw
         3WDe+E2LfGR/IBrEQY8Xx0jjgEsJte7Euo9MtAOCFxtUpiA+NQ8aPB3WJNa6IxGH0zGT
         G73w==
X-Gm-Message-State: AO0yUKWuGBqqcO8GwSJkcl/d59+OFQow+4aoc8N6ruarCeygqM2KRLY8
        /rPEiYzQB+WBAkLEx2KH9XZYmz+cCEFYQRgyVnMAUQ==
X-Google-Smtp-Source: AK7set/xIl7nJOCYp6XmtbYMHKcEfVgXGSXeP8EKcJT0D/9K/9zMNrqeV4/NgbFy/UrJtoAn1fy5XmM2WhiVxiSiCgI=
X-Received: by 2002:a0d:e701:0:b0:506:66f5:fd24 with SMTP id
 q1-20020a0de701000000b0050666f5fd24mr924262ywe.130.1674736886013; Thu, 26 Jan
 2023 04:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20230113220703.45686-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230113220703.45686-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 13:41:14 +0100
Message-ID: <CACRpkdYWJ_=ZkVBDfXisSBeNgJCHQn-mikqd3YQTjMd0R2fLGQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: qcom: Unify accessing to device fwnode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2023 at 11:06 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The device fwnode can be get via dev_fwnode() getter.
> Use it where it makes sense.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
