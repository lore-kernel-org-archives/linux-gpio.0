Return-Path: <SRS0=sbuz=7X=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD11C433DF
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Jun 2020 07:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE105206C3
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Jun 2020 07:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpPET0xC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgFJH5o (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 Jun 2020 03:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJH5n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 03:57:43 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420BAC03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 00:57:43 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h188so889540lfd.7
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0KyoP79CsKr5AT7aKPpGNvSLAzpD8FQ9m1dHvM/WUr0=;
        b=QpPET0xCUQTnBo8sa6xbnJ8D/8aIwjrpMM3eQHGQvdqhEe6XAQZRTlGGtSwBAAVw1O
         CtPTV0skN31lu01Djp22/ZHJEAfA1Gzl8bi+bnSo8BEbFlkDw2CNuvtZl/thHE0z/gPg
         1qsD6oggAf62tE4B8Nd9Y+UaSX1F4evj1aQ7K7id2nHosPq6kUgw5EpeNBB7lJVH4xTg
         XyJKOFP3We62xACTICfhirm9zAdyvSFscr2vHLfCLf7uDq+I94sppk84YPEy70Z7X/KX
         3RTJJP+qKfLdEcjKHy5nzcqD4gyyHMHUMYxYP+aRxqYJKip4fDw2mYmQfQdCvTFNq3Dv
         MfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0KyoP79CsKr5AT7aKPpGNvSLAzpD8FQ9m1dHvM/WUr0=;
        b=nkCSZXaoL4XJaLNf+ghRNSx853v1rbyiv9WDcRQ4Ng7MYrgQHEmC63mw9AFhaY3dhD
         77A/s+CAfJPhQbtLi9c8m4dD38h2l7zOhbUZodB/Sma0DHZ8Ht00c5OthHgytgKAZsYk
         25L1in+8CAQ162g1yAFm4uMYwWN+uMjAMb/K9wMrnLYohrqED1Zu3lvwNWFyWqbQ3RZW
         VeBrNTtKfpVegbxIGdQNEWwxTYfKoSVyXoqRjr7W7TyE4xX7qOon7K28JC2u+d8E67C3
         8cspQU2HzqiQ/xNn/eDM+QcJGYrovbU/7m0y8L+FfbYhox4cbk97nNdaYUpsS5+1kyLb
         XWqw==
X-Gm-Message-State: AOAM533Qpke0fHsrcfHqF+VhX0C5KAHkcc02wDX4r1OLlb60LkPXMwDS
        8n/bqhXsfBLhGtBIMjAomSR689zSLOzzB5+1Ce4oJA==
X-Google-Smtp-Source: ABdhPJyp19NYX18/LcwZHQGRy2EwAvHrg7uVVDnSTzR8wy+N/7ZSuVfbDKsiF9pG3pZk0xyBsnAmlG3Kd0+6ExKV6Fo=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr1018533lfn.77.1591775861710;
 Wed, 10 Jun 2020 00:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200604002817.667160-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20200604002817.667160-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 09:57:30 +0200
Message-ID: <CACRpkdY5gqO24=-R=QZuvXgYvpv4noHwTrfCEJC=bdnZb3iQ0Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: fix warning about irq chip reusage
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Patch Tracking <patches@linaro.org>,
        linaro-kernel <linaro-kernel@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 4, 2020 at 2:28 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Fix the following warnings caused by reusage of the same irq_chip
> instance for all spmi-gpio gpio_irq_chip instances. Instead embed
> irq_chip into pmic_gpio_state struct.
>
> gpio gpiochip2: (c440000.qcom,spmi:pmic@2:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip3: (c440000.qcom,spmi:pmic@4:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip4: (c440000.qcom,spmi:pmic@a:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Patch applied.

Yours,
Linus Walleij
